//
//  AddNewAddressVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 20/01/2025.
//

import UIKit

enum stateButtons {
    case Edit
    case Done
}

protocol AddNewAddressVCDelegate: AnyObject {
    func didSaveNewAddress(_ address: Address)
    func didUpdateAddress(_ address: Address, at index: Int)
}


class AddNewAddressVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet  var mainView: [UIView]!
    @IBOutlet weak var addressNameLabel: UILabel!
    @IBOutlet weak var addressNameTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var disLabel: UILabel!
    @IBOutlet weak var disTextField: UITextField!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet  weak var zipCodeLabel: UILabel!
    @IBOutlet  weak var zipCodeTextField: UITextField!
    @IBOutlet  weak var saveButton: UIButton!
    
    // MARK: - Variables - Arry
    weak var delegate: AddNewAddressVCDelegate?
    var currentState: stateButtons = .Done
    var addressToEdit: Address?
    var editingIndex: Int?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    
    
    
}

// MARK: - UI Setup
extension AddNewAddressVC {
    
    func setupUI() {
        customNavigationBar(items: [.MENU , .CART], title: .none)
        updateTitle()
        mainView.forEach { view in
            view.addRadius(radius: 20)
            view.addBorder(color: .CE6E6E6, width: 1)
        }
        
        let textLabels = [Libs.AddressName.textLib , Libs.City.textLib , Libs.District.textLib, Libs.street.textLib , Libs.ZipCode.textLib]
        [addressNameLabel , cityLabel , disLabel , streetLabel , zipCodeLabel].enumerated().forEach { index , label in
            label?.customLabel(text: textLabels[index], color: .C161616, size: .size_12)
        }
        
        let placeholderTexts = [TextFields.AddressName , TextFields.City , TextFields.District , TextFields.Street , TextFields.ZipCode]
        [addressNameTextField , cityTextField , disTextField , streetTextField , zipCodeTextField].enumerated().forEach { index , textField in
            textField?.customTextField(placeholder: placeholderTexts[index] ,placeholderColor: .CEEEEEE ,textColor: .C161616, ofSize: .size_16 , styleFont: .semibold)
            textField?.tag = index
            
        }
        
        switch currentState {
                
            case .Edit:
                if let address = addressToEdit {
                    addressNameTextField.text = address.Name
                    cityTextField.text = address.City
                    disTextField.text = address.District
                    streetTextField.text = address.Street
                    if let zip = address.Zip {
                        zipCodeTextField.text = "\(zip)"
                    }
                }
                
            case .Done:
                self.saveButton.setTitle(Buts.SaveAddress.textBut, for: .normal)
        }
        
        saveButton.setTitle(isEnglish() ? "Save" : "حفظ", for: .normal)
        saveButton.addRadius(cornerRadius: 20)
        saveButton.addTarget(self, action: #selector(saveOrEditAddress), for: .touchUpInside)
        
    }
    
    // MARK: - Actions
    
    private func updateTitle () {
        switch currentState {
            case .Edit: titleLabel.customLabel(text: Libs.AddAddress.textLib, color: .C161616, size: .size_20 , font: .cairoBold)
            case .Done: titleLabel.customLabel(text: Libs.myAddress.textLib, color: .C161616, size: .size_20 , font: .cairoBold)
        }
    }
    

    @objc func saveOrEditAddress() {
        if validateTextFields() {
            switch currentState {
            case .Edit:
                editExistingAddress()
            case .Done:
                saveNewAddress()
            }
        }
    }
    
    private func saveNewAddress() {
        let newAddress = Address(
            Name: addressNameTextField.text ?? "",
            Street: streetTextField.text ?? "",
            City: cityTextField.text ?? "",
            District: disTextField.text,
            Zip: Int(zipCodeTextField.text ?? "")
        )
        
        delegate?.didSaveNewAddress(newAddress)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    private func editExistingAddress () {
        guard let index = editingIndex else { return }
        
        let updatedAddress = Address(
            Name: addressNameTextField.text ?? "",
            Street: streetTextField.text ?? "",
            City: cityTextField.text ?? "",
            District: disTextField.text,
            Zip: Int(zipCodeTextField.text ?? "")
        )
        
        delegate?.didUpdateAddress(updatedAddress, at: index)
        self.navigationController?.popViewController(animated: true)
    }
    
    func validateTextFields() -> Bool {
        let allTextFields = [addressNameTextField, cityTextField, disTextField, streetTextField, zipCodeTextField]

        for textField in allTextFields {
            if textField?.tag == 4 {
                continue
            }
            
            if textField?.isEnpty() == true {
                showMessage(title: Alerts.Error.texts, message: "\(getFieldName(for: textField?.tag ?? -1 ))", thme: .error)
                return false
            }

        }
        return true
    }
    
    private func getFieldName(for tag: Int) -> String {
        switch tag {
        case 0: return isEnglish() ? "Address Name" : "اسم العنوان"
        case 1: return isEnglish() ? "City" : "المدينة"
        case 2: return isEnglish() ? "District" : "الحي"
        case 3: return isEnglish() ? "Street" : "الشارع"
        case 4: return isEnglish() ? "Zip Code" : "الرمز البريدي"
        default: return "Field"
        }
    }
    
}

