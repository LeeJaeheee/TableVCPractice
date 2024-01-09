//
//  CityViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/9/24.
//

import UIKit

enum CitySegment: String, CaseIterable {
    case 모두
    case 국내
    case 해외
}

class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!
    
    let cityInfo = CityInfo()
    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "인기 도시"
        
        cities = cityInfo.city
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "CityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        let spacing: CGFloat = 24
        let cellWidth = (UIScreen.main.bounds.width - (spacing * 3)) / 2
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.45)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
        
        setupSegmentedControl()
    }
    
    func setupSegmentedControl() {
        segmentedControl.removeAllSegments()
        CitySegment.allCases.enumerated().forEach { (i, citySeg) in
            segmentedControl.insertSegment(withTitle: citySeg.rawValue, at: i, animated: true)
        }
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
    }
    
    @objc func segmentValueChanged(sender: UISegmentedControl) {
        let citySeg: CitySegment = CitySegment(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex)!)!
        switch citySeg {
        case .모두:
            cities = cityInfo.city
        case .국내:
            cities = cityInfo.city.filter { $0.domestic_travel }
        case .해외:
            cities = cityInfo.city.filter { !$0.domestic_travel }
        }
        collectionView.reloadData()
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        cell.configureCell(city: cities[indexPath.item])
        
        return cell
    }

}
