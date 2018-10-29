//
//  CityAPI.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 29/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import Moya

enum CityAPI {
    case travel
}

extension CityAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://private-e73dc8-cityguides.apiary-mock.com")!
    }
    
    var path: String {
        switch self {
        case .travel:
            return "/travel"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self.method {
        case .put, .post:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        default:
            return .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type"  : "application/json",
            "Accept"        : "application/json"
        ]
    }
    
}
