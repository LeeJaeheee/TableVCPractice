//
//  MagazineWebViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/15/24.
//

import UIKit
import WebKit

class MagazineWebViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

}
