//
//  ErrorResponse.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 29/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    var error: Error
    
    struct Error: Codable {
        var errors: [String]
    }
}
