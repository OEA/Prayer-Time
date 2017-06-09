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
    case prayertimes = "/vakitler"
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
                    print("Sending Request:\n\(String(describing: request))\n")
                }
                
                if let response = responseData.response {
                    print("Getting Response:\n\(String(describing: response))\n")
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
}
