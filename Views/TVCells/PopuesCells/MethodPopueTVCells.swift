
protocol MethodPopueTVCellsProtocol: NSObjectProtocol {
    func selectMethodButtonClicked(index: Int)
}



import UIKit

class MethodPopueTVCells: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var methodImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Variables - Arry
    var cellIndex = 0
    weak var delegate: MethodPopueTVCellsProtocol?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        removeCellMarginsAndSelection()

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        methodImageView.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectMethodButtonClicked(_ sender: Any) {
        delegate?.selectMethodButtonClicked(index: cellIndex)
    }
}

extension MethodPopueTVCells {
    
    func configureCell(cellData: Popues) {
        methodLabel.customLabel(text: cellData.title, color: .C161616, size: .size_14)
        methodImageView.image = UIImage(named: cellData.image) ?? UIImage(systemName: "checkmark.circle.fill")
        if let logo = UIImage(named: cellData.logo!) {
            logoImageView.image = logo
        } else {
            logoImageView.image = UIImage(systemName: "checkmark.circle.fill")
        }
        
    }

}
