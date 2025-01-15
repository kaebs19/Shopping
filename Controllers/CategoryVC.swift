//
//  CategoryVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 03/01/2025.
//

import UIKit

class CategoryVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTV: UITableView!
    
    
    // MARK: - Variables Arry
    var catrgoryList: [Categories] = [
        Categories(name: Libs.Women.textLib, image: Images.Women.names, background: [.RoseGold , .Lavender]),
        Categories(name: Libs.Men.textLib, image: Images.Men.names, background: [.NavyBlue , .SteelGray]),
        Categories(name: Libs.Kids.textLib, image: Images.Kids.names, background: [.Lemon , .Aqua]),
        Categories(name: Libs.Kids.textLib, image: Images.Kids.names, background: [.Blue , .White])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
}

extension CategoryVC {
    
    func setupUI() {
        customNavigationBar(items: [.MENU , .CART], title: .Categories)
        setupTV(tv: categoryTV)
        categoryLabel.customLabel(text: Libs.catrgories.textLib, color: .C161616, size: .size_20 , font: .cairoMedium , typeFont: .semibold)
    }
    
    func setupTV(tv: UITableView) {
        tv.configureTableView(cellName: .CategoriesTVCell , delgate: self , dataSoucre: self)
        tv.configureSeparator(inset: 0, style: .none)
        tv.hideScrollTableView(hide: true)
        tv.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    
}

// MARK: - UITableViewDelegate

extension CategoryVC: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                print("Done pressed in \(indexPath.row)")
                gotToNextVC(identifier: .CategoriesVC)
            case 1:
                print("Done pressed in \(indexPath.row)")
            case 2:
                print("Done pressed in \(indexPath.row)")
            default:
                print("Done pressed in \(indexPath.row)")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 167
    }
    
}

extension CategoryVC: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catrgoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(index: indexPath, cellType: CategoriesTVCell.self)
        cell.configureCell(cellData: catrgoryList[indexPath.row])
        return cell
    }
    
    
}
