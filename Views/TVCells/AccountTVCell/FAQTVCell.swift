//
//  FAQTVCell.swift
//  Shopping
//
//  Created by Mohammed Saleh on 21/01/2025.
//

import UIKit

class FAQTVCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var biackQusetionView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerNumberLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FAQTVCell {
    
    func setupUI() {
        noSelectionStyleCell()
        mainView.addRadius(radius: 24)
        biackQusetionView.addRadius(radius: 24)
        biackQusetionView.addBorder(color: .CE6E6E6, width: 1)
    }
    
    func configuraCell (with faq: FAQ) {

        questionLabel.customLabel(text: faq.question, color: .C161616, size: .size_14)
        answerLabel.customLabel(text: faq.answer, color: .C161616, size: .size_12, line: 0)
        answerLabel.text = faq.isExpanded ? faq.answer : ""
        answerLabel.isHidden = !faq.isExpanded
        answerNumberLabel.customLabel(text: "\(Libs.Answer.textLib): \(faq.answerNumber)", color: .C161616, size: .size_10)
        
        arrowImageView.image = faq.isExpanded ?
        UIImage(named: Images.Chevron_down.names) :
        UIImage(named: Images.Chevron_up.names)
        
        mainView.isHidden = !faq.isExpanded

    }
}
