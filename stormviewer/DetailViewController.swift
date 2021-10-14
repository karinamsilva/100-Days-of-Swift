//
//  DetailViewController.swift
//  stormviewer
//
//  Created by Karina Martins Silva on 13/10/21.
//

import UIKit

class DetailViewController: UIViewController {
  
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedPicture = 0
    var total = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(selectedPicture) of \(total)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
