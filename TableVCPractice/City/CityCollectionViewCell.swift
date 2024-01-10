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
    
        imageView.contentMode = .scaleToFill
        
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 15)
        
        explainLabel.textAlignment = .center
        explainLabel.numberOfLines = 2
        explainLabel.font = .systemFont(ofSize: 13)
        explainLabel.textColor = .systemGray
    }
    
    override func layoutSubviews() {
        imageView.layer.cornerRadius = imageView.bounds.width / 2
    }
    
}

extension CityCollectionViewCell: MyCellProtocol {
    static let identifier: String = "CityCollectionViewCell"
    
    func configureCell(data: Any) {
        let city = data as! City
        
        imageView.kf.setImage(with: URL(string: city.city_image))
        nameLabel.text = "\(city.city_name) | \(city.city_english_name)"
        explainLabel.text = city.city_explain
    }
}
