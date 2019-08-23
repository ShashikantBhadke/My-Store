//
//  DashboardCollectionView+CollectionView.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

// MARK:- Extension for UICollectionViewDataSource
extension DashboardCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrObject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCell.self), for: indexPath) as? ProductCell else { return UICollectionViewCell() }
        if arrObject.count > indexPath.item {
            cell.intIndex = indexPath.item
            cell.delegate = delegate as? ProductCellProtocol
            cell.product = arrObject[indexPath.item]
        }
        return cell
    }
} //extension

// MARK:- Extension for UICollectionViewDelegate
extension DashboardCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if arrObject.count > indexPath.item {
            _delegate?.didSelectItem(intIndex: indexPath.item, obj: arrObject[indexPath.item])
        }
    }
} //extension

// MARK:- Extension for UICollectionViewDelegateFlowLayout
extension DashboardCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 335)
    }
} //extension
