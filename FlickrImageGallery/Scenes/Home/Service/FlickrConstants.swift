//
//  FlickrConstants.swift
//  FlickrImageGallery
//
//  Created by Gabriel Targon on 29/11/20.
//

import Foundation

class FlickrConstants {
    
    struct Flickr {
        static let APIHost = "https://api.flickr.com/services/rest/"
        static let imagesArrayURL = "\(Flickr.APIHost)?method=\(FlickrParameterValues.SearchMethod)&format=\(FlickrParameterValues.ResponseFormat)&api_key=\(FlickrParameterValues.APIKey)&tags=kitten&page=1"
    }
    
    struct FlickrParameterValues {
        static let SearchMethod = "flickr.photos.search"
        static let APIKey = "f9cc014fa76b098f9e82f1c288379ea1"
        static let ResponseFormat = "json"
    }
    
}
