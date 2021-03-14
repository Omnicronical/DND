//
//  RaceTableViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 04/10/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit

class RaceTableViewController : UITableViewController {
    
    var characterName : String
    
    
    
    
    required init?(coder: NSCoder, name: String) {
        self.characterName = name
      
        super.init(coder: coder)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let races = PlayerRace()
        let raceArray = races.raceNames
        return raceArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let races = PlayerRace()
        let raceArray = races.raceNames
        let cell = tableView.dequeueReusableCell(withIdentifier: "Race", for: indexPath)
        cell.textLabel?.text = raceArray[indexPath.row]
        
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let race = PlayerRace()
        let raceArray = race.raceNames
        let selectedRace = raceArray[indexPath.row]
        //First it will instantiate the race class. I will do it now with generic data
        let defaultTraits = ["They are Big", "They have fur"]
        let defaultAbilityScores = [(2, "DEX"), (3, "STR")]
        let selectedRaceClass = Race(name: selectedRace, racialTraitsInfo: defaultTraits, abilityScoreImprovementsInfo: defaultAbilityScores)
        //Now it will push the next view controller with the race class and the name
        guard let vc = storyboard?.instantiateViewController(identifier: "ClassTableViewController", creator: { coder in
            return ClassTableViewController(coder: coder, selectedRace: selectedRaceClass, name: self.characterName)
        }) else {
            fatalError("Failed to Load Race Table")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
}
