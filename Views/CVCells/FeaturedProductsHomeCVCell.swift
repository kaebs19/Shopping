//
//  FeaturedProductsHomeCVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 03/01/2025.
//

import UIKit

    class FeaturedProductsHomeCVCell: UICollectionViewCell {

        // MARK: - Outlets
        @IBOutlet weak var bauckageImageView: UIImageView!
        @IBOutlet weak var productImageView: UIImageView!
        @IBOutlet weak var productNameLabel: UILabel!
        @IBOutlet weak var productPriceLabel: UILabel!
        @IBOutlet weak var isDiscountedLabel: UILabel!
        @IBOutlet weak var isSelaView: UIView!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            bauckageImageView.addRadius(radius: 8)
        }

    }

    extension FeaturedProductsHomeCVCell {
        func initData(cellData: FeaturedProducts) {
            bauckageImageView.image = UIImage(named: cellData.backgroundColor)
            productImageView.image = UIImage(named: cellData.featuredImage)
            productNameLabel.text = cellData.featuredName
            productPriceLabel.text = cellData.featuredPrice
            isSelaView.isHidden = !cellData.isSalde
            isDiscountedLabel.text = cellData.isDiscount ? "10%" : ""
        }
    }
