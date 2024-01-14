//
//  TravelTalkTableViewCell.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/13/24.
//

import UIKit

let dateFormatter = DateFormatter()

class TravelTalkTableViewCell: UITableViewCell, MyCellProtocol {
    static let identifier: String = "TravelTalkTableViewCell"
    
    @IBOutlet var profileView: UIView!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        userLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 2
        
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textAlignment = .right
        dateLabel.textColor = .gray
    }

    func configureCell(data: Any) {
        let data = data as! ChatRoom
        let lastChat = data.chatList.last
        
        setupCell(list: data.chatroomImage)
        userLabel.text = data.chatroomName
        messageLabel.text = lastChat?.message
        dateLabel.text = formatDate(date: lastChat!.date)
    }
    
    func formatDate(date: String) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yy.MM.dd"
        return dateFormatter.string(from: date!)
    }
    
    func setupCell(list: [String]) {
        let nib = UINib(nibName: "ProfileView", bundle: nil)
        let owner = ProfileView()
        let views = nib.instantiate(withOwner: owner, options: nil)
        
        let tag = min(list.count, 4)
        if let rootView = views.first(where: { ($0 as? UIView)?.tag == tag }) as? UIView {
            profileView.addSubview(rootView)
            
            for (i, view) in rootView.subviews.enumerated() {
                let imageView = view as! UIImageView
                imageView.image = UIImage(named: list[i])
                imageView.layer.cornerRadius = imageView.frame.width / 2
                imageView.layer.borderWidth = 0.5
                imageView.layer.borderColor = UIColor.systemGray5.cgColor
            }
        }
    }
}
