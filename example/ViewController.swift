//
//  ViewController.swift
//  example
//
//  Created by Trong Le on 12/29/15.
//  Copyright © 2015 Trong Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "Seattle":
                    ivc.imageURL = Locations.Seattle
                    ivc.title = "Seattle, Washington"
                case "Hillsboro":
                    ivc.imageURL = Locations.Hillsboro
                    ivc.title = "Hillsboro, Ohio"
                case "Columbus":
                    ivc.imageURL = Locations.Columbus
                    ivc.title = "Columbus, Ohio"
                case "Cincinnati":
                    ivc.imageURL = Locations.Cincinnati
                    ivc.title = "Cincinnati, Ohio"
                default: break
                }
            }
        }
    }

}

