//
//  TravelTalkViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/13/24.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var chatList: [ChatRoom] = []
    var filterList: [ChatRoom] = []
    
    var isFiltering: Bool {
        let searchController = navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatList = mockChatList.sorted(by: { $0.chatList.last!.date > $1.chatList.last!.date })

        configureNavigation()
        configureView()
    }
    
}

extension TravelTalkViewController: UIConfiguration {
    
    func configureNavigation() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "친구 이름을 검색해보세요."
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.backButtonTitle = ""
    }
    
    func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
    }
    
}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filterList.count : chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier, for: indexPath) as! TravelTalkTableViewCell
        
        cell.configureCell(data: isFiltering ? filterList[indexPath.row] : chatList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        let sb = UIStoryboard(name: "Chatting", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "ChattingViewController") as! ChattingViewController
        vc.chatroomName = isFiltering ? filterList[indexPath.row].chatroomName : chatList[indexPath.row].chatroomName
        vc.chatList = isFiltering ? filterList[indexPath.row].chatList : chatList[indexPath.row].chatList
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension TravelTalkViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text?.lowercased() else { return }
        filterList = chatList.filter { $0.chatroomName.localizedCaseInsensitiveContains(text) }
        
        tableView.reloadData()
        
    }
    
    
}
