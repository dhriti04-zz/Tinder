//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Dhriti Chawla on 3/3/18.
//  Copyright © 2018 codepath. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var yourImage: UIImageView!
    var myImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        yourImage.image = myImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

}
