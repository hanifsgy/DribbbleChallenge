//
//  DetailCell.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 24/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import UIKit
import RxSwift

class DetailCell: UITableViewCell {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
