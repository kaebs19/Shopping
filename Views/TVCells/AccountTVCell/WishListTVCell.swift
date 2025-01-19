//
//  WishListTVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 19/01/2025.
//

import UIKit

protocol WishListTVCellProtocol: NSObject {
    func removeForListButtonTapped(cell: WishListTVCell)
}

class WishListTVCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var wishimageView: UIImageView!
    @IBOutlet weak var removeForListButton: UIButton!
    
    // MARK: - Variables - Arry
    weak var delegate: WishListTVCellProtocol?
    var indexPath: IndexPath?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUICell()
        removeForListButton.addTarget(self, action: #selector(removeForListButtonTapped), for: .touchUpInside)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        wishimageView.addCircleImage()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        wishimageView.addCircleImage()
        wishimageView.addBarder(color: .CEEEEEE, width: 1)
    }
    
    @objc func removeForListButtonTapped() {
       // guard let indexPath = indexPath else { return }
        
        delegate?.removeForListButtonTapped(cell: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUICell()
        if selected {
            mainView.addShadow(color: .CEEEEEE , opacity: 0.4, radius: 6, offset: .zero)
            mainView.addBorder(color: .CEEEEEE, width: 1)
            mainView.addAnimateBounceView()
            
        } else {
            mainView.removShadow()
            mainView.addBorder(color: .Clear, width: 0)
        }
        
    }
    
}

extension WishListTVCell {
    
    func setupUICell() {
        noSelectionStyleCell()
        mainView.clipsToBounds = true
        mainView.addRadius(radius: 6)
        mainView.addShadow()
        mainView.addBorder(color: .CEEEEEE, width: 1)
        
    }
    
    func configureCell(cellData: Wishes) {
        nameLabel.customLabel(text: cellData.name, color: .C161616, size: .size_10 , typeFont: .semibold)
        priceLabel.customLabel(text: cellData.price, color: .C161616, size: .size_10)
        descriptionLabel.customLabel(text: cellData.description, color: .C161616, size: .size_10)
        wishimageView.image = UIImage(named: cellData.image)
        removeForListButton.setImage(UIImage(named: cellData.isSelected ? Images.Featured_unselected.names : Images.Favorite.names ), for: .normal)
        
    }
}
