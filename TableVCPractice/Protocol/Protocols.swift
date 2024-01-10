//
//  Protocols.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/10/24.
//

import UIKit

protocol MyCellProtocol {
    static var identifier: String { get }
    
    func configureCell(data: Any)
}

protocol UIConfiguration {
    func configureNavigation()
    func configureView()
}

protocol MyCollectionVCProtocol: UIConfiguration {
    func configureLayout()
}
