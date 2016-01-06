//
//  SpaceViewController.swift
//  example
//
//  Created by Trong Le on 1/6/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit

// Delay function
func delay (seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}


class SpaceViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var topLeftStar: UIImageView!
    @IBOutlet weak var topRightStar: UIImageView!
    @IBOutlet weak var middleStar: UIImageView!
    @IBOutlet weak var bottomMiddleStar: UIImageView!
    @IBOutlet weak var bottomRightStar: UIImageView!
    
    
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    let status = UIImageView(image: UIImage(named: "banner"))
    let label = UILabel()
    let messages = ["Connecting ...", "Authorizing ...", "Contacting NASA ...", "Failed"]
    
    var statusPosition = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(animated: Bool) {
        
        // Make stars disappear
        topLeftStar.alpha = 0.0
        topRightStar.alpha = 0.0
        middleStar.alpha = 0.0
        bottomMiddleStar.alpha = 0.0
        bottomRightStar.alpha = 0.0
    }

    override func viewDidAppear(animated: Bool) {
        
        // Make stars flash
        UIView.animateWithDuration(1, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            self.topLeftStar.alpha = 1.0
        }, completion: nil)
        
        UIView.animateWithDuration(1.2, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            self.topRightStar.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(1.4, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            self.middleStar.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(1.6, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            self.bottomMiddleStar.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            self.bottomRightStar.alpha = 1.0
            }, completion: nil)
        
    }
    
    // Dismiss keyboard when pressed outside text field
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.username.resignFirstResponder()
        self.password.resignFirstResponder()
    }
    

}
