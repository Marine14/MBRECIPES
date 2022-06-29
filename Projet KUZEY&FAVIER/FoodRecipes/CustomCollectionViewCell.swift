//
//  CustomCollectionViewCell.swift
//  Demo
//
//  Created by Julie Saby on 12/11/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(imageName: String, title: String) {
        titleLabel.text = title
        //TODO: afficher l'image
        categoryImageView.downloaded(from: imageName)
    }
}
