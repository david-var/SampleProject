//
//  WeatherViewModel.swift
//  SampleProject
//
//  Created by David on 11/8/18.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift


class WeatherViewModel : BaseTableViewModel<WeatherData, DataCellViewModel<WeatherData>, DataManagerProtocol > {
    
    let currentCityName = Variable<String>("Yerevan") // good place to determine user's location
    
    override init(dataMngr: DataManagerProtocol = DataManager() ) {
        super.init(dataMngr: dataMngr)
    }
    
    override func initFetch() {
        isLoading = true
        
        dataManager.getData(params: [ "q":  currentCityName.value , "appid" : APP_ID],
        fail: { [weak self](errCode, errMsg) in
            self?.isLoading = false
            self?.alertMessage = errMsg
        },
        success: { [weak self] (json) in
            // process data returned from Data Manager
            self?.isLoading = false
            
            let jsonArray = json["list"]
            var data: [WeatherData] = []
            for weatherDataJson in jsonArray{
                
                 guard let weatherData = try? JSONDecoder().decode(WeatherData.self, from: weatherDataJson.1.rawData()) else {
                    print("Error: Couldn't decode data into weather data")
                    return
                }
                data.append(weatherData)
            }
            
            self?.processFetchedData(data: data)
            
        })
    }
    
    override func processFetchedData(data: [WeatherData]) {
        self.data = data //cashing
        var vms = [DataCellViewModel<WeatherData>]()
        for weatherData in data {
            vms.append( DataCellViewModel.init(data: weatherData) )
        }
        self.cellViewModels = vms
    }
}
