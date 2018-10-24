//
//  DetailCell.swift
//  CityGuidesDemo
//
//  Created by Hanif Sugiyanto on 24/10/18.
//  Copyright © 2018 Personal Organization. All rights reserved.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var name: Label!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var buttonExplore: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
