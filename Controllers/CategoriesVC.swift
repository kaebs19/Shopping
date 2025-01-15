//
//  CategoriesVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 13/01/2025.
//

import UIKit

class CategoriesVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var newArrivalsCV: UICollectionView!
    @IBOutlet weak var dressesCV: UICollectionView!
    @IBOutlet weak var shirtAndBlousesCV: UICollectionView!
    @IBOutlet weak var jeansCV: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newArrivalsLabel: UILabel!
    @IBOutlet weak var dressesLabel: UILabel!
    @IBOutlet weak var shirtAndBlousesLabel: UILabel!
    @IBOutlet weak var jeansLabel: UILabel!
    
    // MARK: - Variables - Arry
    
    var newArrivalsList: [Categories] = [
        .init(name: "Puff-sleeved Dress", image: "Product_N_1", background: [.Background]),
        .init(name: "Rib-knit Sweater", image: "Product_N_2", background: [.Background]),
        .init(name: "Hoodie", image: "Product_N_3", background: [.Background]),
        .init(name: "Faux Fur Jacket", image: "Product_N_4", background: [.Background]),
    ]
    
    var dressesList: [Categories] = [
        .init(name: "Puff-sleeved Dress", image: "Product_D_1", background: [.Background]),
        .init(name: "Rib-knit Sweater", image: "Product_D_2", background: [.Background]),
        .init(name: "Hoodie", image: "Product_D_3", background: [.Background]),
        .init(name: "Faux Fur Jacket", image: "Product_D_4", background: [.Background]),
    ]
    
    var shirtAndBlousesList: [Categories] = [
        .init(name: "Puff-sleeved Dress", image: "Product_S_1", background: [.Background]),
        .init(name: "Rib-knit Sweater", image: "Product_S_2", background: [.Background]),
        .init(name: "Hoodie", image: "Product_S_3", background: [.Background]),
        .init(name: "Faux Fur Jacket", image: "Product_S_4", background: [.Background]),
    ]
    
    var jeansList: [Categories] = [
        .init(name: "Puff-sleeved Dress", image: "Product_J_1", background: [.Background]),
        .init(name: "Rib-knit Sweater", image: "Product_J_2", background: [.Background]),
        .init(name: "Hoodie", image: "Product_J_3", background: [.Background]),
        .init(name: "Faux Fur Jacket", image: "Product_J_4", background: [.Background]),
    ]
    
    // MARK: - UI Setup
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hideOrShowTabBar(hide: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //hideOrShowTabBar(hide: false)
    }
    
    // MARK: - Actions
    
    
}

extension CategoriesVC {
    func setupUI() {
        customNavigationBar(items: [.BACK , .CART , .FLITER], title: .Categories)
        
        let collectuonViews = [newArrivalsCV , dressesCV , shirtAndBlousesCV , jeansCV]
        for (index , collectionView) in collectuonViews.enumerated() { collectionView?.tag = index }
        setupCollectionView(CVS: collectuonViews.compactMap{$0})
        titleLabel.customLabel(text: Libs.Women.textLib, color: .C161616, size: .size_14 ,font: .cairoBold , typeFont: .semibold)
        
        let lableAndText = [
            (newArrivalsLabel, Libs.NewArrivals.textLib) , (shirtAndBlousesLabel, Libs.ShirtAndBlouses.textLib) , (dressesLabel, Libs.Dresses.textLib) , (jeansLabel, Libs.Jeans.textLib)
        ]
        lableAndText.forEach { (lable , text) in
            lable?.customLabel(text: text, color: .C161616, size: .size_14 , font: .cairoLight , typeFont: .semibold)
        }
        
        
    }
    
    /// setup collection Views
    func setupCollectionView(CVS: [UICollectionView]) {
        CVS.forEach { cv in
            switch cv.tag {
                case 0 , 1 , 2 , 3:
                    cv.configureCVCell(cell: CategoriesCVCells.self, delegate: self, dataSource: self)
                default:
                    print("No Collection View Found")
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension CategoriesVC: UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: Storyboards.TabBars.rawValue , bundle: nil)
        if let detalsVc = storyboard.instantiateViewController(withIdentifier: Identifiers.CategoriesDetalsVC.rawValue) as? CategoriesDetalsVC {
            switch collectionView.tag {
                case 0:
                    detalsVc.selectedCategoryTitle = Libs.NewArrivals.rawValue
                    
                case 1:
                    detalsVc.selectedCategoryTitle = Libs.Dresses.rawValue
                case 2:
                    detalsVc.selectedCategoryTitle = Libs.ShirtAndBlouses.rawValue
                case 3:
                    detalsVc.selectedCategoryTitle = Libs.Jeans.rawValue
                default:
                    detalsVc.selectedCategoryTitle = "Unknown Category"
            }
            self.navigationController?.pushViewController(detalsVc, animated: true)
        }
    }
    
}

// MARK: - UITableViewDataSource
extension CategoriesVC: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
            case 0:
                return newArrivalsList.count
            case 1:
                return shirtAndBlousesList.count
            case 2:
                return dressesList.count
            case 3:
                return jeansList.count
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
            case 0 , 1 , 2 , 3 :
                let cell = collectionView.dequeue(cellType: CategoriesCVCells.self, for: indexPath)
                return cell
            default:
                return UICollectionViewCell()
        }
        
    }
    
    
}

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells: CGFloat = 4
        let spacing: CGFloat = 24
        let collectionViewWidth = collectionView.bounds.width
        // المساحة المتاحة للخلايا بعد خصم المسافات
        let availableWidth = collectionViewWidth - (numberOfCells - 1) * spacing
        // عرض الخلية
        let cellWidth = availableWidth / numberOfCells
        // ارتفاع الخلية ثابت (94)
        let cellHeight: CGFloat = 94
        
        switch collectionView.tag {
            case 0, 1 , 2 , 3:
                return CGSize(width: cellWidth, height: cellHeight)
            default :
                return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
            case 0 ,1 , 2 , 3:
                return 24 // المسافة بين الخلايا
            default:
                return 24
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
            case 0 ,1 , 2 , 3:
                return 24 // المسافة بين الخلايا
            default:
                return 24
        }
        
    }
}
