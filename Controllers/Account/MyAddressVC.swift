//
//  MyAddressVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 20/01/2025.
//

import UIKit

class MyAddressVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressTV: UITableView!
    @IBOutlet weak var addAddressBtn: UIButton!
    
    // MARK: - Variables - Arry
    var addressList: [Address] = [
        Address(Name: "Home", Street: "King Fahad Street", City: "Riyadh" , District: "ALyasmin" , Zip: 1234) ,
        Address(Name: "Work", Street: "King Abdullah Street", City: "Riyadh" , District: "Alsahafh" , Zip: 1234)
    ]
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    
}

// MARK: - UI Setup
extension MyAddressVC {
    
    func setupUI() {
        customNavigationBar(items: [.MENU , .CART], title: .none)
        titleLabel.customLabel(text: Libs.myAddress.textLib, color: .C161616, size: .size_20 , typeFont: .semibold)
        addAddressBtn.customButton(text: .AddNewAddress , textColor: .CFFFFFF, backgroundColor: .C00CBFF, ofSize: .size_14, font: .cairoBold, styleFont: .semibold)
        addAddressBtn.addRadius(cornerRadius: 25)
        addAddressBtn.addTarget(self, action: #selector(addNewAddressButton), for: .touchUpInside)
        setupTableView(tv: addressTV)
    }
    
    @objc private func addNewAddressButton() {
        
        let stoarayboard = UIStoryboard(name: Storyboards.TabBars.rawValue, bundle: nil)
        let addVC = stoarayboard.instantiateViewController(identifier: Identifiers.AddNewAddressVC.rawValue) as! AddNewAddressVC
        addVC.delegate = self
        addVC.currentState = .Done
        self.navigationController?.pushViewController(addVC, animated: true)
        
    }
    
    func editAddress(at index: Int) {
        let address = addressList[index]
        let stoaryboard = UIStoryboard(name: Storyboards.TabBars.rawValue, bundle: nil)
        let addVC = stoaryboard.instantiateViewController(identifier: Identifiers.AddNewAddressVC.rawValue) as! AddNewAddressVC
        addVC.delegate = self
        addVC.currentState = .Edit
        addVC.addressToEdit = address
        addVC.editingIndex = index
        self.navigationController?.pushViewController(addVC, animated: true)
    }
    
    
    private func setupTableView(tv: UITableView) {
        tv.configureTableView(cellName: .MyAddressTVCell , delgate: self , dataSoucre: self)
        tv.hideScrollTableView()
        tv.configureSeparator(inset: 0, style: .none)
    }
    
}

extension MyAddressVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension MyAddressVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(index: indexPath, cellType: MyAddressTVCell.self)
        cell.configurteCell(cellData: addressList[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    
}

// MARK: - AddNewAddressVCDelegate
extension MyAddressVC: AddNewAddressVCDelegate {
    
    func didSaveNewAddress(_ address: Address) {
        addressList.append(address)
        addressTV.reloadData()
    }
    
    func didUpdateAddress(_ address: Address, at index: Int) {
        addressList[index] = address
        addressTV.reloadData()
    }
    
    
}

// MARK: - MyAddressTVCellProtocol
extension MyAddressVC: MyAddressTVCellProtocol {
    
    func editingAddressButton(cell: MyAddressTVCell) {
        guard let indexPath = addressTV.indexPath(for: cell) else { return }
        editAddress(at: indexPath.row)
    }
}
