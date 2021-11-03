//
//  MainTableViewController.swift
//  Project4
//
//  Created by Karina Martins Silva on 31/10/21.
//

import UIKit

class MainTableViewController: UITableViewController {
    var websites = ["apple.com", "hackingwithswift.com", "www.google.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Websites"
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "websiteTitle", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondController") as! ViewController
        vc.website = websites[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
