//
//  ListViewTableViewCell.swift
//  AboutMePersonal
//
//  Created by Jackson Tubbs on 9/17/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class ListViewTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var profileImageImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dreScaleLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    // MARK: - Properties
    
    var photo: UIImage? {
        didSet {
            updatePhoto()
        }
    }
    
    var person: Person? {
        didSet {
            updateViewsForPerson()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 4)
        shadowView.layer.shadowRadius = 3
    }
    
    // MARK: - Custom Functions
    
    func updatePhoto() {
        guard let photo = photo else {return}
        profileImageImageView.image = photo
    }
    
    func updateViewsForPerson() {
        guard let person = person else {return}
        nameLabel.text = person.name
        dreScaleLabel.text = "Dre Score: \(PersonController.shared.getScoreForPerson(person: person).score)"
    }
}
