//
//  APIResponse.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 27/09/2020.
//

import Foundation

enum APIResponse {
    typealias MultipleDevices = Result<[Station], Error>
    typealias OneDevice = Result<Station, Error>
}
