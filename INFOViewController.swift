//
//  INFOViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 12/01/2021.
//  Copyright © 2021 Hassall, Oscar (HWTA). All rights reserved.
//


import UIKit

class INFOViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    
    var data : DNDAPI
    
    
    
    required init?(coder: NSCoder, data: DNDAPI) {
        self.data = data
        super.init(coder: coder)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        nameLabel.text = data.name
        indexLabel.text = data.index
        
    }
}
