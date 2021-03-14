//
//  ViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 16/09/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

var recommendedArray: [(String, Int)] = [("", 0)]

func addToRecommendedArray(item: String) {
    var repeated = false
    if recommendedArray[0].0 == "" {
        recommendedArray[0].0 = item
        recommendedArray[0].1 = 1
    } else if recommendedArray[0].0 != "" {
        for i in (0...recommendedArray.count-1){
            if recommendedArray[i].0 == item {
                recommendedArray[i].1 += 1
                repeated = true
            }
            
        }
        
        if repeated != true {
            recommendedArray.append((item, 1))
        }
    }
    
}

import UIKit
import Firebase

class MYViewController: UIViewController {

    @IBOutlet weak var signingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func recommendedButtonPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "RecommendationTableViewController", creator: { coder in
            return RecommendationTableViewController(coder: coder)
        }) else {
            fatalError("Failed to Load Recommendation Table")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func SignInButtonPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SignInViewController", creator: { coder in
            return SignInViewController(coder: coder)
        }) else {
            fatalError("Failed to Load Sign In")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func SignOutButtonPressed(_ sender: Any) {
        do { try Auth.auth().signOut() }
            catch { print("already logged out") }
        if Auth.auth().currentUser != nil {
          print("LOGGED IN")
       
        } else {
          print("NOT LOGGED IN")
          
        }
        
    }
    
}

