//
//  LinkToCharactersOnFirebaseViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 09/11/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit
import Firebase

class LinkToCharactersOnFirebaseViewController : UITableViewController {
    
    var count = 0
    var fb = FirebaseClass()
    var charactersArray : [String] = []
    var selectedCharacterData : [Any] = []
    var character : CharacterClass? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fb.getNumberOfCharacters() { [self] (number) in
            count = number
        }
        fb.getCharacters() { [self] (characters) in
            charactersArray = characters
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        fb.getCharacterInformation(name: charactersArray[indexPath.row]) { [self] (selectedCharacter) in
            selectedCharacterData = selectedCharacter
            
            let defaultTraits = ["They are Big", "They have fur"]
            let defaultAbilityScores = [(0, "DEX"), (0, "STR")]
            var race = Race(name: selectedCharacterData[12] as! String, racialTraitsInfo: defaultTraits, abilityScoreImprovementsInfo: defaultAbilityScores)
            var baseAbilityScores = BaseAbilityScores(strength: selectedCharacterData[1] as! Int, dexterity: selectedCharacterData[2] as! Int, constitution: selectedCharacterData[3] as! Int, intelligence: selectedCharacterData[6] as! Int, wisdom: selectedCharacterData[5] as! Int, charisma: selectedCharacterData[4] as! Int)
            print(baseAbilityScores)
            character = CharacterClass(race, baseAbilityScores)
            character?.name = selectedCharacterData[0] as! String
            character?.weight = selectedCharacterData[11] as! String
            character?.height = selectedCharacterData[10] as! String
            character?.physicalDescription = selectedCharacterData[14] as! String
            character?.playerClass = selectedCharacterData[8] as! String
            character?.characterBackstory = selectedCharacterData[7] as! String
            character?.playerHP = selectedCharacterData[9] as! String
            character?.playerLvl = selectedCharacterData[13] as! String
            print(character?.abilityScores.CHA)
            
            
            guard let vc = storyboard?.instantiateViewController(identifier: "CharacterSheetViewController", creator: { coder in
                return CharacterSheetViewController(coder: coder, character: self.character!)
            }) else {
                fatalError("Failed to Load Race Table")
            }
                
            print(vc)


            navigationController?.pushViewController(vc, animated: true)
            
            
            
            
            
            
        }
    }
        
        
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterList", for: indexPath)
        cell.textLabel?.text = charactersArray[indexPath.row]
        
            
        return cell
    }
    
    
    
    
    
    
    
}
