//
//  HomeVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 03/01/2025.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var bagdeView: UIView!
    @IBOutlet weak var collectionsLabel: UILabel!
    @IBOutlet weak var collectionCV: UICollectionView!
    @IBOutlet weak var featuredProductsLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var featuredProductsCV: UICollectionView!
    
    
    
    // MARK: - Variables -
    var collectionsList: [Collections] = [
        Collections(name: "Shine With Us", imgage: "HCV_1"),
        Collections(name: "Chic Tops", imgage: "HCV_3"),
        Collections(name: "World of Beauty", imgage: "HCV_4"),
        Collections(name: "Classics", imgage: "HCV_2"),

    ]
    
    var featuredProductsList: [FeaturedProducts] = [
        FeaturedProducts(featuredName: "Red Overalls", featuredImage: "m1", featuredPrice: "$39", isDiscount: false, isSalde: false, backgroundColor: "Background_Sale"),
        FeaturedProducts(featuredName: "Pink Fur Coat", featuredImage: "m2", featuredPrice: "$80", isDiscount: false, isSalde: true, backgroundColor: "Background_DontSale"),
        FeaturedProducts(featuredName: "Red Overalls", featuredImage: "m3", featuredPrice: "$83", isDiscount: false, isSalde: false, backgroundColor: "Background_Sale"),
        FeaturedProducts(featuredName: "Red Overalls", featuredImage: "m4", featuredPrice: "$51", isDiscount: false, isSalde: true, backgroundColor: "Background_Sale")


        ]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

}

extension HomeVC {
    func setupUI() {
        custmeNavigationBar(items: [.MENU , .CART], title: .Home)
        bagdeView.addBoder(color: .C6DCEE7, width: 1)
        bagdeView.addRadius(radius: 6)
        collectionsLabel.customLabel(text: Libs.collections.textLib, color: .C161616, size: .size_20, font: .cairoBold , typeFont: .bold)
        featuredProductsLabel.customLabel(text: Libs.featuredProducts.textLib,  color: .C161616, size: .size_20, font: .cairoBold , typeFont: .bold)
        for more in [moreButton] {
            more?.addBoder(color: .C6DCEE7, width: 1)
            more?.addRadius(radius: 6)
            more?.customButton(text: .more, textColor: .C6DCEE7, ofSize: .size_12, font: .cairoBold, styleFont: .bold )
        }
        
        collectionCV.registerCVNib(cell: CollectionsHomeCVCell.self, delegate: self, dataSource: self)
        featuredProductsCV.registerCVNib(cell: FeaturedProductsHomeCVCell.self, delegate: self, dataSource: self)
    }
    
    
}

extension HomeVC: UICollectionViewDelegate {
    
}

extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
            case 0: return collectionsList.count
            default : return featuredProductsList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
            case 0:
                let cell = collectionView.dequeue(cellType: CollectionsHomeCVCell.self, for: indexPath)
                cell.initData(cellData: collectionsList[indexPath.row])
                return cell
            default:
                let cell = collectionView.dequeue(cellType: FeaturedProductsHomeCVCell.self, for: indexPath)
                cell.initData(cellData: featuredProductsList[indexPath.row])
                return cell
        }
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
            case 0:
                let height = collectionView.bounds.height
                let width = height * 1.5620437956
                print("Width: \(width), Height: \(height)")
                return CGSize(width: width, height: height)
            default:
                // number Of cells In row
                let numberOfCellInRow: CGFloat = 2
                // spacing Between Cells
                let spacing  = (
                    collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
                // value width
                let width = floor(collectionView.bounds.width - spacing * (numberOfCellInRow - 1)) / numberOfCellInRow
                let hight = width * 1.3680555556
                return CGSize(width: width, height: hight)

        }
    }
}
