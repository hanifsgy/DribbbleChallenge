//
//  MainRoute.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 23/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import Foundation
import RxCoordinator

enum MainRoute: Route {
    case login
    case home
    case detail
    
    func prepareTransition(coordinator: AnyCoordinator<MainRoute>) -> NavigationTransition {
        switch self {
        case .login:
            var vc = LoginViewController.instantiateFromNib()
            let viewModel = LoginViewModel(coordinator: coordinator)
            vc.bind(to: viewModel)
            return .push(vc)
        case .home:
            let coordinator = BasicCoordinator<HomeRoute>(initialRoute: .home)
            let animation = Animation(presentationAnimation: CustomPresentations.fadePresentation, dismissalAnimation: nil)
            return .present(coordinator, animation: animation)
        case .detail:
            return .dismiss()
        }
    }
}
