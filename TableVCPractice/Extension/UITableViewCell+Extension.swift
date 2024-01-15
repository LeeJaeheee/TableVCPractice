//
//  UITableViewCell+Extension.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/15/24.
//

import UIKit

extension UITableViewCell: ReusableProtocol {
    static var identifier: String {
        String(describing: self)
    }
}
