//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Liu Peiwen on 2021/04/14.
//

import UIKit

class NextViewController: UIViewController {
    
    var selectedImage: UIImage!

    @IBOutlet weak var selectedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if self.selectedImage != nil {
            print("selectedImage: \(String(describing: self.selectedImage))")
            self.selectedImageView.image = self.selectedImage
        } else {
            print("image not found")
        }
        
        
    }

    

}
