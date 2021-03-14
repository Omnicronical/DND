//
//  Race.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 19/09/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation

class Race {
    
    var name: String
    var racialTraits: [String]
    var abilityScoreImprovements: [(Score: Int, Ability: String)]
    
    
    init(name: String, racialTraitsInfo: [String], abilityScoreImprovementsInfo: [(Score: Int, Ability: String)]) {
        self.name = name
        self.racialTraits = racialTraitsInfo
        self.abilityScoreImprovements = abilityScoreImprovementsInfo
        //will call a function that gets information about a given race//
        for ability in 0...abilityScoreImprovementsInfo.count-1 {
            self.abilityScoreImprovements.append(abilityScoreImprovementsInfo[ability])
        }
    }
    
    func applyAbilityScoreImprovements(character: CharacterClass) -> CharacterClass{
        for i in 0...abilityScoreImprovements.count-1{
            var number = abilityScoreImprovements[i].0
            var name = abilityScoreImprovements[i].1
            character.changeAbilityBonuses(abilityIncrease: number, abilityName: name)
        }
        
        return character
    }
    

    
    
    
    
}
