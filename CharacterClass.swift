//
//  Character.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 16/09/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation


class CharacterClass {
    
    var STRDone = false
    var DEXDone = false
    var CONDone = false
    var INTDone = false
    var WISDone = false
    var CHADone = false
    
    
    var physicalDescription: String = ""
    var characterBackstory: String = ""
    var height: String = ""
    var name: String = ""
    var abilityBonuses: [(Int,String)] = [(0,"")]
    var weight: String = ""
    var abilityScores: BaseAbilityScores
    var automation: Bool = false
    var race: Race
    var playerClass: String = ""
    var playerLvl: String = "1"
    var playerHP: String = "0"
    
    init(_ race: Race,_ baseAbilityScores: BaseAbilityScores) {
        self.race = race
        self.abilityScores = baseAbilityScores
        race.applyAbilityScoreImprovements(character: self)
        
    }
    
    
    
    func changeAutomationLevel(isAutomated: Bool) {
        self.automation = isAutomated

    }
    
    
    func changeAbilityBonuses(abilityIncrease: Int, abilityName: String) {
        for ability in 0...abilityBonuses.count-1 {
            if abilityBonuses[ability].1 == abilityName {
                abilityBonuses[ability].0 = abilityIncrease
            }
            if abilityBonuses[ability].1 == "" {
                abilityBonuses[ability].0 = abilityIncrease
                abilityBonuses[ability].1 = abilityName
            } else {
                var abilityGroup = (abilityIncrease, abilityName)
                abilityBonuses.append(abilityGroup)
            }
        
          createFullAbilityScores()
            
        }
        
        
        
    }
    
    func createFullAbilityScores() {
        for i in 0...abilityBonuses.count-1 {
            if (abilityBonuses[i].1 == "STR") && (STRDone == false) {
                abilityScores.STR += abilityBonuses[i].0
                STRDone = true
            }
            if (abilityBonuses[i].1 == "DEX") && (DEXDone == false){
                abilityScores.DEX += abilityBonuses[i].0
                print(abilityBonuses[i].0)
                DEXDone = true
            }
            if (abilityBonuses[i].1 == "CON") && (CONDone == false){
                abilityScores.CON += abilityBonuses[i].0
                CONDone = true
            }
            if (abilityBonuses[i].1 == "INT") && (INTDone == false){
                abilityScores.INT += abilityBonuses[i].0
                INTDone = true
            }
            if (abilityBonuses[i].1 == "WIS") && (WISDone == false){
                abilityScores.WIS += abilityBonuses[i].0
                WISDone = true
            }
            if (abilityBonuses[i].1 == "CHA") && (CHADone == false){
                abilityScores.CHA += abilityBonuses[i].0
                CHADone = true
            }
            
            
        }
    }
    

    
    
    
    
}
