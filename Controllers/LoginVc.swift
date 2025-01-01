//
//  ViewController.swift
//  Shopping
//
//  Created by Mohammed Saleh on 23/12/2024.
//

import UIKit

class LoginVc: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var showMessageVIew: UIView!
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var signinLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLable: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet  var bacEmailAndPasswordView: [UIView]!
    @IBOutlet weak var forGetPasswordBut: UIButton!
    @IBOutlet weak var loginBut: UIButton!
    @IBOutlet weak var loginWithSocialLable: UILabel!
    @IBOutlet weak var dontHaveAccountLable: UILabel!
    @IBOutlet  var bacSociaView: [UIView]!
    @IBOutlet weak var signUpBut: UIButton!
    
    // MARK: - Variables

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
}


extension LoginVc{
    
    func setupUI(){
        showMessageVIew.isHidden = true
        
        
    }
}
