//
//  MagazineTableViewCell.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/8/24.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {
    
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    let dateFormatter = DateFormatter()

    override func awakeFromNib() {
        super.awakeFromNib()

        thumbnailImageView.contentMode = .scaleToFill
        thumbnailImageView.layer.cornerRadius = 12
        
        titleLabel.numberOfLines = 2
        titleLabel.font = .boldSystemFont(ofSize: 22)
        
        subTitleLabel.textColor = .systemGray
        subTitleLabel.font = .systemFont(ofSize: 15)

        dateLabel.textColor = .systemGray
        dateLabel.font = .systemFont(ofSize: 14)
    }

}

extension MagazineTableViewCell: MyCellProtocol {    
    func configureCell(data: Any) {
        let magazine = data as! Magazine
        
        thumbnailImageView.kf.setImage(with: URL(string: magazine.photo_image))
        titleLabel.text = magazine.title
        subTitleLabel.text = magazine.subtitle
        dateLabel.text = magazine.formattedDate
    }
}
