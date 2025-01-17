//
//  SizesPupuesTVCells.swift
//  Shopping
//
//  Created by Mohammed Saleh on 17/01/2025.
//

import UIKit

class SizesPupuesTVCells: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var selectImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        updateSelectionState(isSelected: selected)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        restCell()
    }
    
}

extension SizesPupuesTVCells {
    
    func setupUI() {
        noSelectionStyleCell()
    }

    func configureCell(cellData: Size) {
        sizeLabel.customLabel(text: cellData.name, color: .C161616, size: .size_14)
        selectImage.image = cellData.image
        updateSelectionState(isSelected:  cellData.isSelected)
    }
    
    private func restCell() {
        sizeLabel.text = nil
        imageView?.image = nil
    }
    
    private func updateSelectionState(isSelected: Bool) {
        DispatchQueue.main.async {
            self.selectImage.isHidden = !isSelected

        }
    }

}
