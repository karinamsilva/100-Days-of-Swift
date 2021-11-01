//
//  ViewController.swift
//  Challenge
//
//  Created by Karina Martins Silva on 24/10/21.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet var preview: UIImageView!
    
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") {
                pictures.append(item)
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.imageView?.image = UIImage.init(named: pictures[indexPath.row])
        let separatorLineView = UIView(frame: CGRect(x: 21, y: -1, width: 390, height: 7))
        separatorLineView.backgroundColor = UIColor.white
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        cell.imageView?.layer.borderWidth = 1.0
        cell.contentView.addSubview(separatorLineView)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    

}

