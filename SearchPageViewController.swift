//
//  SearchPageViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 11/01/2021.
//  Copyright © 2021 Hassall, Oscar (HWTA). All rights reserved.
//

import UIKit

class SearchPageViewController: UITableViewController, UISearchBarDelegate {
    
    var filteredData : [String] = []
    var dataContents: [DNDAPI] = []
    var text : String = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        searchBar.delegate = self
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        dataContents = []
        self.tableView.reloadData()
        text = searchText.lowercased()
        getData() { [self] (datA) in
            filteredData.self.append(datA.name)
            dataContents.self.append(datA)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
          }
        
           
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var item = self.dataContents[indexPath.row].name
        addToRecommendedArray(item: item)
        guard let vc = storyboard?.instantiateViewController(identifier: "INFOViewController", creator: { coder in
            return INFOViewController(coder: coder, data: self.dataContents[indexPath.row])
        }) else {
            fatalError("Failed to Load view controller")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func getData(completionHandler: @escaping (DNDAPI) -> Void) {
        
        let dataType = ["spells", "monsters", "skills", "ability-scores", "proficiencies", "languages", "classes", "subclasses", "Features", "starting-equipment", "Races", "subraces", "Traits", "Equipment", "magic-items", "weapon-properties", "conditions", "damage-types", "magic-schools", "rules", "rule-sections"]
        for i in 0...dataType.count-1 {
            let urlString = "https://www.dnd5eapi.co/api/\(dataType[i])/\(text)"
            guard let url = URL(string: urlString) else {return}
            URLSession.shared.dataTask(with: url) { (data, res, error) in
                
                do {
                    let datA = try JSONDecoder().decode(DNDAPI.self, from: data!)
                    print(datA)
                    completionHandler(datA)
                    
                } catch {}
                
                
            }.resume()
        }
        
        
        
        
        
    }
    
}

struct DNDAPI: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }

    let index: String
    let name: String
    let url: String
   
    
}

struct Reference {
    let index: String
    let name: String
    let url: String
}
