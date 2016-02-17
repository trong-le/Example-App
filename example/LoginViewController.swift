//
//  LoginViewController.swift
//  example
//
//  Created by Trong Le on 1/4/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit

import Parse

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIAlertViewDelegate {

    // Declare outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var photoLabel: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    // Set up submit button
    @IBAction func submitButton(sender: UIButton) {
        name = usernameField.text
        if !name!.isEmpty {
            let alert = UIAlertController(title: "Alert View", message: "Hello \(name!)!", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "Exit", style: .Default, handler: nil))
        } else {
            let alert = UIAlertController(title: "Alert View", message: "No name inputted.", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "Exit", style: .Default, handler: nil))
        }
        
    }
    
    // Button action to open photo library
    @IBAction func openPhotoLibrary(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    // Change image view to image and get rid of photo label
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        userImage.image = image
        self.dismissViewControllerAnimated(true, completion: nil);
        photoLabel.alpha = 0
    }
    
    // Dismiss keyboard when pressed outside text field
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.usernameField.resignFirstResponder()
    }
    
    // Dismiss keyboard when return is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
    }
    

    
}
