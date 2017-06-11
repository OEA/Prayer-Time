//
//  County.swift
//  Prayer Time
//
//  Created by Omer Emre Aslan on 11/06/2017.
//  Copyright © 2017 Omer Emre Aslan. All rights reserved.
//

import Foundation
import ObjectMapper

class County: Mappable {
    var name: String!
    var nameInEnglish: String!
    var countyId: Int!
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name            <- map["IlceAdi"]
        nameInEnglish   <- map["IlceAdiEn"]
        countyId        <- (map["IlceID"], IntegerTransform())
    }
}
