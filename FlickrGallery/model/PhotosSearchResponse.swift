//
//  PhotosSearchResponse.swift
//  FlickrGallery
//
//  Created by Yuliia Khrupina on 6/25/22.
//

import Foundation
import ObjectMapper

class PhotosSearchResponse: Mappable {
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        photos <- map["photos"]
    }
    
    var photos: Photos?
}

class Photos: Mappable {
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        photo <- map["photo"]
    }
    
    var photo : Array<Photo>?
}

class Photo: Mappable {
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        secret <- map["secret"]
        server <- map["server"]
        title <- map["title"]
    }
    
    var id: String?
    var secret: String?
    var server: String?
    var title: String?
}
