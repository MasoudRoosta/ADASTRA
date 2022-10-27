//
//  Networking.swift
//  ADASTRA
//
//  Created by Masoud Roosta on 10/27/22.
//

import Foundation
import Combine

enum HTTPRequestMethod: String{
    case get               =               "GET"
    case post              =               "POST"
    case put               =               "PUT"
    case delete            =               "DELETE"
}

// Our Request Protocol
protocol Request {
//    var path: String { get }
    var method: HTTPRequestMethod { get }
    var contentType: String { get }
    var body: [String: Any]? { get }
    var headers: [String: String] { get }
    associatedtype ReturnType: Codable
}

// Defaults and Helper Methods
extension Request {
    
    // Defaults
    var method: HTTPRequestMethod { return .get }
    var contentType: String { return "application/json" }
    var queryParams: [String: String]? { return nil }
    var body: [String: Any]? { return nil }
    var headers: [String: String] { return headers }
    
    /// Serializes an HTTP dictionary to a JSON Data Object
    /// - Parameter params: HTTP Parameters dictionary
    /// - Returns: Encoded JSON
    private func requestBodyFrom(params: [String: Any]?) -> Data? {
        guard let params = params else { return nil }
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return nil
        }
        return httpBody
    }
    
    /// Transforms an Request into a standard URL request
    /// - Parameter baseURL: API Base URL to be used
    /// - Returns: A ready to use URLRequest
    func asURLRequest(requestURL: URL) -> URLRequest? {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.httpBody = requestBodyFrom(params: body)
        request.allHTTPHeaderFields = headers
        return request
    }
}
