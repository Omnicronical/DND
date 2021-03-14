//
//  MessageSelectorViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 17/02/2021.
//  Copyright © 2021 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MessageSelectorViewController: UITableViewController {
    
    override func viewDidLoad() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessengerCell", for: indexPath)
        cell.textLabel?.text = "test"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ChatViewController", creator: { coder in
            return ChatViewController(coder: coder)
        }) else {
            fatalError("Failed to Load Messages")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
