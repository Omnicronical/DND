//
//  AutomatedCharacterCreation.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 17/02/2021.
//  Copyright © 2021 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation

class AutomatedCharacterCreation {
    
    func generateCharacter(name: String) -> CharacterClass {
        
        var name = name
        
        var raceSelector = PlayerRace()
        let raceInt = Int.random(in: 0..<raceSelector.raceNames.count-1)
        let defaultTraits = ["They are Big", "They have fur"]
        let defaultAbilityScores = [(2, "DEX"), (3, "STR")]
        let race = Race(name: raceSelector.raceNames[raceInt], racialTraitsInfo: defaultTraits, abilityScoreImprovementsInfo: defaultAbilityScores)
        
        let classSelector = PlayerClass()
        let classInt = Int.random(in: 0..<classSelector.listOfPlayableClasses.count-1)
        
        let strValue = Int.random(in: 0..<21)
        let dexValue = Int.random(in: 0..<21)
        let conValue = Int.random(in: 0..<21)
        let intValue = Int.random(in: 0..<21)
        let wisValue = Int.random(in: 0..<21)
        let chaValue = Int.random(in: 0..<21)
        var baseAbilityScores = BaseAbilityScores(strength: strValue, dexterity: dexValue, constitution: conValue, intelligence: intValue, wisdom: wisValue, charisma: chaValue)
        
        let height = "6\"0"
        let weight = "70kg"
        
        let character = CharacterClass(race, baseAbilityScores)
        character.name = name
        character.playerClass = classSelector.listOfPlayableClasses[classInt]
        character.height = height
        character.weight = weight
        
        return character
    }
    
    
    
    
}
