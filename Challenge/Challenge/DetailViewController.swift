//
//  DetailViewController.swift
//  Challenge
//
//  Created by Karina Martins Silva on 24/10/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    
    }
    
}
