//
//  SigninVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 02/01/2025.
//

import UIKit

class SigninVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var signupLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordLable: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var againPasswordLable: UILabel!
    @IBOutlet weak var againPasswordTextField: UITextField!
    @IBOutlet  var showPasswordImage: [UIImageView]!
    @IBOutlet var showPasswordBut: [UIButton]!
    @IBOutlet  var bacEmailAndPasswordView: [UIView]!
    @IBOutlet weak var signUpBut: UIButton!
    @IBOutlet weak var lognupWithSocialLable: UILabel!
    @IBOutlet weak var haveAccountLable: UILabel!
    @IBOutlet  var bacSociaView: [UIView]!
    @IBOutlet weak var signInBut: UIButton!

    // MARK: - Variables
    var isShowPassword: Bool = false{
        didSet{
            passwordTextField.togglePassword()
            againPasswordTextField.togglePassword()
            let imageName = isShowPassword ? Imags.Eye_on.names : Imags.Eye_of.names
            for imageViews in showPasswordImage {
                UIView.transition(with: imageViews, duration: 0.4 , options: .transitionCrossDissolve, animations: {
                    imageViews.image = UIImage(named: imageName)
                } , completion: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func showPasswordClickBut(_ sender: UIButton) {
        
//        switch sender.tag {
//            case 0:
//                print("Button 1 clicked")
//            default:
//                print("Button 2 clicked")
//        }
        isShowPassword.toggle()
    }
    
    @IBAction func blackClickBut(_ sender: UIButton) {
        gotToPreviousVC()
    }
}

extension SigninVC {
    
    func setup() {
        isHideNavigationBar()
        bigView.addMaskCorners(radius: 20, corners: [.topLeftCorner , .topRightCorner])
        signupLable.customLabel(text: Libs.Signup.textLib, color: .C110F24, size: .size_20 , font: .cairoBold , typeFont: .semibold)
        emailLable.customLabel(text: Libs.email.textLib, color: .C110F24, size: .size_12 , font: .cairoRegular)
        emailTextField.customTextField(placeholder: .email, ofSize: .size_14)
        passwordLable.customLabel(text: Libs.password.textLib, color: .C161616, size: .size_12 , font: .cairoRegular )
        passwordTextField.customTextField(placeholder: .password, ofSize: .size_14 ,isPassword: true)
        againPasswordLable.customLabel(text: Libs.password.textLib, color: .C161616, size: .size_12 , font: .cairoRegular )
        againPasswordTextField.customTextField(placeholder: .againPassword, ofSize: .size_14 ,isPassword: true)
        phoneLable.customLabel(text: Libs.PhoneNumber.textLib, color: .C161616, size: .size_12 , font: .cairoRegular )
        phoneTextField.customTextField(placeholder: .phoneNumber, ofSize: .size_14 )
        
        bacEmailAndPasswordView.forEach { view in
            view.addRadius(radius: 24)
            view.addBoder(color: .CE6E6E6, width: 1)
        }

        [signUpBut].forEach { button in
            button?.customButton(text: .signUp, textColor: .CFFFFFF, backgroundColor: .C00CBFF, ofSize: .size_14, font: .cairoBold, styleFont: .bold)
            button?.addRadius(radius: 27)
        }
        
        lognupWithSocialLable.customLabel(text: Libs.signupWithSocialMedia.textLib, color: .C000000, size: .size_12 , font: .cairoMedium)
        bacSociaView.forEach { view in
            view.addShadow(color: .CF7F7F7 , radius: 0.5 ,offset: CGSize(width: 1, height: 1))
            view.addRadius(radius: 12)
        }
        signInBut.customButton(text: .login, textColor: .C000000, ofSize: .size_12, font: .cairoBold, styleFont: .semibold)
        haveAccountLable.customLabel(text: Libs.Doyoualreadyhaveanaccount.textLib, color: .C000000, size: .size_12 , font: .cairoLight)

        
    }
}
