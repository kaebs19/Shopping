//
//  ViewController.swift
//  Shopping
//
//  Created by Mohammed Saleh on 23/12/2024.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var showMessageVIew: UIView!
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var signinLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLable: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordImage: UIImageView!
    @IBOutlet  var bacEmailAndPasswordView: [UIView]!
    @IBOutlet weak var forGetPasswordBut: UIButton!
    @IBOutlet weak var loginBut: UIButton!
    @IBOutlet weak var loginWithSocialLable: UILabel!
    @IBOutlet weak var dontHaveAccountLable: UILabel!
    @IBOutlet  var bacSociaView: [UIView]!
    @IBOutlet weak var signUpBut: UIButton!
    
    // MARK: - Variables
    var isShowPassword: Bool = false {
        didSet {
            passwordTextField.isSecureTextEntry = !isShowPassword
            let imageName = isShowPassword ? Images.Eye_on.names : Images.Eye_of.names
            UIView.transition(with: showPasswordImage, duration: 5.0, options: .transitionFlipFromLeft , animations: {
                self.showPasswordImage.image = UIImage(named: imageName)
            } , completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func showPasswordClickBut(_ sender: UIButton) {
        isShowPassword.toggle()
    }
    
    @IBAction func forGetPasswordClickBut(_ sender: UIButton) {
        gotToNextVC(identifier: .ForgotPasswordVC)
    }
    
    @IBAction func loginClickBut(_ sender: UIButton) {
        
        gotToNextVC(storyboard: .TabBars, identifier: .TabBars )
        
//        if validateLoginFields(){
//            self.showMessage(title: Alerts.Success.rawValue, message: Alerts.Successfully.texts, thme: .success  )
//        }
    }
    
    @IBAction func signUpClickBut(_ sender: UIButton) {
        gotToNextVC(identifier: .SigninVC)
    }
}


extension LoginVC{
    
    func setupUI(){
        hideKeyboard()
        showMessageVIew.isHidden = true
        showMessageVIew.addRadius(radius: 25)
        bigView.addMaskCorners(radius: 20, corners: [.topLeftCorner , .topLeftCorner])
        signinLable.customLabel(text: Libs.Signin.textLib, color: .C161616, size: .size_20 , font: .cairoMedium , typeFont: .bold)
        
        emailLable.customLabel(text: Libs.email.textLib, color: .C110F24, size: .size_12 , font: .cairoRegular)
        emailTextField.customTextField(placeholder: .email, ofSize: .size_14)
        passwordLable.customLabel(text: Libs.password.textLib, color: .C161616, size: .size_12 , font: .cairoRegular )
        passwordTextField.customTextField(placeholder: .email, ofSize: .size_14 ,isPassword: true)
        bacEmailAndPasswordView.forEach { view in
            view.addRadius(radius: 24)
            view.addBorder(color: .CE6E6E6, width: 1)
        }
        forGetPasswordBut.customButton(text: .forgotPassword, textColor: .C000000, ofSize: .size_12, font: .cairoMedium, styleFont: .semibold)
        [loginBut].forEach { button in
            button?.customButton(text: .login, textColor: .CFFFFFF, backgroundColor: .C00CBFF, ofSize: .size_14, font: .cairoBold, styleFont: .bold)
            button?.addRadius(radius: 27)
        }
        loginWithSocialLable.customLabel(text: Libs.loginWithSocial.textLib, color: .C000000, size: .size_12 , font: .cairoMedium)
        bacSociaView.forEach { view in
            view.addShadow(color: .CF7F7F7 , radius: 0.5 ,offset: CGSize(width: 1, height: 1))
            view.addRadius(radius: 12)
        }
        dontHaveAccountLable.customLabel(text: Libs.dontHaveAnAccount.textLib, color: .C000000, size: .size_12 , font: .cairoLight , typeFont: .semibold)
        signUpBut.customButton(text: .signUp, textColor: .C000000, ofSize: .size_12, font: .cairoBold, styleFont: .semibold)
        
    }
    
    
    func validateLoginFields() -> Bool {
        
        resetBorders()
        
        // التحقق من البريد الإلكتروني
        guard let email = emailTextField.text, !email.isEmpty else {
            self.showMessage(title: Alerts.Error.texts, message: Alerts.EmailIsEmpty.texts, thme: .error)
            bacEmailAndPasswordView.forEach { view in
                if view.tag == 0{
                    view.addBorder(color: .CC84040_Rad, width: 1)
                }
            }
            return false
        }
        // التحقق من صحة تنسيق البريد الإلكتروني
        if !isValidEmail(email) {
            self.showMessage(title: Alerts.Error.texts, message: Alerts.EmailFormatIsIncorrect.texts, thme: .error)
            bacEmailAndPasswordView.forEach { view in
                if view.tag == 0{
                    view.addBorder(color: .CC84040_Rad, width: 1)
                }
            }
            return false
        }
        
        // التحقق من كلمة المرور
        guard let password = passwordTextField.text, !password.isEmpty else {
            self.showMessage(title: Alerts.Error.texts, message: Alerts.PasswordIsEmpty.texts, thme: .error)
            bacEmailAndPasswordView.forEach { view in
                if view.tag == 1{
                    view.addBorder(color: .CC84040_Rad, width: 1)
                }
            }
            return false
        }
        
        // التحقق من قوة كلمة المرور (اختياري)
        if !isValidPassword(password) {
            self.showMessage(title: Alerts.Error.texts, message: Alerts.PasswordIsShort.texts, thme: .error)
            bacEmailAndPasswordView.forEach { view in
                if view.tag == 1{
                    view.addBorder(color: .CC84040_Rad, width: 1)
                }
            }
            return false
        }
        
        // إذا كانت جميع المدخلات صحيحة
        return true
    }
    
    // إعادة تعيين الحدود لجميع العناصر
    func resetBorders() {
        bacEmailAndPasswordView.forEach { view in
            view.addBorder(color: .CE6E6E6, width: 1) // إزالة الحدود
        }
    }
}
