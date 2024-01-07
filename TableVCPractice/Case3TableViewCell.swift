//
//  Case3TableViewCell.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/6/24.
//

import UIKit

class Case3TableViewCell: UITableViewCell {
    
    var checkBoxAction: (() -> Void)?
    var bookmarkAction: (() -> Void)?
    
    @IBOutlet var cellView: UIView!
    @IBOutlet var checkBoxButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bookmarkButton: UIButton!
    
    @IBAction func checkBoxButtonTapped(_ sender: UIButton) {
        checkBoxAction?()
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        bookmarkAction?()
    }

}
