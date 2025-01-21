//
//  LanguageTVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 20/01/2025.
//

import UIKit

class LanguageTVCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            
        }
    }
    
}

extension LanguageTVCell {
    
    func setupUI() {
        noSelectionStyleCell()
    }
    
    func configureCell(cellData: Languages) {
        languageLabel.customLabel(text: cellData.languageName.description, color: .C161616, size: .size_14)
        languageImage.image = cellData.isSelected ? UIImage(named: Images.Select_Object.names) : UIImage(named:Images.Unselected_Object.names )
    }
}
