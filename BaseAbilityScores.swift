//
//  AbilityScores.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 23/09/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation

class BaseAbilityScores {
    
    var STR: Int
    var DEX: Int
    var CON: Int
    var INT: Int
    var WIS: Int
    var CHA: Int
    
    
    init (strength: Int, dexterity: Int, constitution: Int, intelligence: Int, wisdom: Int, charisma: Int) {
        self.STR = strength
        self.DEX = dexterity
        self.CON = constitution
        self.INT = intelligence
        self.WIS = wisdom
        self.CHA = charisma
    }
    
    
}
