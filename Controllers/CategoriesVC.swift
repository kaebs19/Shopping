//
//  CategoriesVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 13/01/2025.
//

import UIKit

enum CaategoryType: Int {
    case newArrivals = 0
    case shirtsAndBlouses
    case dresses
    case jeans
}

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
        
        newArrivalsCV.tag = CaategoryType.newArrivals.rawValue
        shirtAndBlousesCV.tag = CaategoryType.shirtsAndBlouses.rawValue
        dressesCV.tag = CaategoryType.dresses.rawValue
        jeansCV.tag = CaategoryType.jeans.rawValue
        let collectionViews = [newArrivalsCV , dressesCV , shirtAndBlousesCV , jeansCV]
        setupCollectionView(CVS: collectionViews.compactMap({ $0 }))
        
        titleLabel.customLabel(text: Libs.Women.textLib, color: .C161616, size: .size_14 ,font: .cairoBold , typeFont: .semibold)
        
        let sectionTitleLabelsAndTexts = [
            (newArrivalsLabel, Libs.NewArrivals.textLib) , (shirtAndBlousesLabel, Libs.ShirtAndBlouses.textLib) , (dressesLabel, Libs.Dresses.textLib) , (jeansLabel, Libs.Jeans.textLib)
        ]
        sectionTitleLabelsAndTexts.forEach { (lable , text) in
            lable?.customLabel(text: text, color: .C161616, size: .size_14 , font: .cairoBold , typeFont: .regular)
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
        
        guard let categoryType = CaategoryType(rawValue: collectionView.tag) else { return }
        let storyboard = UIStoryboard(name: Storyboards.TabBars.rawValue , bundle: nil)
        if let detalsVc = storyboard.instantiateViewController(withIdentifier: Identifiers.CategoriesDetalsVC.rawValue) as? CategoriesDetalsVC {
            
            switch categoryType {
                    
                case .newArrivals:
                    detalsVc.selectedCategoryTitle = Libs.NewArrivals.rawValue
                case .shirtsAndBlouses:
                    detalsVc.selectedCategoryTitle = Libs.ShirtAndBlouses.rawValue
                case .dresses:
                    detalsVc.selectedCategoryTitle = Libs.Dresses.rawValue
                case .jeans:
                    detalsVc.selectedCategoryTitle = Libs.Jeans.rawValue
            }
            
            self.navigationController?.pushViewController(detalsVc, animated: true)
        }
    }
    
}

// MARK: - UITableViewDataSource
extension CategoriesVC: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let categoryType = CaategoryType(rawValue: collectionView.tag) else { return 0 }
        
        switch categoryType {
            case .newArrivals:
                return newArrivalsList.count
            case .shirtsAndBlouses:
                return shirtAndBlousesList.count
            case .dresses:
                return dressesList.count
            case .jeans:
                return jeansList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let categoryType = CaategoryType(rawValue: collectionView.tag) else { return UICollectionViewCell() }
        let cell = collectionView.dequeue(cellType: CategoriesCVCells.self, for: indexPath)
        let data: Categories
        
        switch categoryType {
                
            case .newArrivals:
                data = newArrivalsList[indexPath.row]
            case .shirtsAndBlouses:
                data = shirtAndBlousesList[indexPath.row]
            case .dresses:
                data = dressesList[indexPath.row]
            case .jeans:
                data = jeansList[indexPath.row]
        }
        
        cell.configureCell(cellData: data)
        return cell
    }
    
    
}

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let categoryType = CaategoryType(rawValue: collectionView.tag) else { return .zero }
        
        switch categoryType {
                
            case .newArrivals , .shirtsAndBlouses ,  .dresses,  .jeans:
                let numberOfCells: CGFloat = 4
                let spacing: CGFloat = 24
                let collectionViewWidth = collectionView.bounds.width
                // المساحة المتاحة للخلايا بعد خصم المسافات
                let availableWidth = collectionViewWidth - (numberOfCells - 1) * spacing
                // عرض الخلية
                let cellWidth = availableWidth / numberOfCells
                // ارتفاع الخلية ثابت (94)
                let cellHeight: CGFloat = 94
                return CGSize(width: cellWidth, height: cellHeight)
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
