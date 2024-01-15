//
//  City.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/15/24.
//

import Foundation

struct City {
    let city_name: String
    let city_english_name: String
    let city_explain: String
    let city_image: String
    let domestic_travel: Bool
    
    var name: String {
        "\(city_name) | \(city_english_name)"
    }
}
