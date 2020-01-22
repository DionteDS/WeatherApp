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
    
    let baseURL = "http://api.weatherstack.com/current"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Weather App"
        
        searchBar.placeholder = "Enter city"
        
    }
    
    func setQuery(city: String) {
        
        let params: [String: String] = ["access_key": APIKEY, "query": "San Francisco", "units": "f"]
        
        fetchData(url: baseURL, parameters: params)
    }
    
    func fetchData(url: String, parameters: [String: String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            
            if response.result.isSuccess {
                print("Got data")
            }
        }
        
    }


}


extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        setQuery(city: searchBar.text!)
        
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
        
    }
    
}
