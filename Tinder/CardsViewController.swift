//
//  CardsViewController.swift
//  Tinder
//
//  Created by Dhriti Chawla on 3/3/18.
//  Copyright © 2018 codepath. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var yourView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.yourView.layer.cornerRadius = 10
        self.yourView.clipsToBounds = true
        
        
        self.yourView.layer.borderWidth = 5.0
        self.yourView.layer.borderColor = UIColor(red: 250, green: 110, blue: 130, alpha: 1.0).cgColor

        
        // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(cardDraggable(_:)))
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        yourView.isUserInteractionEnabled = true
        yourView.addGestureRecognizer(panGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cardDraggable(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        //let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            cardInitialCenter = yourView.center
            print("Gesture began")
        } else if sender.state == .changed {
            if (location.y < yourView.frame.height/2)
            { yourView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                yourView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * M_PI / 560))
            }
            else {
                yourView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                yourView.transform = CGAffineTransform(rotationAngle: CGFloat(-1.0 * Double(translation.x) * M_PI / 560))
            }
            
            if(translation.x > 175 || translation.x < -175) {
                UIView.animate(withDuration: 0.4, animations: {
                    self.yourView.alpha = 0
                })
            }
            print("Gesture is changing")
        } else if sender.state == .ended {
            yourView.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y)
            yourView.transform = CGAffineTransform(rotationAngle: CGFloat(0.0))
            print("Gesture ended")
        }
        
    }
    
    
    @IBAction func tappedPicture(_ sender: Any) {
        self.performSegue(withIdentifier: "profile", sender: sender)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfileViewController {
            if let image = yourView.image {
                destination.myImage = image
            }
        }
    }
    
    
    
    
}
