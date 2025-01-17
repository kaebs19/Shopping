//
//  FeaturedCVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 15/01/2025.
//

import UIKit

class FeaturedCVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var saleView: UIView!
    @IBOutlet weak var saleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        
    }
    
    override func select(_ sender: Any?) {
        super.select(sender)
    }

}

extension FeaturedCVCell {
    func setupUI(){
        mainView.clipsToBounds = true
        mainView.addRadius(radius: 10)
        saleView.clipsToBounds = true
        saleView.addRadius(radius: 8)
        saleView.backgroundColor = Colors.C00CBFF.uiColor
    }
        
    func configureCell(cellData: FeaturedProducts) {
        // إعداد الخلفية
        if let color = UIColor(hex: cellData.backgroundColor) {
            mainView.applyBackground(style: .solid(color))
        } else {
            mainView.applyBackground(style: .solid(.gray)) // لون افتراضي عند خطأ في الكود اللوني
        }

        // إعداد الصورة
        imageView.image = UIImage(named: cellData.featuredImage) ?? UIImage(named: "placeholder") // صورة افتراضية

        // إعداد النصوص
        nameLabel.customLabel(text: cellData.featuredName, color: .C161616, size: .size_14)
        priceLabel.customLabel(text: cellData.featuredPrice, color: .C161616, size: .size_20, typeFont: .semibold)

        // إعداد نص الخصم
        if cellData.isDiscount, let discountAmount = cellData.discountAmount {
            discountLabel.isHidden = false
            discountLabel.text = "Discount: \(discountAmount)"
            discountLabel.customLabel(text: discountLabel.text ?? "", color: .C161616, size: .size_14)
        } else {
            discountLabel.isHidden = true
            discountLabel.text = ""
        }

        // إعداد نص البيع
        saleLabel.isHidden = !cellData.isSalde
        saleLabel.text = cellData.isSalde ? Libs.Sale.textLib : ""
        saleLabel.customLabel(text: saleLabel.text ?? "", color: .CFFFFFF, size: .size_10, font: .cairoMedium)
        saleView.isHidden = !cellData.isSalde
    }
}
