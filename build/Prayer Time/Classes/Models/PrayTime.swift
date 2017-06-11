//
//  PrayTime.swift
//  Prayer Time
//
//  Created by Omer Emre Aslan on 11/06/2017.
//  Copyright © 2017 Omer Emre Aslan. All rights reserved.
//

import Foundation
import ObjectMapper

class PrayTime: Mappable {
    //Imsak
    var fajr: String!
    //Gunes
    var sunrise: String!
    //Ogle
    var dhuhr: String!
    //Ikindi
    var asr: String!
    //Aksam
    var maghrib: String!
    //Yatsi
    var isha: String!
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        fajr    <- map["Imsak"]
        sunrise <- map["Gunes"]
        dhuhr   <- map["Ogle"]
        asr     <- map["Ikindi"]
        maghrib <- map["Aksam"]
        isha    <- map["Yatsi"]
    }
}
