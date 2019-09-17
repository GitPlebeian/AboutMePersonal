//
//  PersonDetailViewController.swift
//  AboutMePersonal
//
//  Created by Jackson Tubbs on 9/17/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    // MARK: - Outlets
    
    
    // MARK: - Properties
    
    @IBOutlet weak var personDrescale: UILabel!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var dislikeLabel: UILabel!
    
    var person: Person? {
        didSet {
            updateViewsForPerson()
        }
    }
    var photo: UIImage? {
        didSet {
            updatePhotoForPerson()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.frame.height / 2
    }
    
    // MARK: - Actions
    
    @IBAction func subtractScoreTapped(_ sender: Any) {
        guard let person = person else {return}
        PersonController.shared.subtractScoreFromPerson(person: person)
        updateViewsForPerson()
    }
    
    @IBAction func addScoreTapped(_ sender: Any) {
        guard let person = person else {return}
        PersonController.shared.addScoreToPerson(person: person)
        updateViewsForPerson()
    }
    // MARK: - Custom Functions
    
    func updatePhotoForPerson() {
        loadViewIfNeeded()
        guard let photo = photo else {return}
        profilePhotoImageView.image = photo
    }
    
    func updateViewsForPerson() {
        loadViewIfNeeded()
        guard let person = person else {return}
        var likes = ""
        for like in person.likes {
            likes.append(like + "\n")
        }
        var disLikes = ""
        for disLike in person.dislikes {
            disLikes.append(disLike + "\n")
        }
        likeLabel.text = likes
        dislikeLabel.text = disLikes
        
        personName.text = person.name
        personDrescale.text = "Dre Score: \(PersonController.shared.getScoreForPerson(person: person).score)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
