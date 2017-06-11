//
//  City.swift
//  Prayer Time
//
//  Created by Omer Emre Aslan on 11/06/2017.
//  Copyright © 2017 Omer Emre Aslan. All rights reserved.
//

import Foundation
import ObjectMapper

class City: Mappable {
    var name: String!
    var nameInEnglish: String!
    var cityId: Int!
    var counties: [County]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name            <- map["SehirAdi"]
        nameInEnglish   <- map["SehirAdiEn"]
        cityId          <- (map["SehirID"], IntegerTransform())
    }
}
