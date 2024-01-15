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
    
    var index: Int {
        switch self {
        case .모두:
            return 0
        case .국내:
            return 1
        case .해외:
            return 2
        }
    }
}

class CityViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!
    
    let cityInfo = CityInfo.city
    
    var cities: [City] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var filterData: [City] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cities = cityInfo
        filterData = cities

        configureCollectionView()
        configureNavigation()
        configureLayout()
        configureView()
    }
    
    @objc func segmentValueChanged(sender: UISegmentedControl) {
        
        switch CitySegment.allCases.first(where: { $0.index == sender.selectedSegmentIndex })! {
        case .모두:
            cities = cityInfo
        case .국내:
            cities = cityInfo.filter { $0.domestic_travel }
        case .해외:
            cities = cityInfo.filter { !$0.domestic_travel }
        }
        filterCities()

        // collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
    }

}

extension CityViewController {
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: CityCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
    }
    
}

extension CityViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterCities()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filterData = cities
        searchBar.text = ""
        self.view.endEditing(true)
    }
    
    func filterCities() {
        var filterData: [City] = []
        guard let text = searchBar.text else { return }
        
        if text == "" {
            self.filterData = cities
        } else {
            for item in cities {
                if item.city_name.contains(text) || item.city_english_name.contains(text) || item.city_explain.contains(text) {
                    filterData.append(item)
                }
            }
            self.filterData = filterData
        }
    }
    
}

extension CityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        
        cell.configureCell(data: filterData[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Travel", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: TravelViewController.identifier) as! TravelViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CityViewController: MyCollectionVCProtocol {
    
    func configureLayout() {
        let spacing: CGFloat = 24
        let cellWidth = (UIScreen.main.bounds.width - (spacing * 3)) / 2
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.45)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
    }
    
    func configureNavigation() {
        navigationItem.title = "인기 도시"
        navigationController?.navigationBar.tintColor = .darkGray
    }
    
    func configureView() {
        segmentedControl.removeAllSegments()
        CitySegment.allCases.forEach { citySeg in
            segmentedControl.insertSegment(withTitle: citySeg.rawValue, at: citySeg.index, animated: true)
        }
        segmentedControl.selectedSegmentIndex = CitySegment.모두.index
        segmentedControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
        
        searchBar.showsCancelButton = true
    }
    
}

