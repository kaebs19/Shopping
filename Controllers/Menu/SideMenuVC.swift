//
//  SLideMenu.swift
//  Shopping
//
//  Created by Mohammed Saleh on 05/01/2025.
//

import UIKit

class SideMenuVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var backgroundEditView: UIView!
    @IBOutlet weak var editImageView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var logoutLabel: UILabel!
    
    
    // MARK: - Variables
    
    var menuList: [Menu] = [
        Menu(name: Libs.orders.textLib, image: Images.Order_menu.names),
        Menu(name: Libs.WishList.textLib, image: Images.Wish_List.names),
        Menu(name: Libs.LastViewed.textLib, image: Images.Lost_view_menu.names),
        Menu(name: Libs.ShippingAdress.textLib, image: Images.Address_menu.names),
        Menu(name: Libs.Language.textLib, image: Images.Language_menu.names),
        Menu(name: Libs.Settings.textLib, image: Images.Settings_menu.names),
        Menu(name: Libs.Help.textLib, image: Images.Help_circle_menu.names),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {

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

    }
    
}



extension SideMenuVC {
    func setupUI() {
        setupTableView(tv: sideMenuTableView)
        [editImageView , backgroundEditView].forEach { view in
            view?.makeCircular()
            if let editImageView = editImageView {
                editImageView.backgroundColor = Colors.CFFFFFF.uiColor
            }
        }
        
        nameLabel.customLabel(text: "\(isEnglish() ? Libs.welcome.textLib : Libs.welcome.textLib) Mohammed Saleh", color: .C161616, size: .size_20 , font: .cairoMedium , typeFont: .semibold)
        logoutLabel.customLabel(text: Libs.logout.textLib, color: .C161616, size: .size_14 , font: .cairoRegular , typeFont: .regular)
        
    }
    
    func setupTableView(tv: UITableView) {
        tv.configureTableView(cellName: .SideMenuTVCell , delgate: self , dataSoucre: self)
        tv.configureSeparator(inset: 0, style: .none)
        tv.hideScrollTableView(hide: true)
        tv.animateCells()
    }
    
}


extension SideMenuVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0: gotToNextVC(identifier: .BagVc)
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
            default:
                gotToNextVC(identifier: .FAQVC)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}

extension SideMenuVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(index: indexPath, cellType: SideMenuTVCell.self)
        cell.setupData(cellData:menuList[indexPath.row] )
        return cell
    }
    
    
}
