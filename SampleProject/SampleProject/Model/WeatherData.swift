//
//  WeatherData.swift
//  SampleProject
//
//  Created by David on 11/8/18.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation


struct Main : Codable {
    var temp_kf : Double = 0.0
    var sea_level : Double = 0.0
    var temp_min : Double = 0.0
    var temp: Double = 0.0
    var temp_max: Double = 0.0
    var humidity: Double = 0.0
    var pressure: Double = 0.0
    var grnd_level: Double = 0.0
}

struct Weather : Codable {
   var icon : String = ""
   var main : String = ""
   var id : Int = 0
   var description : String = ""
    
    func getWeatherIconName() -> String {
        
        switch (id) {
            
        case 0...300 :
            return "tstorm1"
            
        case 301...500 :
            return "light_rain"
            
        case 501...600 :
            return "shower3"
            
        case 601...700 :
            return "snow4"
            
        case 701...771 :
            return "fog"
            
        case 772...799 :
            return "tstorm3"
            
        case 800 :
            return "sunny"
        default :
            return "question"
        }
    }
}




struct Wind : Codable {
    var deg: Double = 0.0
    var speed: Double = 0.0
}

struct WeatherData : Codable {
    
    //Declare your model variables here
    var dt_txt: String = ""
    var wind: Wind
    var main: Main
    var weather: [Weather]
}
