//
//  DataManager.swift
//  MapBoxSample
//
//  Created by David on 11/8/18.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire




class DataManager : DataManagerProtocol {
    
    
    func getData(  params: [String : String], fail: @escaping FailureCallback, success: @escaping SuccessCallback )-> Void {
        
        
        Alamofire.request(FORECAST_URL, method: .get, parameters: params).responseJSON {
            response in
            if response.result.isSuccess {
                
                print("Success! Got the weather data")
                let weatherJSON : JSON = JSON(response.result.value!)
                //print(weatherJSON)
                success(weatherJSON)
            }
            else {
                fail(0, "Error during getting data")
                print("Error \(String(describing: response.result.error))")
            }
        }
        
        
    }

}
