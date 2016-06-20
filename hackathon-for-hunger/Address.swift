//
//  Address.swift
//  hackathon-for-hunger
//
//  Created by Mikael Mukhsikaroyan on 6/11/16.
//  Copyright © 2016 Hacksmiths. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import JSONCodable

class Address: Object, Mappable {
        
    dynamic var street_address: String!
    dynamic var street_address_two: String?
    dynamic var city: String!
    dynamic var zip: String!
    dynamic var state: String!
    dynamic var isDefault: Bool = false
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        street_address      <- map["street_address"]
        street_address_two  <- map["street_address_two"]
        city                <- map["city"]
        zip                 <- map["zip"]
        state               <- map["state"]
        isDefault           <- map["default"]
        
    }

}

extension Address: JSONEncodable {
    func toJSON() throws -> [String:AnyObject] {
        return try JSONEncoder.create({ (encoder) -> Void in
            try encoder.encode(street_address, key: "street_address")
            try encoder.encode(street_address_two, key: "street_address_two")
            try encoder.encode(city, key: "city")
            try encoder.encode(zip, key: "zip")
            try encoder.encode(state, key: "state")
            try encoder.encode(isDefault, key: "deafult")
        })
    }
}
