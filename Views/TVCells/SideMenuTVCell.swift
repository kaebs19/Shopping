//
//  SideMenuTVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 06/01/2025.
//

import UIKit

class SideMenuTVCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        noSelectionStyleCell()
    }
    
}

extension SideMenuTVCell {
    
    
    func setupData(cellData: Menu) {
        nameLabel.customLabel(text: cellData.name, color: .C161616, size: .size_14 ,font: .cairoRegular , typeFont: .regular)
        iconImage.image = UIImage(named: cellData.image)
    }
}
