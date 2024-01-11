//
//  ADViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/11/24.
//

import UIKit

class ADViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "광고 화면"
        navigationController?.navigationBar.tintColor = .darkGray
        
        let image = UIImage(systemName: "xmark")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(dismissButtonTapped))
        navigationItem.leftBarButtonItem = button
    }
    
    @objc func dismissButtonTapped() {
        dismiss(animated: true)
    }

}
