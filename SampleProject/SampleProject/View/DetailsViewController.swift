//
//  DetailsViewController.swift
//  SampleProject
//
//  Created by David on 11/8/18.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var presureLbl: UILabel!
    
    
    var viewModel:  DataCellViewModel<WeatherData>?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initView()
    }

    func initView() {
        guard let viewModel = self.viewModel else {
            return
        }
        let min: Int =  Conversions.fahrenheitToCelsius(tempInF: viewModel.associatedData?.main.temp_min ?? 0)
        let max: Int =   Conversions.fahrenheitToCelsius(tempInF: viewModel.associatedData?.main.temp_max ?? 0)
        
        dateLbl.text = viewModel.associatedData?.dt_txt ?? ""
        tempLbl.text = "Temp from: \( min) to: \(max)"
        humidityLbl.text = "humidity: \(viewModel.associatedData?.main.humidity ?? 0)"
        presureLbl.text = "pressure: \(viewModel.associatedData?.main.pressure ?? 0)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
