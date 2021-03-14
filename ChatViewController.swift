//
//  ChatViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 17/02/2021.
//  Copyright © 2021 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        loadMessages()
        
    }
    
    func loadMessages() {
        
        
        db.collection("messages").order(by: "timestamp").addSnapshotListener { (querySnapshot, error) in
            
            self.messages = []
            
            if let e = error{
                print("ERROR")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    print(snapshotDocuments)
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let sender = data["sender"] as? String, let body = data["body"] as? String {
                            let newMessage = Message(sender: sender, body: body)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                            
                        }
                        
                    }
                }
            }
        }
    }
    
    @IBAction func sendMessageButtonPressed(_ sender: UIButton) {
        
        if let messageBody = textBox.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection("messages").addDocument(data: [
                "sender": messageSender,
                "body": messageBody,
                "timestamp": Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("ERROR")
                } else {
                    print("DATA SAVED")
                }
            }
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(white: 0.5, alpha: 1.0)
            cell.label.textColor = UIColor(white: 0.0, alpha: 1.0)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(white: 0.7, alpha: 1.0)
            cell.label.textColor = UIColor(white: 0.0, alpha: 1.0)
        }
        
        
        
        return cell
    }
    
    
}



