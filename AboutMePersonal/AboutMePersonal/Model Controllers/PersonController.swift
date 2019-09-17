//
//  PersonController.swift
//  AboutMePersonal
//
//  Created by Jackson Tubbs on 9/17/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

class PersonController {
    
    static let shared = PersonController()
    
    var people: [Person] = []
    var scores: [Coolscore] = []

    init() {
        let jaxLikes = ["Motorcycles","Minecraft","Mac n Cheese"]
        let jaxDislikes = ["Ian Hall", "Karl","Massive Trucks", "Ian's Jokes"]
        
        let andrewSmithLikes = ["Computers", "Parties", "Pancakes"]
        let andrewSwithDislikes = ["People chewing with mouth open","Getting cut off while driving","Oatmeal", "Ian Hall"]
        
        let ericLikes = ["Travel","Robots","A stiff cocktail"]
        let ericDislikes = ["Cold","Clowns","Ian Hall","Lack of documentation"]
        
        let joshLikes = ["Skiing the bunny for free","People with Dre scores over 9000","Winning"]
        let joshDislikes = ["Wearing glasses","Ian Hall", "People with Dre scores under 9000","Paying to ski the bunny"]
    
        let mikeLikes = ["Beer", "Adventures", "Beer"]
        let mikeDislikes = ["Ian Hall", "Traffic", "Utah", "Ian's Memes"]
        
        let marsLikes = ["Coffee", "Shoes", "Adventure Time"]
        let marsDislikes = ["QA", "Automation", "Jira"]
        
        let matthewLikes = ["Football","Mexican Food","Camping"]
        let matthewDislikes = ["Pickles", "Ian Hall", "Futball","Being Short"]
        
        let jax = Person(name: "Jax", likes: jaxLikes, dislikes: jaxDislikes)
        let andrew = Person(name: "Big Dre", likes: andrewSmithLikes, dislikes: andrewSwithDislikes)
        let eric = Person(name: "Eric", likes: ericLikes, dislikes: ericDislikes)
        let josh = Person(name: "Josh", likes: joshLikes, dislikes: joshDislikes)
        let mike = Person(name: "Mike", likes: mikeLikes, dislikes: mikeDislikes)
        let mars = Person(name: "Mars", likes: marsLikes, dislikes: marsDislikes)
        let matthew = Person(name: "Matthew", likes: matthewLikes, dislikes: matthewDislikes)
        
        people = [jax, andrew, eric, josh, mike, mars, matthew]
    }

    func addScoreToPerson(person: Person) {
        let score = getScoreForPerson(person: person)
        score.score += 1
        saveToPersistentStore()
    }
    
    func subtractScoreFromPerson(person: Person) {
        let score = getScoreForPerson(person: person)
        score.score -= 1
        saveToPersistentStore()
    }
    
    func getScoreForPerson(person: Person) -> Coolscore {
        for score in scores {
            if person.name == score.name {
                return score
            }
        }
        return Coolscore(name: "Bob")
    }
    
    // MARK: - Persistence
    
    func createFileURLForPersistence() -> URL {
        // Grab the users document directory
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // Create the new fileURL on user's phone
        let fileURL = urls[0].appendingPathComponent("Scores.json")
        
        return fileURL
    }
    
    func saveToPersistentStore() {
        // Create an instance of JSON Encoder
        let jsonEncoder = JSONEncoder()
        // Attempt to convert our quotes to JSON
        do {
            let jsonPeople = try jsonEncoder.encode(scores)
            // With the new json(d) quote, save it to the users device
            try jsonPeople.write(to: createFileURLForPersistence())
        } catch let encodingError {
            // Handle the error, if there is one
            print("There was an error saving!! \(encodingError.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        // The data we want will be JSON, and I want it to be a Quote.
        let jsonDecoder = JSONDecoder()
        //Decode the data
        do {
            let jsonData = try Data(contentsOf: createFileURLForPersistence())
            let decodedPeople = try jsonDecoder.decode([Coolscore].self, from: jsonData)
            scores = decodedPeople
        } catch let decodingError {
            
            let score1 = Coolscore(name: "Jax")
            let score2 = Coolscore(name: "Mike")
            let score3 = Coolscore(name: "Mars")
            let score4 = Coolscore(name: "Eric")
            let score5 = Coolscore(name: "Josh")
            let score6 = Coolscore(name: "Matthew")
            let score7 = Coolscore(name: "Big Dre")
            
            scores = [score1,score2,score3,score4,score5,score6,score7]
            saveToPersistentStore()
            print("There was an error decoding!! \(decodingError.localizedDescription)")
        }
    }
}
