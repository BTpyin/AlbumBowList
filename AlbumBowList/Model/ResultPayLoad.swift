//
//  ResultPayLoad.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 21/6/2021.
//

import Foundation
import ObjectMapper
class ResultPayload:  Mappable {
    
    @objc dynamic var resultCount: Int = 0
    var results: [Album]?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results <- map["results"]
    }
}
