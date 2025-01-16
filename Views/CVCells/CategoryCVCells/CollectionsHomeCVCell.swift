//
//  CollectionsHomeCVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 03/01/2025.
//

import UIKit

class CollectionsHomeCVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var collectionTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.addRadius(radius: 6)
        collectionView.clipsToBounds = true
    }

}

extension CollectionsHomeCVCell {
    
    func initData(cellData: Collections) {
        collectionImage.image = UIImage(named: cellData.imgage)
        collectionTitle.customLabel(text: cellData.name, color: .CFFFFFF, size: .size_20 , font: .cairoBold , typeFont: .bold)
    }
}

