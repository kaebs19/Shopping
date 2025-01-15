//
//  CategoriesDatelsVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 14/01/2025.
//

import UIKit


class CategoriesDetalsVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var productsDatelsCV: UICollectionView!
    @IBOutlet weak var titleLable: UILabel!
    // MARK: - Variables - Arry
    var selectedCategoryTitle: String?
    var currentProducts: [Categories] = []

    var newArrivalsList: [Categories] = [
        .init(name: "Puff-sleeved Dress", image: "Product_N_1", background: [.Background] , price: "$39" , discount: "$59"),
        .init(name: "Rib-knit Sweater", image: "Product_N_2", background: [.Background] , price: "$49"),
        .init(name: "Hoodie", image: "Product_N_3", background: [.Background] , price: "$39" , discount: "$59"),
        .init(name: "Faux Fur Jacket", image: "Product_N_4", background: [.Background] , price: "$49"),
        .init(name: "Puff-sleeved Dress", image: "Product_N_1", background: [.Background] , price: "$39" , discount: "$59"),
        .init(name: "Puff-sleeved Dress", image: "Product_N_1", background: [.Background] , price: "$39" , discount: "$59")
    ]
    
    var dressesList: [Categories] = [
        .init(name: "Puff-sleeved Dress", image: "Product_D_1", background: [.Background] , price: "$49" , discount: "$59"),
        .init(name: "Rib-knit Sweater", image: "Product_D_2", background: [.Background] , price: "$31"),
        .init(name: "Hoodie", image: "Product_D_3", background: [.Background] , price: "$39" , discount: "$59"),
        .init(name: "Faux Fur Jacket", image: "Product_D_4", background: [.Background] , price: "$99")
    ]
    
    var shirtAndBlousesList: [Categories] = [
        .init(name: "Puff-sleeved Dress", image: "Product_S_1", background: [.Background] , price: "$39" , discount: "$59"),
        .init(name: "Rib-knit Sweater", image: "Product_S_2", background: [.Background] , price: "$39"),
        .init(name: "Hoodie", image: "Product_S_3", background: [.Background] , price: "$39" , discount: "$59"),
        .init(name: "Faux Fur Jacket", image: "Product_S_4", background: [.Background] , price: "$19"),
    ]
    
    var jeansList: [Categories] = [
        .init(name: "Puff-sleeved Dress", image: "Product_J_1", background: [.Background] , price: "$39" , discount: "$59"),
        .init(name: "Rib-knit Sweater", image: "Product_J_2", background: [.Background] , price: "$39"),
        .init(name: "Hoodie", image: "Product_J_3", background: [.Background] , price: "$39" , discount: "$59"),
        .init(name: "Faux Fur Jacket", image: "Product_J_4", background: [.Background] , price: "$39"),
    ]

    // MARK: - UI Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    

}

extension CategoriesDetalsVC{
    
    // MARK: - UI Setup
    func setupUI(){
        setupCollectionView(cv: productsDatelsCV)
        self.titleLable.text = selectedCategoryTitle
        customNavigationBar(items: [.BACK , .FLITER , .CART], title: .none)
        
        titleLable.customLabel(text: selectedCategoryTitle?.localized ?? "", color: .C161616, size: .size_20 , font: .cairoBold, typeFont: .semibold)
        
        switch selectedCategoryTitle{
            case Libs.NewArrivals.rawValue:
                currentProducts = newArrivalsList
            case Libs.Dresses.rawValue:
                currentProducts = dressesList
            case Libs.ShirtAndBlouses.rawValue:
                currentProducts = shirtAndBlousesList
            case Libs.Jeans.rawValue:
                currentProducts = jeansList
            default:
                currentProducts = []
        }
        
    }
    
    
    private func setupCollectionView(cv: UICollectionView){
        productsDatelsCV.setScrollDirecton(.vertical)
        productsDatelsCV.configureCVCell(cell: ProductDatelsCVCell.self, delegate: self, dataSource: self)
        productsDatelsCV.hideScrollIndicators(hideHorizontal: true , hideVertical: true)
        productsDatelsCV.enableFastScrollByTouch(true)
        productsDatelsCV.enableScrollByTouch(true)
    }
}

// MARK: - UITableViewDelegate
extension CategoriesDetalsVC: UICollectionViewDelegate{
    
}

// MARK: - UITableViewDataSource
extension CategoriesDetalsVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellType: ProductDatelsCVCell.self, for: indexPath)
        let product = currentProducts[indexPath.row]
        cell.configureCell(cellData: product)
        return cell

    }
}

extension CategoriesDetalsVC: UICollectionViewDelegateFlowLayout {

    // دالة تحديد حجم الخلية
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        //  عنصرين في كل صف
        let numberOfCellsPerRow: CGFloat = 2
        let horizontalSpacing: CGFloat = 38   // المسافة الأفقية بين الخليتين
        // إجمالي المسافة الأفقية (بين العناصر) في الصف الواحد
        let totalHorizontalSpacing = (numberOfCellsPerRow - 1) * horizontalSpacing
        // العرض الصافي المتبقي للخلايا بعد خصم المسافات
        let availableWidth = collectionView.frame.width
                            - collectionView.contentInset.left
                            - collectionView.contentInset.right
                            - totalHorizontalSpacing
        
        // عرض الخلية بقسمة العرض المتبقي على عدد الخلايا المطلوبة
        let cellWidth = availableWidth / numberOfCellsPerRow
        
        // ارتفاع ثابت للخلية حسب التصميم
        let cellHeight: CGFloat = 240
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    // دالة المسافة العمودية بين الأسطر
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24  // المسافة بين الصفوف
    }
    
    // دالة المسافة الأفقية بين الخلايا في نفس الصف
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 38  // المسافة بين الخليتين أفقيًا
    }
}
