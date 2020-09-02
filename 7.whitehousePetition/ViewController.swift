//
//  ViewController.swift
//  7.whitehousePetition
//
//  Created by Truong Nguyen on 9/2/20.
//  Copyright © 2020 Truong Nguyen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlSafe = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlSafe) {  // check url safe
            if let data = try? Data(contentsOf: url) {  // convert data from url to data instance
                // we're OK to parse
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) { // Data is any kinds of binary data
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData() // wtf tableView come from?
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }


}

