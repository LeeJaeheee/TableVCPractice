//
//  MyChattingTableViewCell.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/14/24.
//

import UIKit

class MyChattingTableViewCell: UITableViewCell, MyCellProtocol {

    @IBOutlet var messageView: UIView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.numberOfLines = 0
        
        messageView.backgroundColor = .systemGray6
        messageView.layer.cornerRadius = 8
        messageView.layer.borderWidth = 1
        messageView.layer.borderColor = UIColor.systemGray.cgColor
        
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .systemGray
    }

    func configureCell(data: Any) {
        let data = data as! Chat
        
        messageLabel.text = data.message
        dateLabel.text = data.date.formatDateStringToTimeString()
    }
    
}
