//
//  LoginViewModel.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 23/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import Foundation
import RxSwift
import Action
import RxCoordinator

protocol LoginViewModelInput {
    var loginTrigger: InputSubject<Void> { get }
}

protocol LoginViewModelOutput {
    
}

protocol ILoginViewModel {
    var input: LoginViewModelInput { get }
    var output: LoginViewModelOutput { get }
}

class LoginViewModel: ILoginViewModel, LoginViewModelInput, LoginViewModelOutput {
    
    var input: LoginViewModelInput { return self }
    var output: LoginViewModelOutput { return self }
    
    lazy var loginTrigger: InputSubject<Void>  = loginAction.inputs
    
    private let coordinator: AnyCoordinator<MainRoute>
    
    private lazy var loginAction = CocoaAction { [weak self] in
        guard let `self` = self else { return .empty() }
        return self.coordinator.transition(to: .home).presentation
    }
    
    init(coordinator: AnyCoordinator<MainRoute>) {
        self.coordinator = coordinator
    }
}
