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
    
//    var people: [Person] = []
//
//    init() {
//
//    }
//
    func addScoreToPerson(person: Person) {
        person.coolScore += 1
    }
//
    func subtractScoreFromPerson(person: Person) {
        person.coolScore -= 1
    }
    
    // MARK: - Persistence
    
    func createFileURLForPersistence() -> URL {
        // Grab the users document directory
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // Create the new fileURL on user's phone
        let fileURL = urls[0].appendingPathComponent("People.json")
        
        return fileURL
    }
    
    func saveToPersistentStore() {
        // Create an instance of JSON Encoder
        let jsonEncoder = JSONEncoder()
        // Attempt to convert our quotes to JSON
        do {
            let jsonPeople = try jsonEncoder.encode(people)
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
            let decodedPeople = try jsonDecoder.decode([Person].self, from: jsonData)
            people = decodedPeople
        } catch let decodingError {
            print("There was an error decoding!! \(decodingError.localizedDescription)")
        }
    }
}
