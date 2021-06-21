//
//  ResultPayLoad.swift
//  PhotoBook
//
//  Created by Bowie Tso on 21/6/2021.
//

import Foundation
import ObjectMapper
class ResultPayload:  Mappable {
    
    @objc dynamic var resultCount: Int = 0
    var results: [Photo]?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
    }
}
