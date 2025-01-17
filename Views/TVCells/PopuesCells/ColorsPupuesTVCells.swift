//
//  ColorsPupuesTVCells.swift
//  Shopping
//
//  Created by Mohammed Saleh on 17/01/2025.
//

import UIKit

class ColorsPupuesTVCells: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var selectImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        updateSelectionState(isSelected: isSelected)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCell()
    }
    
}

extension ColorsPupuesTVCells {
    
    func setupUI() {
        colorView.layer.masksToBounds = true
        colorView.addRadius(radius: 6)
        colorView.addBorder(color: .C161616, width: 1)
        noSelectionStyleCell()
    }
    
    func configureCell(cellData: Color) {
        colorView.backgroundColor = cellData.colorValue
        colorView.addBorder(color: .C161616, width: 1)
        colorLabel.customLabel(text: cellData.name, color: .C161616, size: .size_14)
        selectImage.image = cellData.image
    }
    
    private func resetCell() {
        colorView.backgroundColor = .clear
        colorLabel.text = nil
        selectImage.image = nil
    }
    
    func updateSelectionState(isSelected: Bool) {
        if isSelected {
            colorView.addBorder(color: Colors.CEEEEEE, width: 2)
        } else {
            colorView.addBorder(color: .Clear, width: 0)
        }
    }
}
