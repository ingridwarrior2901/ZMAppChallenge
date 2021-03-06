//
//  DataManagerNetworkProvider.swift
//  ZMAppChallenge
//
//  Created by Cris on 9/04/20.
//  Copyright © 2020 Ingrid Guerrero. All rights reserved.
//

import UIKit
import os.log

enum APIErrorType: Error {
    case invalidURL
    case generalServiceError
    case invalidData
}

class DataManagerNetworkProvider: DataManagerNetworkProviderProtocol, DataManagerNetworkProtocol {
    
    //MARK: - Constants
    private struct Constants {
        static let baseURL = "https://jsonplaceholder.typicode.com"
        static let contentType = "Content-Type"
        static let jsonType = "application/json"
    }
    
    //MARK: - Properties
    
    var baseURL: URL? {
        return URL(string: Constants.baseURL)
    }
    
    //MARK: - DataManagerNetworkProviderProtocol
    
    func execute<T: Decodable>(classType: T.Type, networkParameters: DataManagerNetworkParameters, completion: @escaping (T?, APIErrorType?) -> ()) {
        
        guard var url = baseURL else {
            completion(nil, APIErrorType.invalidURL)
            return
        }
        
        url.appendPathComponent(networkParameters.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = networkParameters.httpMethod.rawValue
        request.addValue(Constants.jsonType, forHTTPHeaderField: Constants.contentType)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let resultData = data else {
                completion(nil, APIErrorType.invalidData)
                os_log("resultData is nil", type: .error)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: resultData)
                completion(result, nil)
            } catch {
                os_log("error when trying to parse the data", type: .error)
                completion(nil, APIErrorType.invalidData)
            }
        }.resume()
    }
}
