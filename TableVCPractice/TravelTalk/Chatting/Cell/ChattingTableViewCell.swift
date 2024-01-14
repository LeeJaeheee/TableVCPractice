//
//  ChattingTableViewCell.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/14/24.
//

import UIKit

class ChattingTableViewCell: UITableViewCell, MyCellProtocol {
    static let identifier: String = "ChattingTableViewCell"
    
    @IBOutlet var messageView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageView.layer.cornerRadius = 8
        messageView.layer.borderColor = UIColor.systemGray.cgColor
        messageView.layer.borderWidth = 1
        
        profileImageView.layer.borderColor = UIColor.systemGray5.cgColor
        profileImageView.layer.borderWidth = 0.5
        
        nameLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .systemGray
    }
    
    override func draw(_ rect: CGRect) {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    func configureCell(data: Any) {
        let data = data as! Chat
        
        profileImageView.image = UIImage(named: data.user.profileImage)
        nameLabel.text = data.user.rawValue
        messageLabel.text = data.message
        dateLabel.text = data.date.formatDateStringToTimeString()
    }
    
}

