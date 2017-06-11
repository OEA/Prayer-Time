//
//  Country.swift
//  Prayer Time
//
//  Created by Omer Emre Aslan on 11/06/2017.
//  Copyright © 2017 Omer Emre Aslan. All rights reserved.
//

import Foundation
import ObjectMapper

class Country: Mappable {
    var name: String!
    var nameInEnglish: String!
    var countryId: Int!
    var cities: [City]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name            <- map["UlkeAdi"]
        nameInEnglish   <- map["UlkeAdiEn"]
        countryId       <- (map["UlkeID"], IntegerTransform())
    }
}
