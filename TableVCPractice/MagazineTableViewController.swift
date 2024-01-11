//
//  MagazineTableViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/8/24.
//

import UIKit

class MagazineTableViewController: UITableViewController {
    
    let magazineInfo = MagazineInfo()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        configureView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.identifier, for: indexPath) as! MagazineTableViewCell
        
        cell.configureCell(data: magazineInfo.magazine[indexPath.row])
        
        return cell
    }

}

extension MagazineTableViewController: UIConfiguration {
    func configureNavigation() {
        navigationItem.title = "SeSAC TRAVEL"
    }
    
    func configureView() {
        tableView.separatorStyle = .none
    }
    
}
