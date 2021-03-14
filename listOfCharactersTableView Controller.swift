//
//  listOfCharactersTableView Controller.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 02/11/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit

class ListOfCharactersTableViewController : UITableView {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let races = PlayerRace()
        let raceArray = races.raceNames
        return raceArray.count
    }
    
}
