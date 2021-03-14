//
//  ClassTableViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 04/10/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit

class ClassTableViewController: UITableViewController {
    
    let selectedRace : Race
    let name : String
    
    required init?(coder: NSCoder, selectedRace: Race, name: String) {
        self.name = name
        self.selectedRace = selectedRace
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let classClass = PlayerClass()
        let classArray = classClass.listOfPlayableClasses
        return classArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let classClass = PlayerClass()
        let classArray = classClass.listOfPlayableClasses
        let cell = tableView.dequeueReusableCell(withIdentifier: "Class", for: indexPath)
        cell.textLabel?.text = classArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let classClass = PlayerClass()
        let classArray = classClass.listOfPlayableClasses
        let selectedClass = classArray[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(identifier: "AbilityScoresViewController", creator: { coder in
            return AbilityScoresViewController(coder: coder, selectedRace: self.selectedRace, name: self.name, selectedClass: selectedClass)
        }) else {
            fatalError("Failed to Load Race Table")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
