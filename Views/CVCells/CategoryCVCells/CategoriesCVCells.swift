//
//  CategoriesCVCells.swift
//  Shopping
//
//  Created by Mohammed Saleh on 14/01/2025.
//

import UIKit

class CategoriesCVCells: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var categoriesImage: UIImageView!

    
    // MARK: - UI Setup
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func select(_ sender: Any?) {
        super.select(sender)
        mainView.addBorder(color: .C161616, width: 0.5)
    }

}

extension CategoriesCVCells {
    
    func setupUI() {
        mainView.addRadius(radius: 4)
    }
    
    func configureCell(cellData:Categories){
        categoriesImage.image = UIImage(named: cellData.image) ?? UIImage(systemName: "person.fill")
    }
}
