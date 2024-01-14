//
//  String+Extension.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/14/24.
//

import Foundation

extension String {
    func formatDateStringToTimeString() -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let date = dateFormatter.date(from: self)
        
        dateFormatter.dateFormat = "HH:mm a"
        return dateFormatter.string(from: date!)
    }
}
