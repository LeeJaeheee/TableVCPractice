//
//  MagazineTableViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/8/24.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    
    let magazineInfo = MagazineInfo()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "SeSAC TRAVEL"
        
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as! MagazineTableViewCell
        
        cell.thumbnailImageView.kf.setImage(with: URL(string: magazineInfo.magazine[indexPath.row].photo_image))
        cell.thumbnailImageView.contentMode = .scaleToFill
        cell.thumbnailImageView.layer.cornerRadius = 12
        
        cell.titleLabel.text = magazineInfo.magazine[indexPath.row].title
        cell.titleLabel.numberOfLines = 2
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        
        cell.subTitleLabel.text = magazineInfo.magazine[indexPath.row].subtitle
        cell.subTitleLabel.textColor = .systemGray
        cell.subTitleLabel.font = .systemFont(ofSize: 15)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let date = dateFormatter.date(from: magazineInfo.magazine[indexPath.row].date)!
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        
        cell.dateLabel.text = dateFormatter.string(from: date)
        cell.dateLabel.textColor = .systemGray
        cell.dateLabel.font = .systemFont(ofSize: 14)
        
        return cell
    }

}
