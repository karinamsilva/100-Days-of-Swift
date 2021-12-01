//
//  ViewController.swift
//  project7
//
//  Created by Karina Martins on 29/11/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Clear List", style: .plain, target: self, action: #selector(clearList))
        let share = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(share))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbarItems = [space, share, space]
        navigationController?.isToolbarHidden = false
    }

  
    @objc func addItem() {
            let popUp = UIAlertController(title: "Add Your Item", message: nil, preferredStyle: .alert)
            popUp.addTextField()
            let action = UIAlertAction(title: "OK", style: .default) {[weak self, weak popUp] act
                in
                guard let added = popUp?.textFields?[0].text else { return }
                if added != "" {
                    self?.shoppingList.insert(added, at: 0)
                    let indexPath = IndexPath(row: 0, section: 0)
                    self?.tableView.insertRows(at: [indexPath], with: .automatic)
                } else {
                    let attention = UIAlertController(title: "Error", message: "You can't add an empty item", preferredStyle: .alert)
                    let close = UIAlertAction(title: "Close", style: .cancel)
                    attention.addAction(close)
                    self?.present(attention, animated: true)
                }
            }
     
            popUp.addAction(action)
            present(popUp, animated: true)
        }
        
        @objc func clearList() {
            shoppingList.removeAll()
            tableView.reloadData()
            
        }
    
        @objc func share() {
            let list = shoppingList.joined(separator: "\n")
            let share = UIActivityViewController(activityItems: [list], applicationActivities: [])
            present(share, animated: true)
        
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
            cell.textLabel?.text = shoppingList[indexPath.row]
            return cell
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return shoppingList.count
        }
}
