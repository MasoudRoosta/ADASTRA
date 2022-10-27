//
//  NetworkingErrorHandler.swift
//  ADASTRA
//
//  Created by Masoud Roosta on 10/27/22.
//

import Foundation


/// Error Handeling
enum NetworkRequestError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case urlSessionFailed(_ error: URLError)
    case unknownError
    
    var errorDescription: String?{
        switch self {
        case .invalidRequest:
            return "Invalid Request"
        case .badRequest:
            return "Bad request"
        case .unauthorized:
            return "Unauthorized"
        case .forbidden:
            return "Forbidden Request"
        case .notFound:
            return "Request Not Found"
        case .error4xx(let error):
            return "\(error)"
        case .serverError:
            return "Server Error"
        case .error5xx(let error):
            return "\(error)"
        case .decodingError:
            return "Decodeing Error"
        case .urlSessionFailed( _):
            return "Connection Error"
        case .unknownError:
            return "Unknown Error"
        }
    }
    
    var recoverySuggestion: String?{
        switch self {
        case .invalidRequest:
            return "Your request is invalid"
        case .badRequest:
            return "Bad URL request"
        case .unauthorized:
            return "You are unauthorized"
        case .forbidden:
            return "The service is not available in your location"
        case .notFound:
            return "Your request not found"
        case .error4xx(let error):
            return "Your request get \(error)"
        case .serverError:
            return "Error in reaching to Server"
        case .error5xx(let error):
            return "Your request get \(error)"
        case .decodingError:
            return "Error in decode response"
        case .urlSessionFailed(let error):
            return "Error in connecting to Server: \(error.localizedDescription)"
        case .unknownError:
            return "Unknown error happend"
        }
    }
}

struct LocalizedAlertError: LocalizedError {
    let underlyingError: LocalizedError
    var errorDescription: String? {
        underlyingError.errorDescription
    }
    var recoverySuggestion: String? {
        underlyingError.recoverySuggestion
    }

    init?(error: Error?) {
        guard let localizedError = error as? LocalizedError else { return nil }
        underlyingError = localizedError
    }
}

