//
//  Magazine.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/15/24.
//

import Foundation

struct Magazine {
    let title: String
    let subtitle: String
    let photo_image: String
    let date: String
    let link: String
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        let date = dateFormatter.date(from: date)!
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        return dateFormatter.string(from: date)
    }
}
