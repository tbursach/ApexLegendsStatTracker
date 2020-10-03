//
//  AccountError.swift
//  ApexStats
//
//  Created by Trevor Bursach on 9/26/20.
//

import Foundation

enum AccountError: LocalizedError {
    
    case invalidURL
    case noData
    case thrownError(Error)
    case unableToDecode(Error)
    case unableToDecodeImage
    
    var errorDescription: String? {
        switch self {
        
        case .invalidURL:
            return "URL isn't working."
        case .noData:
            return "There was no data"
        case .thrownError(let error):
            return "There was a thrown error \(error.localizedDescription)"
        case .unableToDecode(let error):
            return "unable to decode \(error)"
        case .unableToDecodeImage:
            return "unable to decode the image"
        }
    }
    
}
