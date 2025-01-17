//
//  PaymentVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 10/01/2025.
//

import UIKit

/// ViewController المسؤول عن عرض شاشة الدفع
class PaymentVC: UIViewController {
    
    // MARK: - IBOutlets
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
    @IBOutlet weak var selectAddressLabel: UILabel!
    @IBOutlet weak var selectMethedLabel: UILabel!
    @IBOutlet weak var backPayView: UIView!
    @IBOutlet weak var shoppingAddressLabel: UILabel!
    @IBOutlet weak var shoppingMethodLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var bigView: UIView!
    
    // MARK: - Constraints
    @IBOutlet weak var changeValueAspect: NSLayoutConstraint!
    @IBOutlet weak var changeValueTrailing: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideOrShowTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// إعادة ضبط الـUI بعد تحديد الإطار النهائي للفيو
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
        creditView.adjustViewSize(newWidth: 200, newHeight: 120, aspectConstraint: changeValueAspect)
    }
    
    // MARK: - Actions

    /// زر الدفع النهائي
    @IBAction func payButtonTapped(_ sender: UIButton) {
        if validateTextFields() {
            // بإمكانك المتابعة مع الـPayment
            print("Payment details are valid. Proceeding with payment...")
        }
    }
    
    /// زر إظهار نافذة اختيار العناوين
    @IBAction func showAdressButtonTapped(_ sender: UIButton) {
        showBagsPopup(type: .address)
    }
    
    /// زر إظهار نافذة اختيار طرق الشحن
    @IBAction func showMethedsButtonTapped(_ sender: UIButton) {
        showBagsPopup(type: .method)
    }
    
    // MARK: - Popup Presentation
    
    /// إنشاء وعرض الـPopup (العناوين أو طرق الشحن)
    private func showBagsPopup(type: PopupType) {
        // خلفية شبه شفافة تغطي الشاشة
        let dimmedView = UIView(frame: self.view.bounds)
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        dimmedView.alpha = 0.0   //نبدأ من 0 لتطبيق الانيميشن
        dimmedView.tag = 999  // لسهولة إيجادها وإزالتها لاحقًا
        self.view.addSubview(dimmedView)
        // Gesture للإغلاق
        let topGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        dimmedView.addGestureRecognizer(topGesture)
        
        // 2) إنشاء الـBagsPouesView
        // إنشاء الـBagsPouesView وتحديد إطار عرضه
        let popupWidth: CGFloat = self.view.bounds.width
        let popupHeight: CGFloat = 420        
        let popupFrame = CGRect(x: 0, y: self.view.bounds.height, width: popupWidth, height: popupHeight)
        let popup = BagsPopuesView(frame: popupFrame)
        
        // ضبط نوع الـPopup (العناوين أو الشحن)
        popup.popupType = type
        // تعيين الـDelegate لاستقبال حدث الضغط على زر DONE
        popup.delegate = self
        // تهيئة الـpopup داخليًا
        popup.setup()
        // إضافته إلى الـdimmedView
        dimmedView.addSubview(popup)
        // أنيميشن لظهوره
        UIView.animate(withDuration: 0.5) {
            dimmedView.alpha = 1.0
            popup.frame.origin.y = self.view.bounds.height - popupHeight
        }
        
        // إيماءة لإغلاق الـPopup عند الضغط على الخلفية (dimmedView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        dimmedView.addGestureRecognizer(tapGesture)
    }
    
    /// إزالة الـPopup (والخلفية) من الشاشة
    @objc private func dismissPopup() {
   
        if let dimmedView = self.view.viewWithTag(999) {
            // إذا أردت انيميشن عند الإغلاق:
            UIView.animate(withDuration: 0.5, animations: {
                // إعادة شفافية الخلفية إلى 0
                dimmedView.alpha = 0.0
                // لو أردت إنزال الـpopup للأسفل مرة أخرى:
                // ابحث عن الـBagsPouesView داخله
                if let popup = dimmedView.subviews.first(where: { $0 is BagsPopuesView }) {
                    popup.frame.origin.y = self.view.bounds.height
                }
            }, completion: { _ in
                dimmedView.removeFromSuperview()
            })
        }
        
    }
}

// MARK: - UI Setup
extension PaymentVC {
    
    /// ضبط الواجهة الرسومية (الألوان، الأشكال، وغيرها)
    func setupUI() {
        customNavigationBar(items: [.MENU , .CART], title: .Payment)
        // hideKeyboard() // إن إخفاء الكيبورد باللمس على الشاشة
        
        setupTextFields()
        
        // إعدادات بعض العناصر
        [creditView].forEach { cred in
            cred?.configureAppearance(
                cornerRadius: 6,
                gradientColors: [
                    UIColor(hex: ColorsBackground.StartGradation.rawValue) ?? .clear,
                    UIColor(hex: ColorsBackground.MiddleGradation.rawValue) ?? .clear,
                    UIColor(hex: ColorsBackground.EndGradation.rawValue) ?? .clear
                ]
            )
        }
        
        // جميع الخلفيات تضيف لها دائرة وخط
        backgroundView.forEach { view in
            view.addRadius(radius: 24)
            view.addBorder(color: .CE6E6E6, width: 1)
        }
        
        // تخصيص اللابلز
        let labels = [holderNameLab, nubmberCardLab, expiryDateLab, cvvLab]
        labels.forEach {
            $0?.customLabel(
                text: $0?.text ?? "",
                color: .CFFFFFF,
                size: .size_14,
                font: .cairoBold,
                typeFont: .bold
            )
        }
        
        // تخصيص حقول الاسم والبطاقة وتوابعها
        nameSurnameLabel.customLabel(text: Libs.NameSurname.textLib, color: .C110F24, size: .size_12)
        nameSurNameTextField.customTextField(placeholder: .NameSurname, placeholderColor: .CF7F7F7, textColor: .C161616, ofSize: .size_14)
        
        cardNumberLabel.customLabel(text: Libs.CardNumber.textLib, color: .C110F24, size: .size_12)
        cardNumberTextField.customTextField(placeholder: .CardNumber, placeholderColor: .CF7F7F7, textColor: .C161616, ofSize: .size_14)
        
        expiryDateLabel.customLabel(text: Libs.ExpirationDate.textLib, color: .C110F24, size: .size_12)
        expiryDateTextField.customTextField(placeholder: .ExpirationDate, placeholderColor: .CF7F7F7, textColor: .C161616, ofSize: .size_14)
        
        cvvLabel.customLabel(text: Libs.CVC.textLib, color: .C110F24, size: .size_12)
        cvvTextField.customTextField(placeholder: .CVC, placeholderColor: .CF7F7F7, textColor: .C161616, ofSize: .size_14)
        [selectMethedLabel , selectAddressLabel].forEach { select in
            select.customLabel(text: Libs.Select.textLib, color: .C000000, size: .size_14 ,font: .cairoRegular ,typeFont: .regular , direction: .Left)
        }
        shoppingAddressLabel.customLabel(text: Libs.ShippingAdress.textLib, color: .C161616, size: .size_16 , font: .cairoBold , typeFont: .semibold)
        shoppingMethodLabel.customLabel(text: Libs.ShppingMethod.textLib, color: .C161616, size: .size_16 , font: .cairoBold , typeFont: .semibold)

        // خلفية الدفع السفلية
        backPayView.addMaskCorners(radius: 20, corners: [.topLeftCorner, .topRightCorner])
        totalPriceLabel.customLabel(text: Libs.Totle.textLib, color: .CFFFFFF, size: .size_14, font: .cairoBold, typeFont: .semibold)
        priceLabel.customLabel(text: "RS79,98", color: .CFFFFFF, size: .size_28, font: .cairoBold, typeFont: .semibold)
        payLabel.customLabel(text: Libs.Pay.textLib, color: .CFFFFFF, size: .size_14 , font: .cairoBold , typeFont: .semibold)
        // إعداد bigView
        bigView.addBorder(color: .CFFFFFF, width: 1)
        bigView.addRadius(radius: 10)
    }
}

// MARK: - Validation & TextFields Formatting
extension PaymentVC: UITextFieldDelegate {
    
    /// تحضير الـTextFields (التفويض delegate, الـtags, الأحداث)
    func setupTextFields() {
        nameSurNameTextField.delegate = self
        cardNumberTextField.delegate = self
        expiryDateTextField.delegate = self
        cvvTextField.delegate = self
        
        nameSurNameTextField.tag = 0
        cardNumberTextField.tag = 1
        expiryDateTextField.tag = 2
        cvvTextField.tag = 3
        
        nameSurNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        cardNumberTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        expiryDateTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        cvvTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    /// تفعيل التنسيق والقيود أثناء إدخال النص
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let updatedText = textField.text else { return }
        
        switch textField.tag {
        case 0: // الاسم
            textField.text = formatName(updatedText)
            updateLable(for: textField.tag, text: textField.text ?? "")
            
        case 1: // رقم البطاقة
            let cleanText = updatedText.replacingOccurrences(of: "-", with: "")
            let truncatedText = String(cleanText.prefix(16))
            textField.text = truncatedText.formatCardNumber()
            updateLable(for: textField.tag, text: textField.text ?? "")
            
        case 2: // تاريخ الصلاحية
            let cleanText = updatedText.replacingOccurrences(of: "/", with: "")
            if cleanText.count > 2 {
                let month = String(cleanText.prefix(2))
                if let monthInt = Int(month), monthInt > 12 {
                    textField.text = ""
                    return
                }
            }
            let truncatedText = String(updatedText.prefix(5))
            textField.text = formatExpiryDate(truncatedText)
            updateLable(for: textField.tag, text: textField.text ?? "")
            
        case 3: // CVV
            let truncatedText = String(updatedText.prefix(3))
            textField.text = truncatedText.map { _ in "*" }.joined()
            updateLable(for: textField.tag, text: truncatedText)
            
        default:
            break
        }
    }
    
    /// تنسيق الاسم بإجباره على الأحرف الكبيرة
    private func formatName(_ text: String) -> String {
        return text.uppercased()
    }
    
    /// إعادة تنسيق رقم البطاقة بإضافة "-"
    private func formatCardNumber(_ text: String) -> String {
        let cleanText = text.replacingOccurrences(
            of: "[^0-9]",
            with: "",
            options: .regularExpression
        )
        return cleanText.enumerated().map { index, character in
            (index % 4 == 0 && index != 0) ? "-\(character)" : "\(character)"
        }.joined()
    }
    
    /// تنسيق تاريخ الصلاحية بإضافة "/" بعد الشهر
    private func formatExpiryDate(_ text: String) -> String {
        if text.count == 2 && !text.contains("/") {
            return "\(text)/"
        }
        return text
    }
    
    /// التحقق من طول النص
    private func formatCVV(_ text: String) -> String {
        return String(text.prefix(3))
    }
    
    /// عند انتهاء الكتابة
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            textField.text = textField.text?.uppercased()
        }
        updateLable(for: textField.tag, text: textField.text ?? "")
    }
    
    /// تحديث الـLabels المرتبطة
    private func updateLable(for tag: Int, text: String) {
        switch tag {
        case 0:
            holderNameLab.text = text
        case 1:
            nubmberCardLab.text = text
        case 2:
            expiryDateLab.text = text
        case 3:
            cvvLab.text = String(text.prefix(3))
        default:
            break
        }
    }
}

// MARK: - Fields Validation
extension PaymentVC {
    /// التحقق من مدخلات المستخدم قبل الدفع
    private func validateTextFields() -> Bool {
        guard
            let nameSurName = nameSurNameTextField.text,
            !nameSurName.isEmpty
        else {
            self.showMessage(title: "Error",
                             message: "Surname and Name are required".localized,
                             thme: .error)
            return false
        }
        
        guard
            let cardNumber = cardNumberTextField.text,
            cardNumber.replacingOccurrences(of: "-", with: "").count == 16
        else {
            self.showMessage(title: "Error",
                             message: "Card number must contain 16 digits".localized,
                             thme: .error)
            return false
        }
        
        guard
            let expiryDate = expiryDateTextField.text,
            expiryDate.isValidExpiryDate()
        else {
            self.showMessage(title: "Error",
                             message: "Invalid expiry date. Format: MM/YY.".localized,
                             thme: .error)
            return false
        }
        
        guard
            let cvv = cvvTextField.text,
            cvv.count == 3
        else {
            self.showMessage(title: "Error",
                             message: "CVV must be 3 digits.".localized,
                             thme: .error)
            return false
        }
        
        return true
    }
}

// MARK: - BagsPouesViewDelegate
extension PaymentVC: BagsPouesViewDelegate {
    func didPressDone(in popup: BagsPopuesView) {
        // إغلاق الـPopup
        dismissPopup()
        
        // يمكنك هنا استخدام popup.popupType لمعرفة أي نوع أغلقه المستخدم
        if popup.popupType == .address {
            print("User finished selecting address.")
        } else {
            print("User finished selecting shipping method.")
        }
    }
}
