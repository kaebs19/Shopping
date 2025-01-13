//
//  BagsPouesView.swift
//  Shopping
//
//  Created by Mohammed Saleh on 13/01/2025.
//

import UIKit

protocol AddressCellTVProtocol: NSObjectProtocol {
    func selectAddressButtonClicked()
}
protocol MethodCellTVProtocol: NSObjectProtocol {
    func selectMethodButtonClicked()

}


class BagsPouesView: UIView {
    
    // MARK: - Outlets
    var addressTV =  UITableView()
    var methodTV = UITableView()
    var titleLable = UILabel()
    var selectImageView = UIImageView()
    
    var isSelected = UIButton()
    
    
    // MARK: - Variables - Arry

    var AddressList: [Popues] = [
        Popues(title: "Home: 4043 Willis Avenue, TRAPPER CREEK, 99638", image: Images.Select_Object.names, isDefault: true),
        Popues(title: "Work: 1923 Meadowbrook Mall Road, Gardena, CA, 90248", image: Images.Select_Object.names, isDefault: false),
        Popues(title: "Home: 4043 Willis Avenue, TRAPPER CREEK, 3453", image: Images.Select_Object.names, isDefault: false)
    ]
    
    var MethodList: [Popues] = [
        Popues(title: "China Post Air Mail", image: Images.china_post.names, isDefault: true),
        Popues(title: "DHL", image: Images.Dhl.names, isDefault: false),
        Popues(title: "Fedex", image: Images.Fedex.names, isDefault: false)
    ]
    
    var cellIndex = 0
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    
    
}

extension BagsPouesView {
    
    func setup() {
        addressTV.tag = 0
        methodTV.tag = 1
        
    }
}
