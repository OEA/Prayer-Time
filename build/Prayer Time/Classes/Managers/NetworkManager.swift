//
//  NetworkManager.swift
//  Prayer Time
//
//  Created by Omer Emre Aslan on 10/06/2017.
//  Copyright © 2017 Omer Emre Aslan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private enum Path: String {
    case countries = "/ulkeler"
    case cities = "/sehirler"
    case counties = "/ilceler"
    case countyDetail = "/ilce"
    case praytimes = "/vakitler"
}

private let baseUrl = "http://ezanvakti.herokuapp.com"

class NetworkManager {
    //TODO: It will based on release mode
    
    //To show debug messages.
    private let isDebugMode = true
    
    static let shared: NetworkManager = NetworkManager()
    
    fileprivate func performRequest(forPath path: Path,
                                    method: HTTPMethod,
                                    withParameters parameters: [String: Any]?,
                                    completion: @escaping (_ jsonResult: JSON?, _ error: Error?) -> Void) {
        Alamofire.request(baseUrl + path.rawValue, method: method, parameters: parameters).responseJSON { responseData in
            if self.isDebugMode {
                if let request = responseData.request {
                    print("\(method.rawValue) :\(String(describing: request))\n")
                }
            }
            
            if responseData.result.value != nil {
                let jsonData = JSON(responseData.result.value!)
                completion(jsonData, nil)
            } else {
                completion(nil, responseData.result.error)
            }
        }
    }
    
    func getCountries(completion: @escaping (_ countries: [Country]?, _ error: Error?) -> Void) {
        performRequest(forPath: Path.countries, method: .get, withParameters: nil) { (countriesJson, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            guard let countriesJsonArray = countriesJson?.arrayValue else {
                return
            }
            
            var countries: [Country] = []
            for countryJson in countriesJsonArray {
                let country = Country(JSON: countryJson.dictionaryObject!)
                
                countries.append(country!)
            }
            
            completion(countries, error)
        }
    }
    
    func getCitiesOfCountry(id countryId: Int, completion: @escaping (_ cities: [City]?, _ error: Error?) -> Void) {
        let parameters = [
            "ulke": countryId
        ]
        
        performRequest(forPath: Path.cities, method: .get, withParameters: parameters) { (citiesJson, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            guard let citiesJsonArray = citiesJson?.arrayValue else {
                return
            }
            
            var cities: [City] = []
            for cityJson in citiesJsonArray {
                let city = City(JSON: cityJson.dictionaryObject!)
                
                cities.append(city!)
            }
            
            completion(cities, error)
        }
    }
    
    func getCountiesOfCity(id cityId: Int, completion: @escaping (_ counties: [County]?, _ error: Error?) -> Void) {
        let parameters = [
            "sehir": cityId
        ]
        
        performRequest(forPath: Path.counties, method: .get, withParameters: parameters) { (countiesJson, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            guard let countiesJsonArray = countiesJson?.arrayValue else {
                return
            }
            
            var counties: [County] = []
            for countyJson in countiesJsonArray {
                let county = County(JSON: countyJson.dictionaryObject!)
                
                counties.append(county!)
            }
            
            completion(counties, error)
        }
    }
    
    func getPrayTimesOfCounty(id countyId: Int, completion: @escaping (_ prayTimes: [PrayTime]?, _ error: Error?) -> Void) {
        let parameters = [
            "ilce": countyId
        ]
        
        performRequest(forPath: Path.praytimes, method: .get, withParameters: parameters) { (prayTimesJson, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            guard let prayTimesJsonArray = prayTimesJson?.arrayValue else {
                return
            }
            
            var prayTimes: [PrayTime] = []
            for prayTimeJson in prayTimesJsonArray {
                let prayTime = PrayTime(JSON: prayTimeJson.dictionaryObject!)
                
                prayTimes.append(prayTime!)
            }
            
            completion(prayTimes, error)
        }
    }
}
