//
//  ViewController.swift
//  WeatherApp
//
//  Created by Dionte Silmon on 1/21/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherStatus: UILabel!
    @IBOutlet weak var weatherTemp: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windDirection: UILabel!
    
    
    // Base URL
    let baseURL = "http://api.weatherstack.com/current"
    
    // WeatherDataModel object
    var weatherDataModel = WeatherDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Weather App"
        
        searchBar.placeholder = "Enter city"
        
    }
    
    //MARK: - Setup the query
    func setQuery(city: String) {
        
        let params: [String: String] = ["access_key": APIKEY, "query": city, "units": "f"]
        
        fetchData(url: baseURL, parameters: params)
    }
    
    //MARK: - NETWORKING
    
    // fetch the weather data
    func fetchData(url: String, parameters: [String: String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            
            // check the response
            if response.result.isSuccess {
                let jsonData: JSON = JSON(response.result.value!)
                self.parseData(json: jsonData)
            }
        }
        
    }
    
    // parse the weather data
    func parseData(json: JSON) {
        
        // Store the data in the weatherDataModel properties
        if let weatherTemperature = json["current"]["temperature"].int {
            weatherDataModel.temperature = weatherTemperature
            
            let weatherHumidity = json["current"]["humidity"].intValue
            weatherDataModel.humidity = weatherHumidity
            
            let weatherWindSpeed = json["current"]["wind_speed"].intValue
            weatherDataModel.windSpeed = weatherWindSpeed
            
            let weatherDirection = json["current"]["wind_dir"].stringValue
            weatherDataModel.windDir = weatherDirection
            
            let weatherCode = json["current"]["weather_code"].intValue
            weatherDataModel.statusCode = weatherCode
            
            let weatherDescription = json["current"]["weather_descriptions"][0].stringValue
            weatherDataModel.weather = weatherDescription
            
            let weatherPic = weatherDataModel.getWeatherCode(code: weatherDataModel.statusCode)
            weatherDataModel.weatherIcon = weatherPic
            
            if let cityName = json["location"]["name"].string {
                weatherDataModel.city = cityName
                
                let cityTime = json["location"]["localtime"].stringValue
                weatherDataModel.time = cityTime
                
                let stateName = json["location"]["region"].stringValue
                weatherDataModel.state = stateName
            }
            
            // call to update the UI
            self.updateUI()
            
        }
    }

    
    //MARK: - Update the UI
    func updateUI() {
        
        // Update the UI on the main thread
        DispatchQueue.main.async {
            self.cityLabel.text = self.weatherDataModel.city
            self.stateLabel.text = self.weatherDataModel.state
            self.weatherImage.image = UIImage(named: self.weatherDataModel.weatherIcon)
            self.weatherStatus.text = self.weatherDataModel.weather
            self.weatherTemp.text = "\(self.weatherDataModel.temperature)˚F"
            self.windSpeedLabel.text = "\(self.weatherDataModel.windSpeed) MPH"
            self.humidityLabel.text = "\(self.weatherDataModel.humidity) %"
            self.windDirection.text = self.weatherDataModel.windDir
            self.timeLabel.text = self.weatherDataModel.time
        }
        
    }

}

//MARK: - Search bar delegate methods
extension ViewController: UISearchBarDelegate {
    
    // Get the user searched city
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        setQuery(city: searchBar.text!)
        
        // Dismiss the keyboard on the main thread
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
        
    }
    
}
