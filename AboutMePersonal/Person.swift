//
//  Person.swift
//  AboutMePersonal
//
//  Created by Michael Moore on 9/17/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

class Person: Codable {
    
    let name: String
    let likes: [String]
    let dislikes: [String]
    var coolScore: Int
    
    init(name: String, likes: [String], dislikes: [String], coolScore: Int) {
        self.name = name
        self.likes = likes
        self.dislikes = dislikes
        self.coolScore = coolScore
    }
}
