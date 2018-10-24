//
//  LoginViewController.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 23/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController, BindableType {
    
    var viewModel: LoginViewModel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        loginButton.rx.tap
            .bind(to: viewModel.input.loginTrigger)
            .disposed(by: disposeBag)
    }
    
}
