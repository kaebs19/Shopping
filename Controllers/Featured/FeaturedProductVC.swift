//
//  FeaturedProductVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 03/01/2025.
//

import UIKit

class FeaturedProductVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleProductLabel: UILabel!
    @IBOutlet weak var featuredCV: UICollectionView!
    
    // MARK: - Variables - Arry
    var featuredProductsList: [FeaturedProducts] = [
        FeaturedProducts(featuredName: "Red Overalls", featuredImage: "Product_5", featuredPrice: "$39", isDiscount: false, isSalde: false, backgroundColor: ColorsBackground.CFF8188.rawValue),
        FeaturedProducts(featuredName: "Pink Fur Coat", featuredImage: "Product_7", featuredPrice: "$80", isDiscount: false, isSalde: true, backgroundColor: ColorsBackground.SunsetOrange.rawValue , discountAmount: "$59"),
        FeaturedProducts(featuredName: "Red Overalls", featuredImage: "Product_6", featuredPrice: "$83", isDiscount: false, isSalde: false, backgroundColor: ColorsBackground.CFFE68F.rawValue),
        FeaturedProducts(featuredName: "Red Overalls", featuredImage: "Product_8", featuredPrice: "$51", isDiscount: false, isSalde: true, backgroundColor: ColorsBackground.C6CB0FE.rawValue  , discountAmount: "$69") ,
        FeaturedProducts(featuredName: "Red Overalls", featuredImage: "Product_8", featuredPrice: "$100", isDiscount: false, isSalde: true, backgroundColor: ColorsBackground.CFFE68F.rawValue  , discountAmount: "$20") ,
        FeaturedProducts(featuredName: "Red Overalls", featuredImage: "Product_8", featuredPrice: "$80", isDiscount: false, isSalde: true, backgroundColor: ColorsBackground.CFFE68F.rawValue  , discountAmount: "$5")
        
    ]
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideOrShowTabBar(hide: false)
    }
    
    
}

extension FeaturedProductVC {
    
    // MARK: - UI Setup
    func setupUI() {
        customNavigationBar(items: [.MENU , .FLITER , .CART ], title: .Featured)
        titleProductLabel.customLabel(text: Titles.Featured.rawValue.localized, color: .C161616, size: .size_20 , font: .cairoBold, typeFont: .semibold)
        setupCollecctionView(cv: featuredCV)
    }
    
    func setupCollecctionView(cv: UICollectionView) {
        cv.setScrollDirecton(.vertical)
        cv.configureCVCell(cell: FeaturedCVCell.self, delegate: self, dataSource: self)
        cv.hideScrollIndicators()
    }
}

// MARK: - CollectionViewDelegate
extension FeaturedProductVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        switch indexPath.row {
                case 0:
                gotToNextVC(identifier: .ProductsVC)
            default:
                print(" Didn't select any")
        }
        
    }
}

// MARK: - CollectionViewDataSource
extension FeaturedProductVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredProductsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellType: FeaturedCVCell.self, for: indexPath)
        cell.configureCell(cellData: featuredProductsList[indexPath.row])
        return cell
    }
    
}

extension FeaturedProductVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCell: CGFloat = 2
        let horizontalSpacing: CGFloat = 38
        let totaHorizontalSpacing: CGFloat = (numberOfCell - 1) * horizontalSpacing
        let availableWidth = collectionView.frame.width
        - collectionView.contentInset.left
        - collectionView.contentInset.right
        - totaHorizontalSpacing
        
        let cellWidth = availableWidth / numberOfCell
        let cellHeight: CGFloat = 270
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 38
    }
    
}
