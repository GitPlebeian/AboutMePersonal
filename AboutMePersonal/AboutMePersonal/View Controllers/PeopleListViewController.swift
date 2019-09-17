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

extension PeopleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = peopleListTableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath)
        
        cell.textLabel?.text = "Bob"
        cell.detailTextLabel?.text = "Coolscore 8"
        
        return cell
    }
}
