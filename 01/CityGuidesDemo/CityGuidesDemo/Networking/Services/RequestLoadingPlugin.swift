//
//  RequestLoadingPlugin.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 29/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import Moya
import Result

public final class RequestLoadingPlugin: PluginType {
    
    init() {}
    
    // MARK: Plugin
    /// Called by the provider as soon as the request is about to start
    public func willSend(_ request: RequestType, target: TargetType) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    /// Called by the provider as soon as a response arrives, even if the request is canceled.
    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
