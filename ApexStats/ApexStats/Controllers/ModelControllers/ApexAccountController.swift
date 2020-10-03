//
//  ApexAccountController.swift
//  ApexStats
//
//  Created by Trevor Bursach on 9/26/20.
//

import Foundation
import UIKit

struct StringConstants {
    fileprivate static let baseURL = "https://public-api.tracker.gg/v2/apex/standard"
    fileprivate static let profileComponent = "profile"
    fileprivate static let platformComponent = "xbl"
    fileprivate static let accountComponent = "Evolved Rogue"
    
    //TRN-Api-Key
    //6730a015-de49-4590-b332-bbbaba3c1026
    
}

class ApexAccountController {
    
    static func fetchAccountStats(searchTerm: String, completion: @escaping(Result<[LevelStat], AccountError>) -> Void) {
        
        guard let baseURL = URL(string: StringConstants.baseURL) else { return completion(.failure(.invalidURL)) }
        
        let profileURL = baseURL.appendingPathComponent(StringConstants.profileComponent)
        
        let platformURL = profileURL.appendingPathComponent(StringConstants.platformComponent)
        
        let finalURL = platformURL.appendingPathComponent(StringConstants.accountComponent)
        
        print(finalURL)
        
    var request = URLRequest(url: finalURL)
        
        request.httpMethod = "GET"
        
        let headers = ["TRN-Api-Key": "6730a015-de49-4590-b332-bbbaba3c1026"]
        
        for (key, value) in headers {
            request.setValue(key, forHTTPHeaderField: value)
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let secondLevelDictionary = topLevelDictionary.data
                let thirdLevelObject = secondLevelDictionary.segments
                
                var placeHolderArray: [LevelStat] = []
                
                for object in thirdLevelObject {
                    let stat = object.stats
                    let level = stat.level
                    placeHolderArray.append(level)
                }
                
                return completion(.success(placeHolderArray))
                
            } catch {
                return completion(.failure(.unableToDecode(error)))
            }
        }.resume()

//    URLSession.shared.dataTask(with: request) { data, response, error in }
////    request.setValue("secret-keyValue", forHTTPHeaderField: "secret-key")
//    session.dataTaskWithRequest(request){
//        (data: NSData?,response: URLResponse?, error: NSError?) -> Void in }
//
    }
}
