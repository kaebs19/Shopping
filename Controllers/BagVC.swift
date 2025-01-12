//
//  BagVc.swift
//  Shopping
//
//  Created by Mohammed Saleh on 11/01/2025.
//

import UIKit


class BagVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var bagIsEmptyLabel: UILabel!
    @IBOutlet weak var bagisEmptyImage: UIImageView!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var bagLabel: UILabel!
    @IBOutlet weak var bagTV: UITableView!
    
    // MARK: - Variables - Arry
    var productsList: [Bags] = [
        Bags(name: "Calf-length Wrap Dress", description: "Grey, X-Large, Cott...", price: "39,99 RS", image: "Photo_3", deliveryDate: "8-10 Nov."),
        Bags(name: "Puff-sleeved Blouse", description: "Grey, X-Large, Cott...", price: "39,99 RS", image: "Photo_4", deliveryDate: "8-10 Nov.")
    ]
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // productsList.removeAll()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkCartStatus()
    }
    
}


extension BagVC {
    
    func setupUI() {
        customNavigationBar(items: [.MENU], title: .ShoppingBag)
        setupTV(tv: bagTV)
        statusButton.addRadius(cornerRadius: 10)
    }
    
    
    func setupTV(tv: UITableView) {
        tv.configureTableView(cellName: .BagsTVCell , delgate: self , dataSoucre: self)
        tv.hideScrollTableView(hide: true)
        tv.configureSeparator(inset: 0, style: .none)
        tv.reloadData()
    }
    
    /// This function checks the cart status and updates the UI based on whether the cart is empty or contains products.
    func checkCartStatus() {
        let isEmpty = productsList.isEmpty
        bagIsEmptyLabel.isHidden = !isEmpty
        bagisEmptyImage.isHidden = !isEmpty
        bagLabel.isHidden = isEmpty
        bagTV.isHidden = isEmpty
        
        if isEmpty {
            bagIsEmptyLabel.customLabel(text: Libs.MessageEmpty.textLib.localized, color: .C000000,
                                        size: .size_10 , font: .cairoRegular , typeFont: .semibold , line: 2)
            setupStatusButton(for: .shopNow)
        } else {
            bagLabel.customLabel(text: Libs.ShoppingTitle.textLib, color: .C161616,
                                 size: .size_20 , font: .cairoMedium , typeFont: .semibold)
            setupStatusButton(for: .proceedToPayment)
        }
        
    }
    
    
    func setupStatusButton(for state: CartButtonState) {
        statusButton.customButton(
            text: state.title,textColor: .CFFFFFF, backgroundColor: .C00CBFF, ofSize: .size_16, font: .cairoBold,  styleFont: .bold
        )
        statusButton.removeTarget(nil, action: nil, for: .allEvents)
        let action = state == .shopNow ? #selector(shopNowAction) : #selector(paymentAction)
        statusButton.addTarget(self, action: action, for: .touchUpInside)
    }
    
    private func removeProduct(at index: Int) {
        guard index >= 0 && index < productsList.count else { return }
        productsList.remove(at: index)
        bagTV.performBatchUpdates {
            bagTV.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        } completion: { _ in
            self.checkCartStatus()
        }
    }
    
    @objc func shopNowAction() {
        print("Press Shop Now")
    }
    
    @objc func paymentAction() {
        print("Press Payment")
        self.gotToNextVC(identifier: .PaymentVC)
    }
}

extension BagVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                print("Bag 1")
            case 1:
                print("Bag 2")
            default:
                print("Bag 3")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

extension BagVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BagsTVCell", for: indexPath) as! BagsTVCell
        cell.configureCell(cellData: productsList[indexPath.row])
        return cell
    }
    
    
}
