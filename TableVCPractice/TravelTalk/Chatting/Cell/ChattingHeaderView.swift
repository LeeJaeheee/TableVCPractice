//
//  ChattingHeaderView.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/14/24.
//

import UIKit

class ChattingHeaderView: UITableViewHeaderFooterView {

    static let identifier = "ChattingHeaderView"
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        headerView.backgroundColor = .systemGray4
        
        titleLabel.font = .boldSystemFont(ofSize: 12)
        titleLabel.textColor = .white
    }
    
    override func draw(_ rect: CGRect) {
        headerView.layer.cornerRadius = headerView.frame.height / 2
    }
}
