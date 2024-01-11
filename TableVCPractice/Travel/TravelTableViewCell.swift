//
//  TravelTableViewCell.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/11/24.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell, MyCellProtocol {
    
    static var identifier: String = "TravelTableViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeStackView: UIStackView!
    @IBOutlet var gradeAndSaveLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var gradeImageList: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .boldSystemFont(ofSize: 14)
        
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 0
        
        gradeStackView.tintColor = .systemYellow
        
        gradeAndSaveLabel.font = .systemFont(ofSize: 12)
        gradeAndSaveLabel.textColor = .lightGray
        
        travelImageView.contentMode = .scaleToFill
        travelImageView.layer.cornerRadius = 8
        travelImageView.clipsToBounds = true
        
        likeButton.tintColor = .white
    }

    func configureCell(data: Any) {
        let travel = data as! Travel
        
        titleLabel.text = travel.title
        
        descriptionLabel.text = travel.description
        
        travelImageView.kf.setImage(with: URL(string: travel.travel_image!))
        
        gradeAndSaveLabel.text = "(\(travel.grade!)) • 저장 \(String(travel.save!.formatted()))"
        
        likeButton.setImage(UIImage(systemName: travel.like! ? "heart.fill" : "heart"), for: .normal)
        
        //TODO: 로직 다시 정리하기, 옵셔널 바인딩 해버리기
        gradeImageList.enumerated().forEach { (i, imageView) in
            if i < Int(travel.grade!) {
                imageView.image = UIImage(systemName: "star.fill")
            } else if i == Int(travel.grade!) && travel.grade! - 0.5 >= Double(i) {
                imageView.image = UIImage(systemName: "star.fill.left")
            } else {
                imageView.image = UIImage(systemName: "star")
            }
        }
        
    }
    
}
