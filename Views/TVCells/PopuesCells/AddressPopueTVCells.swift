import UIKit

protocol AAddressPopueTVCellsProtocol: NSObjectProtocol {
    func selectAddressButtonClicked(index: Int)
}


class AddressPopueTVCells: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressImageView: UIImageView!
    
    // MARK: - Variables - Arry
    var cellIndex = 0
    weak var delegate: AAddressPopueTVCellsProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        removeCellMarginsAndSelection()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        addressImageView.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    @IBAction func selectAddressButtonClicked(_ sender: Any) {
        delegate?.selectAddressButtonClicked(index: cellIndex)
    }
    
}

extension AddressPopueTVCells {
    
    func configurCell(cellData: Popues) {
        addressLabel.customLabel(text: cellData.title, color: .C161616, size: .size_14)
        if let image = UIImage(named: cellData.image) {
            addressImageView.image = image
        } else {
            addressImageView.image = UIImage(systemName: "checkmark.circle.fill")
        }
        
    }
}
