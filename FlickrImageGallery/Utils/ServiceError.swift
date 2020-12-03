//
//  ServiceError.swift
//  FlickrImageGallery
//
//  Created by Gabriel Targon on 29/11/20.
//

import Foundation

enum ServiceError: Error {
    case dataUnavailable
    case systemUnavailable
    case custom(message: String)
    
    var localizedDescription: String {
        switch self {
        case .dataUnavailable:
            return "Error to receive data"
        case .systemUnavailable:
            return "System unavailable"
        case .custom(let message):
            return message
        }
    }
}
