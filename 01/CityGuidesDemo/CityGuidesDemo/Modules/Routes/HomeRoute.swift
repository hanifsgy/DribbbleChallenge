
//
//  HomeRoute.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 23/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import Foundation
import RxCoordinator

enum HomeRoute: Route {
    case home
    case detail
    case search
    
    func prepareTransition(coordinator: AnyCoordinator<HomeRoute>) -> NavigationTransition {
        switch self {
        case .home:
            var vc = HomeViewController.instantiateFromNib()
            let viewModel = HomeViewModel(coordinator: coordinator)
            vc.bind(to: viewModel)
            return .push(vc)
        default:
            return .dismiss()
        }
    }
}
