//
//  BaseViewController.swift
//  SampleProject
//
//  Created by David on 11/9/18.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var greyView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
     Show activity indicator
     */
    func showActivityIndicator() {
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint.init(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        activityIndicator.startAnimating()
        
        greyView = UIView()
        greyView.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        greyView.backgroundColor = UIColor.black
        greyView.alpha = 0.5
        
        self.view.addSubview(greyView)
        greyView.addSubview(activityIndicator)
    }
    
   /*
    * Hide activity indicator
    */
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        self.greyView.removeFromSuperview()
    }
    
}
