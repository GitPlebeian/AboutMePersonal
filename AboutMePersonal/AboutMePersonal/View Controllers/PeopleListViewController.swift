//
//  PeopleListViewController.swift
//  AboutMePersonal
//
//  Created by Jackson Tubbs on 9/17/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class PeopleListViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var peopleListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleListTableView.delegate = self
        peopleListTableView.dataSource = self
        
        PersonController.shared.loadFromPersistentStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        peopleListTableView.reloadData()
    }
    
    // MARK: - Custom Functions
    
    func getPhotoForPerson(person: Person) -> UIImage? {
        switch person.name {
        case "Jax": return UIImage(named: "Jax")
            case "Eric": return UIImage(named: "Eric")
            case "Big Dre": return UIImage(named: "BigDre")
            case "Josh": return UIImage(named: "Josh")
            case "Mars": return UIImage(named: "Mars")
            case "Matthew": return UIImage(named: "Matthew")
            case "Mike": return UIImage(named: "Mike")
        default: return nil
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPerson" {
            
            guard let index = peopleListTableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? PersonDetailViewController else {return}
            
            let person = PersonController.shared.people[index.row]
            
            destinationVC.person = person
            destinationVC.photo = getPhotoForPerson(person: person)
        }
    }

}

extension PeopleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonController.shared.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = peopleListTableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as? ListViewTableViewCell else {return UITableViewCell()}
        
        let person = PersonController.shared.people[indexPath.row]
        cell.person = person
        guard let photo = getPhotoForPerson(person: person) else {return UITableViewCell()}
        cell.photo = photo
        
        
        return cell
    }
}
