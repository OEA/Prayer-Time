//
//  IntegerTransform.swift
//  Prayer Time
//
//  Created by Omer Emre Aslan on 11/06/2017.
//  Copyright © 2017 Omer Emre Aslan. All rights reserved.
//

import Foundation
import ObjectMapper

open class IntegerTransform: TransformType {
    public typealias Object = Int
    public typealias JSON = String
    
    public init() {}
    
    open func transformFromJSON(_ value: Any?) -> Int? {
        guard let stringValue = value as? String else {
            return nil
        }
        
        return Int(stringValue)
    }
    
    open func transformToJSON(_ value: Int?) -> String? {
        guard let intValue = value else {
            return nil
        }
        return String(intValue)
    }
}
