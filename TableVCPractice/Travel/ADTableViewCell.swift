//
//  ADTableViewCell.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell, MyCellProtocol {
    
    static let identifier: String = "ADTableViewCell"
    
    @IBOutlet var adView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adView.backgroundColor = UIColor(red: CGFloat.random(in: 0.5...1), green: CGFloat.random(in: 0.5...1), blue: CGFloat.random(in: 0.5...1), alpha: 1)
        adView.layer.cornerRadius = 8
        adView.clipsToBounds = true
        
        titleLabel.numberOfLines = 2
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textAlignment = .center
        
        adLabel.text = "AD"
        adLabel.font = .systemFont(ofSize: 12)
        adLabel.textAlignment = .center
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 5
        adLabel.clipsToBounds = true
    }

    func configureCell(data: Any) {
        titleLabel.text = data as? String
    }
    
}
