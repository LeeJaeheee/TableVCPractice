//
//  CityCollectionViewCell.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/9/24.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var explainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        imageView.layer.cornerRadius = (UIScreen.main.bounds.width - (24 * 3)) / 4
        imageView.contentMode = .scaleToFill
        
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 15)
        
        explainLabel.textAlignment = .center
        explainLabel.numberOfLines = 2
        explainLabel.font = .systemFont(ofSize: 13)
        explainLabel.textColor = .systemGray
    }
    
    func configureCell(city: City) {
        imageView.kf.setImage(with: URL(string: city.city_image))
        
        nameLabel.text = "\(city.city_name) | \(city.city_english_name)"
        
        explainLabel.text = city.city_explain
    }
    
}
