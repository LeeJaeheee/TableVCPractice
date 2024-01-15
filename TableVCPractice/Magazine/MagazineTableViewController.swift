//
//  MagazineTableViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/8/24.
//

import UIKit

class MagazineTableViewController: UITableViewController {
    
    let magazineInfo = MagazineInfo.magazine

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        configureView()
    }
}

extension MagazineTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.identifier, for: indexPath) as! MagazineTableViewCell
        
        cell.selectionStyle = .none
        cell.configureCell(data: magazineInfo[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: MagazineWebViewController.identifier) as! MagazineWebViewController
        vc.urlString = magazineInfo[indexPath.row].link
        navigationController?.pushViewController(vc, animated: true)
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
