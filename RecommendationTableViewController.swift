//
//  RecommendationTableViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 10/02/2021.
//  Copyright © 2021 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation
import UIKit


class RecommendationTableViewController: UITableViewController {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
    }
    
    func sortRecommendationArray() -> [(String, Int)] {
        let sorted = recommendedArray.sorted {
            $0.1 > $1.1
            
        }
        return sorted
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = recommendedArray.count
        return (count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var sortedRecommendedArray = sortRecommendationArray()
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recommendation", for: indexPath)
        cell.textLabel?.text = sortedRecommendedArray[indexPath.row].0
        return cell
        
    }
    
    
    
}
