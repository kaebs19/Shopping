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
    @IBOutlet weak var saleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()

    }
    
}

extension FeaturedProductsHomeCVCell {
    
    func setupUI(){
        bauckageImageView.addRadius(radius: 8)
    
        
        [saleButton].forEach { sale in
            sale.customButton(text: .sale, textColor: .CFFFFFF, ofSize: .size_10, font: .cairoMedium, styleFont: .semibold)
            sale.applyBackground(style: .gradient([
                UIColor(hex: ColorsBackground.SunsetOrange.rawValue) ?? .clear,
                UIColor(hex: ColorsBackground.DeepPurple.rawValue) ?? .clear
            ]))
            sale.AddmakeCircularBut(factor: 0.4)
        }
        
    }
    
    func initData(cellData: FeaturedProducts) {
        bauckageImageView.image = UIImage(named: cellData.backgroundColor)
        productImageView.image = UIImage(named: cellData.featuredImage)
        productNameLabel.text = cellData.featuredName
        productPriceLabel.text = cellData.featuredPrice
        saleButton.isHidden = !cellData.isSalde
        isDiscountedLabel.customLabel(text: cellData.isDiscount ? "10%" : "", color: .CCCCED0, size: .size_14 , font: .cairoRegular , typeFont: .regular)
        
    }
}
