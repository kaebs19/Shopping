    //
    //  PaymentVC.swift
    //  Shopping
    //
    //  Created by Mohammed Saleh on 10/01/2025.
    //

    import UIKit

    class PaymentVC: UIViewController {
        
        // MARK: - Outlets
        @IBOutlet weak var creditView: UIView!
        
        @IBOutlet var backgroundView: [UIView]!
        @IBOutlet weak var holderNameLab: UILabel!
        @IBOutlet weak var nubmberCardLab: UILabel!
        @IBOutlet weak var expiryDateLab: UILabel!
        @IBOutlet weak var cvvLab: UILabel!
        
        @IBOutlet weak var nameSurnameLabel: UILabel!
        @IBOutlet weak var nameSurNameTextField: UITextField!
        @IBOutlet weak var cardNumberLabel: UILabel!
        @IBOutlet weak var cardNumberTextField: UITextField!
        @IBOutlet weak var expiryDateLabel: UILabel!
        @IBOutlet weak var expiryDateTextField: UITextField!
        @IBOutlet weak var cvvLabel: UILabel!
        @IBOutlet weak var cvvTextField: UITextField!
        //    @IBOutlet weak var shoppingAddressLabel: UILabel!
        //    @IBOutlet weak var selectAddressButton: UIButton!
        //    @IBOutlet weak var shoppingMethodLabel: UILabel!
        //    @IBOutlet weak var selectMethodButton: UIButton!
        //    @IBOutlet weak var totalPriceLabel: UILabel!
        //    @IBOutlet weak var payButton: UIButton!
        //    @IBOutlet weak var priceLabel: UILabel!
        
        @IBOutlet weak var changeValueAspect: NSLayoutConstraint!
        
        @IBOutlet weak var changeValueTrailing: NSLayoutConstraint!
        
        // MARK: - Variables - Arry
        
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            hideOrShowTabBar()
        }
        
        // MARK: - UI Setup
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            setupUI()
            
        }
        
        @IBAction func payButtonTapped(_ sender: Any) {
            if validateTextFields() {
                // Proceed with the payment
                print("Payment details are valid. Proceeding with payment...")
            }
        }
        
        
    }

    extension PaymentVC {
        
        func setupUI() {
            customNavigationBar(items: [.MENU , .CART], title: .Payment)
            // hideKeyboard()
            setupTextFields()
            
            [creditView].forEach { cred in
                cred?.configureAppearance(cornerRadius: 6 , gradientColors: [
                    UIColor(hex: ColorsBackground.StartGradation.rawValue) ?? .clear ,
                    UIColor(hex: ColorsBackground.MiddleGradation.rawValue) ?? .clear ,
                    UIColor(hex: ColorsBackground.EndGradation.rawValue) ?? .clear
                ])
            }
            backgroundView.forEach({ view in
                view.addRadius(radius: 24)
                view.addBorder(color: .CE6E6E6, width: 1)
            })
            
            let labels = [holderNameLab , nubmberCardLab , expiryDateLab , cvvLab]
            labels.forEach {$0?.customLabel(text: $0?.text ?? "", color: .CFFFFFF, size: .size_14 , font: .cairoBold , typeFont: .bold) }
            
            nameSurnameLabel.customLabel(text: Libs.NameSurname.textLib, color: .C110F24, size: .size_12)
            nameSurNameTextField.customTextField(placeholder: .NameSurname, placeholderColor: .CF7F7F7, textColor: .C161616 , ofSize: .size_14 )
            cardNumberLabel.customLabel(text: Libs.CardNumber.textLib, color: .C110F24, size: .size_12)
            cardNumberTextField.customTextField(placeholder: .CardNumber, placeholderColor: .CF7F7F7, textColor: .C161616 , ofSize: .size_14 )
            expiryDateLabel.customLabel(text: Libs.ExpirationDate.textLib, color: .C110F24, size: .size_12)
            expiryDateTextField.customTextField(placeholder: .ExpirationDate, placeholderColor: .CF7F7F7, textColor: .C161616 , ofSize: .size_14 )
            cvvLabel.customLabel(text: Libs.CVC.textLib, color: .C110F24, size: .size_12)
            cvvTextField.customTextField(placeholder: .CVC, placeholderColor: .CF7F7F7, textColor: .C161616 , ofSize: .size_14 )
        }
        
        private func validateTextFields() -> Bool {
            guard let nameSurName = nameSurNameTextField.text, !nameSurName.isEmpty else {
                self.showMessage(title: "Error", message: "Surname and Name are required".localized, thme: .error)
                return false
            }
            guard let cardNumber = cardNumberTextField.text, cardNumber.replacingOccurrences(of: "-", with: "").count == 16 else {
                self.showMessage(title: "Error", message: "Card number must contain 16 digits".localized, thme: .error)
                return false
            }
            guard let expiryDate = expiryDateTextField.text, expiryDate.isValidExpiryDate() else {
                self.showMessage(title: "Error", message: "Invalid expiry date. Format: MM/YY.".localized, thme: .error)
                return false
            }
            guard let cvv = cvvTextField.text, cvv.count == 3 else {
                self.showMessage(title: "Error", message: "CVV must be 3 digits.".localized, thme: .error)
                return false
            }
            return true
        }
    }


    extension PaymentVC: UITextFieldDelegate {
        
        func setupTextFields(){
            // تعيين الـ delegate
            nameSurNameTextField.delegate = self
            cardNumberTextField.delegate = self
            expiryDateTextField.delegate = self
            cvvTextField.delegate = self
            
            // تعيين الـ tags
            nameSurNameTextField.tag = 0
            cardNumberTextField.tag = 1
            expiryDateTextField.tag = 2
            cvvTextField.tag = 3
            
            nameSurNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            cardNumberTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            expiryDateTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            cvvTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            guard let updatedText = textField.text else { return }
            
            switch textField.tag {
                case 0: // الاسم
                    textField.text = formatName(updatedText)
                    updateLable(for: textField.tag, text: textField.text ?? "")
                    
                case 1: // رقم البطاقة
                    let cleanText = updatedText.replacingOccurrences(of: "-", with: "")
                    let truncatedText = String(cleanText.prefix(16)) // تأكد من عدم تجاوز 16 رقم
                    textField.text = truncatedText.formatCardNumber()
                    updateLable(for: textField.tag, text: textField.text ?? "")
                    
                case 2: // تاريخ الصلاحية
                    let cleanText = updatedText.replacingOccurrences(of: "/", with: "")
                    if cleanText.count > 2 {
                        let month = String(cleanText.prefix(2))
                        if let monthInt = Int(month), monthInt > 12 { // التحقق من أن الشهر لا يتجاوز 12
                            textField.text = ""
                            return
                        }
                    }
                    let truncatedText = String(updatedText.prefix(5)) // تأكد من عدم تجاوز 5 أحرف
                    textField.text = formatExpiryDate(truncatedText)
                    updateLable(for: textField.tag, text: textField.text ?? "")
                    
                case 3: // CVV
                    let truncatedText = String(updatedText.prefix(3)) // تأكد من عدم تجاوز 3 أرقام
                    textField.text = truncatedText.map { _ in "*" }.joined() // إظهار نجوم بدلاً من النصوص
                    updateLable(for: textField.tag, text: truncatedText) // تحديث النص الأصلي في مكان آخر
                    
                default:
                    break
            }
        }
        
        private func formatName(_ text: String) -> String {
            return text.uppercased()
        }

        private func formatCardNumber(_ text: String) -> String {
            let cleanText = text.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            return cleanText.enumerated().map { index, character in
                return (index % 4 == 0 && index != 0) ? "-\(character)" : "\(character)"
            }.joined()
        }

        private func formatExpiryDate(_ text: String) -> String {
            let cleanText = text.replacingOccurrences(of: "/", with: "")
            
            // التأكد من أن الشهر لا يتجاوز 12
            if cleanText.count >= 2 {
                let month = String(cleanText.prefix(2))
                if let monthInt = Int(month), monthInt > 12 {
                    return "MM/YY" // إعادة النص الافتراضي إذا كان الشهر غير صالح
                }
            }
            
            // إضافة "/" بعد الشهر إذا تم إدخال شهر صالح
            if cleanText.count == 2 {
                return "\(cleanText)/"
            }
            
            // قص النص إلى 5 أحرف كحد أقصى
            return String(cleanText.prefix(5))
        }
        
        
        private func formatCVV(_ text: String) -> String {
            return String(text.prefix(3)) // تأكد من النص الأصلي
        }
        
        // تحديث النصوص عند انتهاء الكتابة
        func textFieldDidEndEditing(_ textField: UITextField) {
            if textField.tag == 0 {
                textField.text = textField.text?.uppercased()
            }
            updateLable(for: textField.tag, text: textField.text ?? "")
        }
        
        private func updateLable(for tag: Int, text: String) {
            switch tag {
                case 0: holderNameLab.text = text
                case 1: nubmberCardLab.text = text
                case 2: expiryDateLab.text = text
                case 3: cvvLab.text = String(text.prefix(3)) // إظهار النص الحقيقي في الحقل الأصلي
                default:
                    break
            }
        }
    }
