//
//  DogFactRequestModel.swift
//  ADASTRA
//
//  Created by Masoud Roosta on 10/27/22.
//

import Foundation
import Combine

struct DogFactRequestModel: Request{
    typealias ReturnType = [DogFactDataModel]
    let headers: [String : String] = [:]
    
    static func getDogFacts() -> AnyPublisher <[DogFactDataModel], NetworkRequestError>{
        
        let request: DogFactRequestModel = Self()
        let requestUrl = Endpoint.dogFact.url
        let apiClient = APIClient(baseURL: requestUrl)
        return apiClient.dispatch(request)
            .subscribe(on: RunLoop.main)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
