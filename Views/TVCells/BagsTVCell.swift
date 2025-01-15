//
//  BagsTVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 11/01/2025.
//

import UIKit

class BagsTVCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var isSected: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImageView.addCircleImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setupUI()
        isSected.addRadius(radius: selected ? 6 : 0)
        productImageView.addCircleImage()

               if selected {
                   isSected.addShadow()
                   isSected.addBorder(color: .CEEEEEE, width: 1)
                   
               } else {
                   isSected.addBorder(color: .CFFFFFF, width: 0)
                   isSected.removShadow()
        }

    }
    
}

extension BagsTVCell {
    
    func setupUI(){
        noSelectionStyleCell()
        productImageView.addBarder(width: 0.5)
        productImageView.backgroundColor = UIColor(named: Colors.CECEBE9.rawValue)
        productImageView.addAnimateBounce()
    }
    
    func configureCell(cellData: Bags){
        productImageView.image = UIImage(named: cellData.image) ?? UIImage(systemName: "person")
        priceLabel.text = cellData.price
        titleLabel.text = cellData.name
        descriptionLabel.text = cellData.description
        statusLabel.text = cellData.deliveryDate
    }
}
