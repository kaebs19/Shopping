//
//  CategoriesTVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 07/01/2025.
//

import UIKit

class CategoriesTVCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryView.layer.sublayers?.forEach({ layer in
            if let gradientLayer = layer as? CAGradientLayer {
                gradientLayer.frame = categoryView.bounds
            }
        })
    }

}

extension CategoriesTVCell {
    
    func setupUI() {
        noSelectionStyleCell()
        categoryView.clipsToBounds = true
        categoryView.addRadius(radius: 8)
        categoryView.addBorder(color: .CFFFFFF, width: 1)

        self.contentView.backgroundColor = .clear
       
    }
    
    func getupCellData(cellData: Categories) {
        categoryView.applyBackground(style: cellData.backgroundStyle)
        nameLabel.customLabel(text: cellData.name, color: .CFFFFFF, size: .size_14 , font: .cairoBold , typeFont: .bold)
        categoryImage.image = UIImage(named: cellData.image)
        
    }
}
