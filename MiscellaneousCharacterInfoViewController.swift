//
//  MiscellaneousCharacterInfoViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 07/10/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit

class MiscellaneousCharacterInfoViewController: UIViewController {
    
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var characterBackstoryText: UITextView!
    @IBOutlet weak var physicalDescriptionText: UITextView!
    
    let character : CharacterClass
    
    required init?(coder: NSCoder, character: CharacterClass) {
        self.character = character
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func confirmButtonPushed(_ sender: Any) {
        if heightText.hasText {
            character.height = heightText.text!
        }
        if weightText.hasText {
            character.weight = weightText.text!
        }
        if characterBackstoryText.hasText {
            character.characterBackstory = characterBackstoryText.text!
        }
        if physicalDescriptionText.hasText{
            character.physicalDescription = physicalDescriptionText.text!
        }
        guard let vc = storyboard?.instantiateViewController(identifier: "CharacterSheetViewController", creator: { coder in
            return CharacterSheetViewController(coder: coder, character: self.character)
        }) else {
            fatalError("Failed to Load Race Table")
        }

        navigationController?.pushViewController(vc, animated: true)
       
    }
    
}
