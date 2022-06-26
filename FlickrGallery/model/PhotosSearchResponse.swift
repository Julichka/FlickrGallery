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
    
    func getImageUrl(size: String) -> String {
        return "https://live.staticflickr.com/\(server ?? "")/\(id ?? "")_\(secret ?? "")_\(size).jpg"
    }
    
    var id: String?
    var secret: String?
    var server: String?
    var title: String?
}
