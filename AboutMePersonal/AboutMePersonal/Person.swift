//
//  Person.swift
//  AboutMePersonal
//
//  Created by Michael Moore on 9/17/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation
import UIKit.UIImage

class Person: Codable {
    
    let name: String
    var coolScore: Int
    let likes: [String]
    let dislikes: [String]
    
    init(name: String, coolScore: Int, likes: [String], dislikes: [String]) {
        self.name = name
        self.coolScore = coolScore
        self.likes = likes
        self.dislikes = dislikes
    }
}

