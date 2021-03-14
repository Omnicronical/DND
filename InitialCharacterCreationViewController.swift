//
//  InitialCharacterCreationViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 04/10/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit

class InitialCharacterCreationViewController: UIViewController {
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var characterNameTextBox: UITextField!
    @IBOutlet weak var automatedCharacterCreationYesOrNo: UISegmentedControl!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var fb = FirebaseClass.init()
        NSLog("TEST", "")
        
    }
    
    @IBAction func confirmButtonPushed(_ sender: Any) {
        if characterNameTextBox.hasText {
            let characterName = characterNameTextBox.text
            let isAutomated = automatedCharacterCreationYesOrNo.selectedSegmentIndex
            if isAutomated == 0 {
                guard let vc = storyboard?.instantiateViewController(identifier: "RaceTableViewController", creator: { coder in
                    return RaceTableViewController(coder: coder, name: characterName!)
                }) else {
                    fatalError("Failed to Load Race Table")
                }
        
                navigationController?.pushViewController(vc, animated: true)
            } else {
                var generator = AutomatedCharacterCreation()
                let character = generator.generateCharacter(name: characterName!)
                guard let vc = storyboard?.instantiateViewController(identifier: "CharacterSheetViewController", creator: { coder in
                    return CharacterSheetViewController(coder: coder, character: character)
                }) else {
                    fatalError("Failed to Load Character Sheet")
                }
        
                navigationController?.pushViewController(vc, animated: true)
            }
            
            
            
        } else {
            let validationAlert = UIAlertController(title: "ERROR", message: "Your character has no name", preferredStyle: .alert)
            
            validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(validationAlert, animated: true)
        }
    
    }
   
       
    
}
