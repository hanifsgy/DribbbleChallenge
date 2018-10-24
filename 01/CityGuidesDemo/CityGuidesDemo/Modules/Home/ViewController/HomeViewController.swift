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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func bindViewModel() {
        
    }
    
    
}
