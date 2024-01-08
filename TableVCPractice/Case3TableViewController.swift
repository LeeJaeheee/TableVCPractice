//
//  Case3TableViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/6/24.
//

import UIKit

struct Shopping {
    var isChecked = false
    var title: String
    var isBookmarked = false
}

// TODO: 밀어서 수정/삭제하기, UserDefaults, Extension

class Case3TableViewController: UITableViewController {
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var list: [Shopping] = [
        Shopping(isChecked: true, title: "그립톡 구매하기", isBookmarked: true),
        Shopping(title: "사이다 구매"),
        Shopping(title: "아이패드 케이스 최저가 알아보기", isBookmarked: true),
        Shopping(isChecked: true, title: "양말", isBookmarked: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.tintColor = .black
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = 48
        
        setupHeader()
    }
    
    @IBAction func textFieldReturn(_ sender: UITextField) {

    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        view.endEditing(true)
        
        if let text = headerTextField.text, !text.isEmpty {
            list.append(Shopping(title: text))
            headerTextField.text = nil
            tableView.reloadData()
        } else {
            let alertVC = UIAlertController(title: "저장 실패", message: "입력된 텍스트가 없습니다.", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "확인", style: .default))
            present(alertVC, animated: true)
        }
    }
    
    func setupHeader() {
        headerView.backgroundColor = .systemGray6
        setCornerRadius(headerView, cornerRadius: 8)
        
        headerTextField.placeholder = "무엇을 구매하실 건가요?"
        
        addButton.setTitle("추가", for: .normal)
        setCornerRadius(addButton, cornerRadius: 5)
    }
    
    func setCornerRadius(_ view: UIView, cornerRadius: CGFloat) {
        view.layer.cornerRadius = cornerRadius
    }
    
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Case3TableViewCell", for: indexPath) as! Case3TableViewCell
        
        cell.cellView.backgroundColor = .systemGray6
        setCornerRadius(cell.cellView, cornerRadius: 8)
        
        cell.checkBoxButton.tag = indexPath.row
        cell.checkBoxButton.setImage(
            UIImage(systemName: list[indexPath.row].isChecked ? "checkmark.square.fill" : "checkmark.square"),
            for: .normal)
        cell.checkBoxButton.addTarget(self, action: #selector(checkBoxButtonTapped), for: .touchUpInside)
        
        cell.titleLabel.text = list[indexPath.row].title
        cell.titleLabel.font = .systemFont(ofSize: 14)
        
        cell.bookmarkButton.tag = indexPath.row
        cell.bookmarkButton.setImage(
            UIImage(systemName: list[indexPath.row].isBookmarked ? "star.fill" : "star"),
            for: .normal)
        cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    @objc func checkBoxButtonTapped(sender: UIButton, name: String) {
        list[sender.tag].isChecked.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc func bookmarkButtonTapped(sender: UIButton) {
        list[sender.tag].isBookmarked.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
