//
//  BaseViewController.swift
//  TodoDemo
//
//  Created by Hanif Sugiyanto on 24/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import UIKit
import RxSwift


class BaseViewController: UIViewController {
    
    // MARK: Initialize
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Rx
    private let disposeBag = DisposeBag()
    
    // MARK: Layout Constrains
    
    private(set) var didSetupConstraints = false
    
    override func viewDidLoad() {
        super.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    func setupConstraints() {
        
    }
    
}
