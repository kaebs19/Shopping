//
//  ProductDatelsCVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 14/01/2025.
//

import UIKit

class ProductDatelsCVCell: UICollectionViewCell {
    
    // MARK: - Outlets
//    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var prductNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDiscountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        mainView.addRadius(radius: 6)
    }

}

extension ProductDatelsCVCell {
    func configureCell(cellData: Categories) {
//        mainView.applyBackground(style: .solid(UIColor(hex: ColorsBackground.Background.rawValue) ?? UIColor.white))
        productImageView.image = UIImage(named: cellData.image) ?? UIImage(systemName: "person.fill")
        prductNameLabel.customLabel(text: cellData.name, color: .C161616, size: .size_14 , direction: .Left)
        productPriceLabel.customLabel(text: cellData.price ?? "", color: .C161616, size: .size_20 , typeFont: .semibold , direction: .Left)
        productDiscountLabel.customLabel(text: cellData.discount ?? "", color: .CCCCED0, size: .size_16 , typeFont: .semibold , direction: .Center)

    }
}
