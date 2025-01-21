//
//  AccountVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 03/01/2025.
//

import UIKit

class AccountVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var backEditView: UIView!
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var bigEditView: UIView!
   @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountTV: UITableView!
    
    // MARK: - Variables - Arry
    var acountList: [Menu] = [
        Menu(name: Libs.orders.textLib, image: Images.Order_menu.names),
        Menu(name: Libs.WishList.textLib, image: Images.Wish_List.names),
        Menu(name: Libs.LastViewed.textLib, image: Images.Lost_view_menu.names),
        Menu(name: Libs.ShippingAdress.textLib, image: Images.Address_menu.names),
        Menu(name: Libs.Language.textLib, image: Images.Language_menu.names),
        Menu(name: Libs.Settings.textLib, image: Images.Settings_menu.names),
        Menu(name: Libs.Help.textLib, image: Images.Help_circle_menu.names),
        Menu(name: Libs.logout.textLib, image: Images.Logout.names)
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backEditView.makeCircular()
    }
    
    @IBAction func changeEditImage (_ sender: UIButton) {

        let alert = UIAlertController(title: Alerts.ChooseImage.texts,
                                      message: "",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: Alerts.Camera.texts, style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: Alerts.PhotoLabary.texts, style: .destructive, handler: { _ in
            self.openLibrary()
        }))
        
        alert.addAction(UIAlertAction(title: Alerts.cancel.texts, style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    private func openCamera () {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true)
        } else {
            print("Camara not available")
        }
    }
    private func openLibrary () {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
}


extension AccountVC {
    
    // MARK: - UI Setup
    func setupUI() {
        [ backEditView , bigEditView].forEach { editView in
            editView.makeCircular()
        }
        bigEditView.clipsToBounds = true
        bigEditView.makeCircular()
        
        bigEditView.backgroundColor = .white
        nameLabel.customLabel(text: "\(isEnglish() ? Libs.welcome.textLib : Libs.welcome.textLib) Mohammed Saleh", color: .C161616, size: .size_20 , font: .cairoMedium , typeFont: .semibold)
        setupTableView(tv: accountTV)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.accountTV.animateSequentially()
        }

    }
    
    func setupTableView(tv: UITableView) {
        tv.configureTableView(cellName: .SideMenuTVCell , delgate: self , dataSoucre: self)
        tv.configureSeparator(inset: 0, style: .none)
        tv.hideScrollTableView()
    }
}

// MARK: - UITableViewDelegate

extension AccountVC: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            case 0:
                gotToNextVC(identifier: .BagVc)
            case 1:
                gotToNextVC(identifier: .WishListVC)
            case 2:
                print(" TODO later Last Viewed  \(indexPath.row)")
            case 3:
                gotToNextVC(identifier: .MyAddressVC)
            case 4:
                gotToNextVC(identifier: .LanguageVC)
            case 5:
                gotToNextVC(identifier: .SettingsVC)

            case 6:
                print(" TODO later help \(indexPath.row)")

            case 7:
                print(" TODO later help \(indexPath.row)")
                // إنشاء الإجراء عند اختيار "نعم" (تسجيل الخروج)
                let yesAction = UIAlertAction(title: Alerts.yes.texts, style: .default) { _ in
                    // تنفيذ عملية تسجيل الخروج هنا
                    print("تم إلغاء تسجيل الخروج.")
                    UserDefault.shared.logout()
                    self.gotToNextVC(storyboard: .Main, identifier: .LoginVC)
                }
                
                // إنشاء الإجراء عند اختيار "لا" (إلغاء)
                let noAction = UIAlertAction(title: Alerts.no.texts, style: .cancel) { _ in
                    print("تم إلغاء تسجيل الخروج.")
                }
                let alert = UIAlertController()
                alert.showConfirmationMessage(title: Alerts.warning.texts, message: Alerts.warningMessage.texts, theme: .warning, actions: [yesAction , noAction])

            default:
                print(" TODO later  \(indexPath.row)")
                

        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: - UITableViewDataSource

extension AccountVC: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acountList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(index: indexPath, cellType: SideMenuTVCell.self)
        cell.setupData(cellData:acountList[indexPath.row] )
        return cell
    }
    
    
}

extension AccountVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            print("تم اختيار الصورة بنجاح")
            editImageView.contentMode = .scaleAspectFill
            editImageView.image = pickedImage
            editImageView.makeCircular()
        } else {
            print("فشل في تحميل الصورة")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
