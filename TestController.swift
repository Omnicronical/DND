//
//  TestController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 05/10/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit

class TestController : UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    let playerCharacter: CharacterClass
    
    required init?(coder: NSCoder, character: CharacterClass) {
        self.playerCharacter = character
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        testLabel.text = String(playerCharacter.abilityScores.DEX)
    }
    
    
}
