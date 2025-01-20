//
//  MyAddressTVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 20/01/2025.
//

import UIKit

protocol MyAddressTVCellProtocol: AnyObject {
    func editingAddressButton(cell: MyAddressTVCell)
}


class MyAddressTVCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    // MARK: - Variables - Arry
    weak var delegate: MyAddressTVCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            mainView.addShadow()
        } else {
            mainView.removShadow()
        }
    }
    
    
    
}

extension MyAddressTVCell {
    
    func setupUI() {
        noSelectionStyleCell()
        editButton.addTarget(self, action: #selector(editingAddressButton), for: .touchUpInside)
    }
    
    func configurteCell(cellData: Address) {
        var addressText = "\(cellData.Name), \(cellData.Street), \(cellData.City)"
        if let  district = cellData.District {
            addressText += ", \(district)"
        }
        if let zip = cellData.Zip {
            addressText += ", \(zip)"
        }
        addressLabel.customLabel(text: addressText , color: .C161616, size: .size_14 , line: 2)
    }
    
    @objc func editingAddressButton() {
        delegate?.editingAddressButton(cell: self)
    }
}
