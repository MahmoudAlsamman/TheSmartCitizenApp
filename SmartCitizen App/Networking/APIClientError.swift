//
//  APIClientError.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 26/09/2020.
//

import Foundation

enum APIClientError: Error {
    case decoding
    case badHTTPResponse(statusCode: Int)
    case noDataRetrieved
    case HTTPResponse
}
