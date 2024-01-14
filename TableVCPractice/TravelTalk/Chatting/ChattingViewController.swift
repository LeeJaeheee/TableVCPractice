//
//  ChattingViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/14/24.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var inputBackgroundView: UIView!
    @IBOutlet var inputTextView: UITextView!
    @IBOutlet var inputButton: UIButton!
    
    var chatroomName: String = ""
    var chatList: [Chat] = []
    
    var dateDict: [String: [Chat]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        configureView()
        configureTableView()
    }
    
}

extension ChattingViewController: UIConfiguration {
    
    func configureNavigation() {
        navigationItem.title = chatroomName
    }
    
    func configureView() {
        inputBackgroundView.backgroundColor = .systemGray6
        inputBackgroundView.layer.cornerRadius = 8
        
        inputTextView.backgroundColor = .clear
        inputTextView.delegate = self
        textViewDidEndEditing(inputTextView)
        
        inputButton.setImage(UIImage(systemName: "arrow.up.heart.fill"), for: .normal)

    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: ChattingTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: ChattingTableViewCell.identifier)
        
        let xib2 = UINib(nibName: MyChattingTableViewCell.identifier, bundle: nil)
        tableView.register(xib2, forCellReuseIdentifier: MyChattingTableViewCell.identifier)
        
        tableView.register(UINib(nibName: ChattingHeaderView.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: ChattingHeaderView.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .none
        tableView.scrollToRow(at: IndexPath(row: chatList.count-1, section: 0), at: .bottom, animated: false)
    }
    
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ChattingHeaderView.identifier) as! ChattingHeaderView
        
        view.titleLabel.text = "날짜"
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if chatList[indexPath.row].user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: MyChattingTableViewCell.identifier, for: indexPath) as! MyChattingTableViewCell
            cell.configureCell(data: chatList[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChattingTableViewCell.identifier, for: indexPath) as! ChattingTableViewCell
            cell.configureCell(data: chatList[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    
}

extension ChattingViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "메세지를 입력하세요"
            textView.textColor = .lightGray
        }
    }
    
}
