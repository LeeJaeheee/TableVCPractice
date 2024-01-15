//
//  CityCollectionViewController.swift
//  TableVCPractice
//
//  Created by 이재희 on 1/9/24.
//

import UIKit

class CityCollectionViewController: UICollectionViewController {
    
    let cityInfo = CityInfo.city

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureNavigation()
        configureLayout()
    }

}

extension CityCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityInfo.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        
        cell.configureCell(data: cityInfo[indexPath.item])
        
        return cell
    }
    
}

extension CityCollectionViewController: MyCollectionVCProtocol {
    
    func configureLayout() {
        let spacing: CGFloat = 24
        let cellWidth = (UIScreen.main.bounds.width - (spacing * 3)) / 2
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.45)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
    }
    
    func configureNavigation() {
        navigationItem.title = "인기 도시"
    }
    
    func configureView() {
        collectionView.register(UINib(nibName: CityCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
    }
    
    
}
