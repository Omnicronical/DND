//
//  AbilityScoresViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 05/10/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit

class AbilityScoresViewController: UIViewController {
    
    
    @IBOutlet weak var strengthOutlet: UITextField!
    @IBOutlet weak var dexterityOutlet: UITextField!
    @IBOutlet weak var constitutionOutlet: UITextField!
    @IBOutlet weak var intelligenceOutlet: UITextField!
    @IBOutlet weak var wisdomOutlet: UITextField!
    @IBOutlet weak var charismaOutlet: UITextField!
    
    var strValue = -1
    var dexValue = -1
    var conValue = -1
    var intValue = -1
    var wisValue = -1
    var chaValue = -1
    
    
    
    
    var name : String
    var selectedRace: Race
    var selectedClass: String
    
    required init?(coder: NSCoder, selectedRace: Race, name: String, selectedClass: String) {
        self.name = name
        self.selectedRace = selectedRace
        self.selectedClass = selectedClass
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func confirmButtonPushed(_ sender: Any) {
        
        if strengthOutlet.hasText {
            let check = strengthOutlet.text
            let intCheck = Int(check!) ?? -1
            if (intCheck >= 0) && (intCheck < 21) {
                strValue = intCheck
            } else {
                let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter a Valid Ability Score", preferredStyle: .alert)
                
                validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(validationAlert, animated: true)
            }
            
        } else {
            let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter All Ability Scores", preferredStyle: .alert)
            
            validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(validationAlert, animated: true)
        }
        
        
        if dexterityOutlet.hasText {
            let check = dexterityOutlet.text
            let intCheck = Int(check!) ?? -1
            if (intCheck >= 0) && (intCheck < 21) {
                dexValue = intCheck
            } else {
                let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter a Valid Ability Score", preferredStyle: .alert)
                
                validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(validationAlert, animated: true)
            }
            
        } else {
            let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter All Ability Scores", preferredStyle: .alert)
            
            validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(validationAlert, animated: true)
        }
        
        
        if constitutionOutlet.hasText {
            let check = constitutionOutlet.text
            let intCheck = Int(check!) ?? -1
            if (intCheck >= 0) && (intCheck < 21) {
                conValue = intCheck
            } else {
                let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter a Valid Ability Score", preferredStyle: .alert)
                
                validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(validationAlert, animated: true)
            }
            
        } else {
            let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter All Ability Scores", preferredStyle: .alert)
            
            validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(validationAlert, animated: true)
        }
        
        
        if intelligenceOutlet.hasText {
            let check = intelligenceOutlet.text
            let intCheck = Int(check!) ?? -1
            if (intCheck >= 0) && (intCheck < 21) {
                intValue = intCheck
            } else {
                let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter a Valid Ability Score", preferredStyle: .alert)
                
                validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(validationAlert, animated: true)
            }
            
        } else {
            let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter All Ability Scores", preferredStyle: .alert)
            
            validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(validationAlert, animated: true)
        }
        
        
        if wisdomOutlet.hasText {
            let check = wisdomOutlet.text
            let intCheck = Int(check!) ?? -1
            if (intCheck >= 0) && (intCheck < 21) {
                wisValue = intCheck
            } else {
                let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter a Valid Ability Score", preferredStyle: .alert)
                
                validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(validationAlert, animated: true)
            }
            
        } else {
            let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter All Ability Scores", preferredStyle: .alert)
            
            validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(validationAlert, animated: true)
        }
        
        
        if charismaOutlet.hasText {
            let check = charismaOutlet.text
            let intCheck = Int(check!) ?? -1
            if (intCheck >= 0) && (intCheck < 21) {
                chaValue = intCheck
            } else {
                let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter a Valid Ability Score", preferredStyle: .alert)
                
                validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(validationAlert, animated: true)
            }
            
        } else {
            let validationAlert = UIAlertController(title: "ERROR", message: "Please Enter All Ability Scores", preferredStyle: .alert)
            
            validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(validationAlert, animated: true)
        }
        
        if (strValue != -1) && (dexValue != -1) && (conValue != -1) && (intValue != -1) && (wisValue != -1) && (chaValue != -1) {
            var baseAbilityScores = BaseAbilityScores(strength: strValue, dexterity: dexValue, constitution: conValue, intelligence: intValue, wisdom: wisValue, charisma: chaValue)
            let character = CharacterClass(self.selectedRace, baseAbilityScores)
            character.name = self.name
            character.playerClass = self.selectedClass
            guard let vc = storyboard?.instantiateViewController(identifier: "MiscellaneousCharacterInfoViewController", creator: { coder in
                return MiscellaneousCharacterInfoViewController(coder: coder, character: character)
            }) else {
                fatalError("Failed to Load Race Table")
            }

            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
}
