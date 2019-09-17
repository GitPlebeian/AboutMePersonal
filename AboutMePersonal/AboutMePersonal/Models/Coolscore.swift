//
//  Coolscore.swift
//  AboutMePersonal
//
//  Created by Jackson Tubbs on 9/17/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

class Coolscore: Codable {
    
    var score: Int
    var name: String
    
    init(name: String) {
        self.score = 0
        self.name = name
    }
}
