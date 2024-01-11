//
//  TravelViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/11/24.
//

import UIKit

class TravelViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let travelList = TravelInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "도시 상세 정보"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let travelXib = UINib(nibName: TravelTableViewCell.identifier, bundle: nil)
        tableView.register(travelXib, forCellReuseIdentifier: TravelTableViewCell.identifier)
        
        let adXib = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        tableView.register(adXib, forCellReuseIdentifier: ADTableViewCell.identifier)
    }

}

extension TravelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if travelList.travel[indexPath.row].ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            
            cell.configureCell(data: travelList.travel[indexPath.row].title)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
            
            cell.configureCell(data: travelList.travel[indexPath.row])
            
            return cell
        }
    }
    
}
