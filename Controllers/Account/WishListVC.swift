//
//  WIshListVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 19/01/2025.
//

import UIKit

class WishListVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var wishListTV: UITableView!
    
    // MARK: - Variables - Arry
    var wishList: [Wishes] = [
        Wishes(name: "Calf-length Wrap Dress", price: "Price: 39,99$", description: "Lowest Price for 6 month: 34,99$", isSelected: false, image: "Photo_3") ,
        Wishes(name: "Puff-sleeved Blouse", price: "Price: 64,50$", description: "Lowest Price for 6 month: 54,99$", isSelected: false, image: "Photo_4") ,

    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}


extension WishListVC {
    
    func setupUI() {
        customNavigationBar(items: [.MENU , .CART], title:.Wishlist)
        titleLabel.customLabel(text: Libs.WishList.textLib, color: .C161616, size: .size_20 , typeFont: .semibold)
        setupTableView(tv: wishListTV)
    }
    
    func setupTableView(tv: UITableView) {
        tv.configureTableView(cellName: .WishListTVCell , delgate: self , dataSoucre: self)
        tv.hideScrollTableView()
        tv.configureSeparator(inset: 0, style: .none)
        
    }
}

// MARK: - UITableViewDelegate
extension WishListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension WishListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(index: indexPath, cellType: WishListTVCell.self)
        cell.configureCell(cellData: wishList[indexPath.row])
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }
    
    
}
    
extension WishListVC: WishListTVCellProtocol {
    func removeForListButtonTapped(cell: WishListTVCell) {
        guard let indexPath = wishListTV.indexPath(for: cell) else { return }

        wishList.remove(at: indexPath.row)
        wishListTV.deleteRows(at: [indexPath], with: .automatic)
        if wishList.isEmpty {
            wishListTV.showEmptyState(message: "Your wishlist is empty.")
        }
    }


}
    

