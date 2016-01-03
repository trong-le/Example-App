//
//  ImageViewController.swift
//  example
//
//  Created by Trong Le on 12/29/15.
//  Copyright © 2015 Trong Le. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate
{

    var imageURL: NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                getImage()
            }
        }
    }
    
    let imageView = UIImageView()
    
    // Get image from image URL. Not using main thread to make faster
    private func getImage() {
        if let url = imageURL {
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
                let imageData = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue()) {
                    if url == self.imageURL {
                        if imageData != nil {
                            self.image = UIImage(data: imageData!)
                        } else {
                            self.image = nil
                        }
                    }
                }
            }
        }
    }
    
    // Size image
    private var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.5
            scrollView.maximumZoomScale = 1.5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
    
    // Set up image
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            getImage()
        }
    }

}
