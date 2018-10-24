//
//  HomeViewModel.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 23/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import Foundation
import RxSwift
import RxCoordinator
import Action


protocol HomeViewModelInput {
    var searchTrigger: InputSubject<Void> { get }
    var detailTrigger: InputSubject<Void> { get }
}

protocol HomeViewModelOutput {
    var items: Observable<[DetailModel]> { get }
}

protocol IHomeViewModel {
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
}

class HomeViewModel: IHomeViewModel, HomeViewModelInput, HomeViewModelOutput {
    
    
    var input: HomeViewModelInput { return self }
    var output: HomeViewModelOutput { return self }
    
    
    lazy var searchTrigger: InputSubject<Void> = searchAction.inputs
    lazy var detailTrigger: InputSubject<Void> = detailAction.inputs
    
    private let coordinator: AnyCoordinator<HomeRoute>
    
    private lazy var searchAction = CocoaAction { [weak self] in
        guard let `self` = self else { return .empty() }
        return self.coordinator.transition(to: .search).presentation
    }
    
    private lazy var detailAction = CocoaAction { [weak self] in
        guard let `self` = self else { return .empty() }
        return self.coordinator.transition(to: .detail).presentation
    }
    
    var items: Observable<[DetailModel]> = .just([
        DetailModel(id: 1,
                    title: "Ālabama",
                    subTitle: "Argentina",
                    location: "Sauolo Paulo",
                    image: "/"),
        
        DetailModel(id: 1,
                    title: "Ālabama",
                    subTitle: "Argentina",
                    location: "Sauolo Paulo",
                    image: "/"),
        
        DetailModel(id: 1,
                    title: "Ālabama",
                    subTitle: "Argentina",
                    location: "Sauolo Paulo",
                    image: "/"),
        ])
    
    init(coordinator: AnyCoordinator<HomeRoute>) {
        self.coordinator = coordinator
    }
}





