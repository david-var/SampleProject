//
//  Extensions.swift
//  SampleProject
//
//  Created by David on 11/8/18.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    static func presentInfoAlert ( _ viewController: UIViewController, message: String!, title:String!) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:  "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        viewController.present(alert, animated: true, completion: nil)
    }
}

// Util class
class Conversions {
    
    // Convert from F to C (Integer)
    static func fahrenheitToCelsius(tempInF:Double) ->Int {
        return Int(tempInF - 273.15)
    }
}
