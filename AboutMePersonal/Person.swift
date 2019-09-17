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
    
    init(name: String, likes: [String], dislikes: [String]) {
        self.name = name
        self.likes = likes
        self.dislikes = dislikes
    }
}
