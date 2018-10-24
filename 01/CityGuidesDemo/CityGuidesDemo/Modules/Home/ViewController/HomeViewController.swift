//
//  HomeViewController.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 23/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, BindableType {
    
    var viewModel: HomeViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: "DetailCell")
        collectionView.delegate = nil
        collectionView.dataSource = nil
    }
    
    func bindViewModel() {
        viewModel.output.items
            .bind(to: collectionView.rx.items(cellIdentifier: "DetailCell", cellType: DetailCell.self)) {
                (_, element, cell) in
            }
            .disposed(by: disposeBag)
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}
