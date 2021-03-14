//
//  Firebase.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 14/11/2020.
//  Copyright © 2020 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation
import Firebase

class FirebaseClass {

    var array :[String] = []
    var selectedCharacter : [Any] = []
    
    
    func getNumberOfCharacters (completionHandler: @escaping (Int) -> Void)  {
        
        DispatchQueue.main.async {
            self.array = []
            let db = Firestore.firestore()
            db.collection("Characters").getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let dc = document.data()["Name"]!
                        print(dc)
                        self.array.append(dc as! String)
                        
                    }
                    completionHandler(self.array.count)
                }
            }
        }
    }
    
    func getCharacters (completionHandler: @escaping ([String]) -> Void)  {
        self.array = []
        DispatchQueue.main.async {
            let db = Firestore.firestore()
            db.collection("Characters").getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let dc = document.data()["Name"]!
                        print(dc)
                        self.array.append(dc as! String)
                        
                    }
                    completionHandler(self.array)
                }
            }
        }
    }
    
    func getCharacterInformation (name: String, completionHandler: @escaping ([Any]) -> Void) {
        self.selectedCharacter = []
        DispatchQueue.main.async {
            let db = Firestore.firestore()
            db.collection("Characters").getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let dc = document.data()["Name"]!
                        if dc as! String == name{
                            self.selectedCharacter.append(document.data()["Name"] as! String)
                            var strength = (document.data()["AbilityScoreStr"])
                            print (strength!)
                            self.selectedCharacter.append(strength)
                            self.selectedCharacter.append(document.data()["AbilityScoreDex"])
                            self.selectedCharacter.append(document.data()["AbilityScoreCon"])
                            self.selectedCharacter.append(document.data()["AbilityScoreCha"])
                            self.selectedCharacter.append(document.data()["AbilityScoreWIS"])
                            self.selectedCharacter.append(document.data()["AbilityScoreINT"])
                            self.selectedCharacter.append(document.data()["CharacterBackstory"] as! String)
                            self.selectedCharacter.append(document.data()["Class"] as! String)
                            self.selectedCharacter.append(document.data()["HP"] as! String)
                            self.selectedCharacter.append(document.data()["Height"] as! String)
                            self.selectedCharacter.append(document.data()["Weight"] as! String)
                            self.selectedCharacter.append(document.data()["Race"] as! String)
                            self.selectedCharacter.append(document.data()["Level"] as! String)
                            self.selectedCharacter.append(document.data()["PhysicalDescription"] as! String)
                        }
                        
                    }
                    completionHandler(self.selectedCharacter)
                }
            }
        }
        
    }
    
    
    
}
