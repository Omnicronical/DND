//
//  CharacterSheetViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 12/10/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit
import Firebase



class CharacterSheetViewController : UIViewController {
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var strValue: UILabel!
    @IBOutlet weak var dexValue: UILabel!
    @IBOutlet weak var conValue: UILabel!
    @IBOutlet weak var intValue: UILabel!
    @IBOutlet weak var wisValue: UILabel!
    @IBOutlet weak var chaValue: UILabel!
    @IBOutlet weak var strProfValue: UILabel!
    @IBOutlet weak var dexProfValue: UILabel!
    @IBOutlet weak var conProfValue: UILabel!
    @IBOutlet weak var intProfValue: UILabel!
    @IBOutlet weak var wisProfValue: UILabel!
    @IBOutlet weak var chaProfValue: UILabel!
    @IBOutlet weak var hitpoints: UITextField!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var backstoryLabel: UITextView!
    @IBOutlet weak var appearanceLabel: UITextView!
    @IBOutlet weak var playerLVLText: UITextField!
    @IBOutlet weak var proficiencyModifier: UILabel!
    
    
    var character : CharacterClass
    
    
    required init?(coder: NSCoder, character: CharacterClass) {
        self.character = character
        super.init(coder: coder)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        nameLabel.text = character.name
        classLabel.text = character.playerClass
        raceLabel.text = character.race.name
        strValue.text = String(character.abilityScores.STR)
        dexValue.text = String(character.abilityScores.DEX)
        conValue.text = String(character.abilityScores.CON)
        intValue.text = String(character.abilityScores.INT)
        wisValue.text = String(character.abilityScores.WIS)
        chaValue.text = String(character.abilityScores.CHA)
        heightLabel.text = character.height
        weightLabel.text = character.weight
        backstoryLabel.text = character.characterBackstory
        appearanceLabel.text = character.physicalDescription
        proficiencyModifiersGenerator()
        
        
    }
    
    @IBAction func HPChanged(_ sender: Any) {
        character.playerHP = hitpoints.text ?? "0"
    }
    
    @IBAction func LVLChanged(_ sender: Any) {
        character.playerLvl = playerLVLText.text ?? "0"
        if Int(character.playerLvl) ?? 0 == 0{
            proficiencyModifier.text = "+1"
        } else if Int(character.playerLvl) ?? 1 <= 4 {
            proficiencyModifier.text = "+2"
        } else if Int(character.playerLvl) ?? 1 <= 8 {
            proficiencyModifier.text = "+3"
        } else if Int(character.playerLvl) ?? 1 <= 12 {
            proficiencyModifier.text = "+4"
        } else if Int(character.playerLvl) ?? 1 <= 16 {
            proficiencyModifier.text = "+5"
        } else if Int(character.playerLvl) ?? 1 <= 20 {
            proficiencyModifier.text = "+6"
        }
        
    }
    
    @IBAction func CharacterSaved(_ sender: Any) {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("Characters").addDocument(data : ["Name" : character.name, "Class" : character.playerClass, "Race" : character.race.name, "Weight" : character.weight, "Height" : character.height, "HP" : character.playerHP, "Level" : character.playerLvl, "PhysicalDescription" : character.physicalDescription, "CharacterBackstory" : character.characterBackstory, "AbilityScoreStr" : character.abilityScores.STR, "AbilityScoreDex" : character.abilityScores.DEX, "AbilityScoreCon" : character.abilityScores.CON, "AbilityScoreINT" : character.abilityScores.INT, "AbilityScoreWIS" : character.abilityScores.WIS, "AbilityScoreCha" : character.abilityScores.CHA])
        { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
        
    
    
    
    
    func proficiencyModifiersGenerator() {
        for i in 0...5 {
            if i == 0 {
                if character.abilityScores.STR <= 3{
                    strProfValue.text = "-4"
                } else if character.abilityScores.STR <= 5 {
                    strProfValue.text = "-3"
                } else if character.abilityScores.STR <= 7 {
                    strProfValue.text = "-2"
                } else if character.abilityScores.STR <= 9 {
                    strProfValue.text = "-1"
                } else if character.abilityScores.STR <= 11 {
                    strProfValue.text = "+0"
                } else if character.abilityScores.STR <= 13 {
                    strProfValue.text = "+1"
                } else if character.abilityScores.STR <= 15 {
                    strProfValue.text = "+2"
                } else if character.abilityScores.STR <= 17 {
                    strProfValue.text = "+3"
                } else if character.abilityScores.STR <= 19 {
                    strProfValue.text = "+4"
                } else if character.abilityScores.STR <= 20 {
                    strProfValue.text = "+5"
                } else if character.abilityScores.STR <= 23 {
                    strProfValue.text = "+6"
                } else if character.abilityScores.STR <= 25 {
                    strProfValue.text = "+7"
                }
            }
            if i == 1 {
                if character.abilityScores.DEX <= 3{
                    dexProfValue.text = "-4"
                } else if character.abilityScores.DEX <= 5 {
                    dexProfValue.text = "-3"
                } else if character.abilityScores.DEX <= 7 {
                    dexProfValue.text = "-2"
                } else if character.abilityScores.DEX <= 9 {
                    dexProfValue.text = "-1"
                } else if character.abilityScores.DEX <= 11 {
                    dexProfValue.text = "+0"
                } else if character.abilityScores.DEX <= 13 {
                    dexProfValue.text = "+1"
                } else if character.abilityScores.DEX <= 15 {
                    dexProfValue.text = "+2"
                } else if character.abilityScores.DEX <= 17 {
                    dexProfValue.text = "+3"
                } else if character.abilityScores.DEX <= 19 {
                    dexProfValue.text = "+4"
                } else if character.abilityScores.DEX <= 20 {
                    dexProfValue.text = "+5"
                } else if character.abilityScores.DEX <= 23 {
                    dexProfValue.text = "+6"
                } else if character.abilityScores.DEX <= 25 {
                    dexProfValue.text = "+7"
                }
            }
            if i == 2 {
                if character.abilityScores.CON <= 3{
                    conProfValue.text = "-4"
                } else if character.abilityScores.CON <= 5 {
                    conProfValue.text = "-3"
                } else if character.abilityScores.CON <= 7 {
                    conProfValue.text = "-2"
                } else if character.abilityScores.CON <= 9 {
                    conProfValue.text = "-1"
                } else if character.abilityScores.CON <= 11 {
                    conProfValue.text = "+0"
                } else if character.abilityScores.CON <= 13 {
                    conProfValue.text = "+1"
                } else if character.abilityScores.CON <= 15 {
                    conProfValue.text = "+2"
                } else if character.abilityScores.CON <= 17 {
                    conProfValue.text = "+3"
                } else if character.abilityScores.CON <= 19 {
                    conProfValue.text = "+4"
                } else if character.abilityScores.CON <= 20 {
                    conProfValue.text = "+5"
                } else if character.abilityScores.CON <= 23 {
                    conProfValue.text = "+6"
                } else if character.abilityScores.CON <= 25 {
                    conProfValue.text = "+7"
                }
            }
            if i == 3 {
                if character.abilityScores.INT <= 3{
                    intProfValue.text = "-4"
                } else if character.abilityScores.INT <= 5 {
                    intProfValue.text = "-3"
                } else if character.abilityScores.INT <= 7 {
                    intProfValue.text = "-2"
                } else if character.abilityScores.INT <= 9 {
                    intProfValue.text = "-1"
                } else if character.abilityScores.INT <= 11 {
                    intProfValue.text = "+0"
                } else if character.abilityScores.INT <= 13 {
                    intProfValue.text = "+1"
                } else if character.abilityScores.INT <= 15 {
                    intProfValue.text = "+2"
                } else if character.abilityScores.INT <= 17 {
                    intProfValue.text = "+3"
                } else if character.abilityScores.INT <= 19 {
                    intProfValue.text = "+4"
                } else if character.abilityScores.INT <= 20 {
                    intProfValue.text = "+5"
                } else if character.abilityScores.INT <= 23 {
                    intProfValue.text = "+6"
                } else if character.abilityScores.INT <= 25 {
                    intProfValue.text = "+7"
                }
            }
            if i == 0 {
                if character.abilityScores.WIS <= 3{
                    wisProfValue.text = "-4"
                } else if character.abilityScores.WIS <= 5 {
                    wisProfValue.text = "-3"
                } else if character.abilityScores.WIS <= 7 {
                    wisProfValue.text = "-2"
                } else if character.abilityScores.WIS <= 9 {
                    wisProfValue.text = "-1"
                } else if character.abilityScores.WIS <= 11 {
                    wisProfValue.text = "+0"
                } else if character.abilityScores.WIS <= 13 {
                    wisProfValue.text = "+1"
                } else if character.abilityScores.WIS <= 15 {
                    wisProfValue.text = "+2"
                } else if character.abilityScores.WIS <= 17 {
                    wisProfValue.text = "+3"
                } else if character.abilityScores.WIS <= 19 {
                    wisProfValue.text = "+4"
                } else if character.abilityScores.WIS <= 20 {
                    wisProfValue.text = "+5"
                } else if character.abilityScores.WIS <= 23 {
                    wisProfValue.text = "+6"
                } else if character.abilityScores.WIS <= 25 {
                    wisProfValue.text = "+7"
                }
            }
            if i == 0 {
                if character.abilityScores.CHA <= 3{
                    chaProfValue.text = "-4"
                } else if character.abilityScores.CHA <= 5 {
                    chaProfValue.text = "-3"
                } else if character.abilityScores.CHA <= 7 {
                    chaProfValue.text = "-2"
                } else if character.abilityScores.CHA <= 9 {
                    chaProfValue.text = "-1"
                } else if character.abilityScores.CHA <= 11 {
                    chaProfValue.text = "+0"
                } else if character.abilityScores.CHA <= 13 {
                    chaProfValue.text = "+1"
                } else if character.abilityScores.CHA <= 15 {
                    chaProfValue.text = "+2"
                } else if character.abilityScores.CHA <= 17 {
                    chaProfValue.text = "+3"
                } else if character.abilityScores.CHA <= 19 {
                    chaProfValue.text = "+4"
                } else if character.abilityScores.CHA <= 20 {
                    chaProfValue.text = "+5"
                } else if character.abilityScores.CHA <= 23 {
                    chaProfValue.text = "+6"
                } else if character.abilityScores.CHA <= 25 {
                    chaProfValue.text = "+7"
                }
            }
            
        }
    }
    
}
