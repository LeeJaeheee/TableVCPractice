//
//  Case2TableViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/6/24.
//

import UIKit

class Case2TableViewController: UITableViewController {
    
    let list: [(title: String, content: [String])] = [("전체 설정", ["공지사항", "실험실", "버전 정보"]),
                                                      ("개인 설정", ["개인/보안", "알림", "채팅", "멀티프로필"]),
                                                      ("기타", ["고객센터/도움말"])]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].content.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "case2Cell")!
        
        cell.textLabel?.text = list[indexPath.section].content[indexPath.row]
        
        return cell
    }

}
