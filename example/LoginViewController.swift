//
//  LoginViewController.swift
//  example
//
//  Created by Trong Le on 1/4/16.
//  Copyright © 2016 Trong Le. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIAlertViewDelegate {

    // Declare outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var photoLabel: UIButton!
    var name: String?
    
    // Set up display.
    @IBAction func submitButton(sender: UIButton) {
        name = usernameField.text
        let alert = UIAlertController(title: "Alert View", message: "Hello \(name!)!", preferredStyle: .Alert)
        self.presentViewController(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Exit", style: .Default, handler: nil))
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
