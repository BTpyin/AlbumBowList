//
//  Photo.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 21/6/2021.
//

import Foundation
import ObjectMapper

class Album : Mappable{
    
//    "wrapperType":"collection", "collectionType":"Album", "artistId":909253, "collectionId":1469577723, "amgArtistId":468749, "artistName":"Jack Johnson", "collectionName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "collectionCensoredName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "artistViewUrl":"https://music.apple.com/us/artist/jack-johnson/909253?uo=4", "collectionViewUrl":"https://music.apple.com/us/album/jack-johnson-friends-sing-longs-lullabies-for-film/1469577723?uo=4", "artworkUrl60":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/60x60bb.jpg", "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg", "collectionPrice":9.99, "collectionExplicitness":"notExplicit", "trackCount":15, "copyright":"℗ 2014 Brushfire Records", "country":"USA", "currency":"USD", "releaseDate":"2006-02-07T08:00:00Z", "primaryGenreName":"Rock"}
    
    @objc dynamic var artistId : Int = 0
    @objc dynamic var collectionId : Int = 0
    @objc dynamic var artistName : String?
    @objc dynamic var collectionName : String?
    @objc dynamic var collectionCensoredName : String?
    @objc dynamic var artistViewUrl : String?
    @objc dynamic var collectionViewUrl : String?
    @objc dynamic var artworkUrl60 : String?
    @objc dynamic var artworkUrl100 : String?
    @objc dynamic var collectionPrice : Double = 0.0
    @objc dynamic var collectionExplicitness: String?
    @objc dynamic var trackCount : Int = 0
    @objc dynamic var copyright : String?
    @objc dynamic var country : String?
    @objc dynamic var currency : String?
    @objc dynamic var releaseDate : Date?
    @objc dynamic var primaryGenreName : String?
    
    
    required convenience init?(map: Map) {
        self.init()
    
    }

    func mapping(map: Map) {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz"
        artistId <- map["artistId"]
        collectionId <- map["collectionId"]
        artistName <- map["artistName"]
        collectionName <- map["collectionName"]
        collectionCensoredName <- map["collectionCensoredName"]
        artistViewUrl <- map["artistViewUrl"]
        collectionViewUrl <- map["collectionViewUrl"]
        artworkUrl60 <- map["artworkUrl60"]
        artworkUrl100 <- map["artworkUrl100"]
        collectionPrice <- map["collectionPrice"]
        collectionExplicitness <- map["collectionExplicitness"]
        trackCount <- map["trackCount"]
        copyright <- map["copyright"]
        country <- map["country"]
        currency <- map["currency"]
        primaryGenreName <- map["primaryGenreName"]
        var s:String?
        s <- map["releaseDate"]
        releaseDate = dateFormatterGet.date(from: s!)
        
    }
}
