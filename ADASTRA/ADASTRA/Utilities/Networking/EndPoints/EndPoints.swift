//
//  EndPoints.swift
//  ADASTRA
//
//  Created by Masoud Roosta on 10/27/22.
//

import Foundation

struct Endpoint{
    var host: String
    var path: String
    var queryItem: [URLQueryItem] = []
}

extension Endpoint{
    var url: URL{
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = queryItem
        guard let url = components.url else{
            preconditionFailure(
                "invalid url components: \(components)"
            )
        }
        print("url = \(url)")
        return url
    }
}


extension Endpoint{
    
    static var dogFact: Self{
        Endpoint(host: Constants.baseUrlDogFactBaseUrl, path: Constants.pathDogFactAll)
    }
}


