//
//  NetworkService.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 29/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//


import Moya
import RxSwift

struct NetworkService {
    
    static let instance = NetworkService()
    fileprivate let provider: MoyaProvider<MultiTarget>
    
    private init() {
        self.provider = MoyaProvider<MultiTarget>(
            plugins: [
                RequestLoadingPlugin()
            ]
        )
    }
}

extension NetworkService {
    
     func requestObject<T: TargetType, C: Decodable>(_ t: T, c: C.Type) -> Single<C> {
        return provider.rx.request(MultiTarget(t))
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(c.self)
            .catchError({ (error) in
                guard let errorResponse = error as? MoyaError else { return Single.error(NetworkError.IncorrectDataReturned) }
                switch errorResponse {
                case .underlying(let (e, _)):
                    return Single.error(NetworkError(error: e as NSError))
                default:
                    let body = try errorResponse.response?.map(ErrorResponse.self)
                    if let body = body {
                        return Single.error(NetworkError.SoftError(message: body.error.errors.first))
                    } else {
                        return Single.error(NetworkError.IncorrectDataReturned)
                    }
                }
            })
    }

}
