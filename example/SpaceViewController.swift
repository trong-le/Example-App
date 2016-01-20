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
    let messages = ["Connecting ...", "Baking Cookies ...", "Contacting NASA ...", "Success"]
    
    var statusPosition = CGPoint.zero
    var pressed = true
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 8.0
        }
    }
    
    // Login layout constraints
    @IBOutlet weak var loginWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginVerticalSpacingConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up spinner
        spinner.frame = CGRect(x: 20.0, y: 16, width: 20.0, height: 20.0)
        spinner.startAnimating()
        spinner.alpha = 0.0
        loginButton.addSubview(spinner)
        
        // Set up status banner
        status.hidden = true
        status.center = loginButton.center
        status.frame = CGRect(x: loginButton.center.x/4+12, y: loginButton.center.y-30, width: 200, height: 26)
        view.addSubview(status)
        
        // Set up color and frame for message label
        label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
        label.font = UIFont(name: "HelveticaNeue", size: 18.0)
        label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
        label.textAlignment = .Center
        status.addSubview(label)
        
        statusPosition = status.center
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
    
    // Dismiss keyboard when return is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK : Animation Actions
    
    // Set up login animation actions and spinner animation actions
    @IBAction func loginAction(sender: AnyObject) {
        
        if pressed {
            self.loginWidthConstraint.constant *= 1.33
            self.loginVerticalSpacingConstraint.constant *= 2.5
            self.loginButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
        
            self.spinner.center = CGPoint(x: 40, y: self.loginButton.frame.size.height/2)
            self.spinner.alpha = 1.0
        
        
            UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: [], animations: {
                self.view.setNeedsLayout()
                self.view.layoutIfNeeded()
                }, completion: {_ in
                    self.showMessage(index: 0)
            })
        }
        
        pressed = false
    }
    
    // Display message banner
    func showMessage(index index: Int) {
        label.text = messages[index]
    
        UIView.transitionWithView(status, duration: 0.33, options:
            [.CurveEaseOut, .TransitionCurlDown], animations: {
                self.status.hidden = false
            }, completion: { [weak self]_ in
                guard let strongself = self else {
                    return
                }
                
                //transition completion
                delay(seconds: 2.0) {
                    if index < strongself.messages.count-1 {
                        strongself.removeMessage(index: index)
                    } else {
                        //reset form
                        strongself.spinner.alpha = 0.0
                    }
                }
        })
        
    }
    
    // Remove message banner and show next message
    func removeMessage(index index: Int) {
        UIView.animateWithDuration(0.33, delay: 0.0, options: [], animations: { [weak self] in
            guard let strongself = self else {
                return
            }
            strongself.status.center.x += strongself.view.frame.size.width
            }, completion: { [weak self] _ in
                guard let strongself = self else {
                    return
                }
                strongself.status.hidden = true
                strongself.status.center = strongself.statusPosition
                strongself.showMessage(index: index + 1)
        })
    }
    

}
