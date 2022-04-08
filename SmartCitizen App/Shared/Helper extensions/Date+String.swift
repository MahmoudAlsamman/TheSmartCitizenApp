//
//  Date+String.swift
//  TheSmartCitizenApp
//
//  Created by Mahmoud Alsamman on 27/03/2022.
//

import Foundation

extension Date {
    var toString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM"
        return formatter.string(from: self)
    }
}
