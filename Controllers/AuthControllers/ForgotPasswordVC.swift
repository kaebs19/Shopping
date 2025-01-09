//
//  ForgotPasswordVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 02/01/2025.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var forgetPasswordLable: UILabel!
    @IBOutlet weak var detailsLable: UILabel!
    @IBOutlet weak var bagWithEmilView: UIView!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forGetPasswordBut: UIButton!
    @IBOutlet weak var dontHaveAccountLable: UILabel!
    @IBOutlet weak var signUpBut: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func backButClicked(_ sender: UIButton) {
        gotToPreviousVC()
    }
    
    @IBAction func forgotPasswordButClicked(_ sender: UIButton) {
        print("Done Forgot Password")
    }
    
}

extension ForgotPasswordVC {
    func setupUI() {
        isHideNavigationBar()
        hideKeyboard()
        bigView.addMaskCorners(radius: 20, corners: [.topLeftCorner , .topRightCorner])
        forgetPasswordLable.customLabel(text: Libs.forgotPassword.textLib, color: .C000000, size: .size_20 , font: .cairoMedium , typeFont: .semibold)
        detailsLable.customLabel(text: Libs.detilsPassword.textLib, color: .C000000, size: .size_14 ,font: .cairoRegular, line: 3)
        emailLable.customLabel(text: Libs.email.textLib, color: .C110F24, size: .size_12 , font: .cairoRegular)
        emailTextField.customTextField(placeholder: .email, ofSize: .size_14)
        bagWithEmilView.addRadius(radius: 24)
        bagWithEmilView.addBorder(color: .CE6E6E6, width: 1)
        
        [forGetPasswordBut].forEach { button in
            button?.customButton(text: .forgotPassword, textColor: .CFFFFFF, backgroundColor: .C00CBFF, ofSize: .size_14, font: .cairoBold, styleFont: .bold)
            button?.addRadius(radius: 27)
        }
        
        dontHaveAccountLable.customLabel(text: Libs.dontHaveAnAccount.textLib, color: .C000000, size: .size_12 , font: .cairoLight)
        signUpBut.customButton(text: .signUp, textColor: .C000000, ofSize: .size_12, font: .cairoBold, styleFont: .semibold)

    }
}
