//
//  ProductsVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 16/01/2025.
//

import UIKit

class ProductsVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var productNameLable: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var backStarView: UIView!
    @IBOutlet  var starImageViews: [UIImageView]!
    @IBOutlet weak var sizeTitleLabel: UILabel!
    @IBOutlet weak var colorTitleLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var blackAddToBagView: UIView!
    @IBOutlet weak var estimatedDelivery: UILabel!
    @IBOutlet weak var backPayView: UIView!
    @IBOutlet weak var addToBagLabel: UILabel!
    @IBOutlet weak var totleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    
    // MARK: - Properties
    private var currentRating: Double = 0.0 {
        didSet{
            updateRatingStar(for: currentRating)
        }
    }
    
    var delivertyDate = Calendar.current.date(byAdding: .day, value: 5, to: Date())!  // تاريخ بعد 5 أيام من اليوم
    var changeImageFavorite: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    // MARK: - Actions
    @IBAction func displaySizeOptionsPopue(_ sender: UIButton) {
        showSizeAndColorPopup(type: .size)
        print("Display Size Options Popup")
    }
    
    @IBAction func displayColorOptionsPopue(_ sender: UIButton) {
        showSizeAndColorPopup(type: .color)
        print("Display Size Options Popup")
        
    }
    
    @IBAction func addProductToFav(_ sender: UIButton) {
        changeImageFavorite.toggle()
        if changeImageFavorite {
            favoriteButton.setImage(UIImage(named: Images.Favorite.names), for: .normal)
            showMessage(title: Alerts.FavoritesUpdateTitle.texts, message: Alerts.AddedFavoritesList.texts, thme: .success)
            
        } else {
            favoriteButton.setImage(UIImage(named: Images.FavoriteUnSelected.names), for: .normal)
            showMessage(title: Alerts.FavoritesUpdateTitle.texts, message: Alerts.RemovedFavoritesList.texts, thme: .error)
        }
        
    }
    
    @IBAction func addToBagButtonTapped(_ sender: UIButton) {
        // TODO اضافة منتج الي قائمة المشتريات
    }
}



// MARK: - Setup UI
extension ProductsVC {
    
    func setupUI() {
        hideOrShowTabBar()
        customNavigationBar(items: [.BACK , .FAVORITE], title: .none)
        mainView.addRadius(radius: 20)
        // عرض تقييم افتراضي
        updateRatingStar(for: 4.1)
        setupStarGesture()
        let titles = [Libs.Size.textLib , Libs.Color.textLib]
        let lables = [sizeTitleLabel , colorTitleLabel]
        lables.enumerated().forEach { inext , label in
            label?.customLabel(text: titles[inext], color: .C161616, size: .size_16 , typeFont: .semibold)}
        sizeLabel.text =  isEnglish() ? "Select size" : "حدد مقاس"
        colorLabel.text = isEnglish() ? "Select color" : "حدد لون"
        estimatedDelivery.setDeliveryDate(prefix: Libs.EstimatedDelivery.textLib, date: delivertyDate, color: .C161616, size: .size_12)
        backPayView.addMaskCorners(radius: 20, corners: [.topLeftCorner , .topRightCorner])
        [blackAddToBagView].forEach { pay in
            pay?.addRadius(radius: 6)
            pay?.addBorder(color: .CFFFFFF, width: 1)
            pay?.backgroundColor = .clear
        }
        addToBagLabel.customLabel(text: Libs.addToBag.textLib, color: .CFFFFFF, size: .size_14 , typeFont: .semibold)
        totleLabel.customLabel(text: Libs.Totle.textLib, color: .CFFFFFF, size: .size_14 )
        priceLabel.customLabel(text: "$39,90", color: .CFFFFFF, size: .size_20 , typeFont: .semibold)
    }
    
    
    
    func setupStarGesture() {
        starImageViews.enumerated().forEach { index , star in
            star.tag = index
            star.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(starTapped(_:)))
            star.addGestureRecognizer(tapGesture)
        }
    }
    
    private func updateRatingStar(for rating: Double) {
        let fullStars = Int(rating)
        let remainder = rating - Double(fullStars)
        starImageViews.enumerated().forEach { index , star in
            star.image = imageForStar(at: index, fillStar: fullStars, remainder: remainder)
        }
        ratingLabel.text = "\(rating)"
    }
    
    private func imageForStar(at index: Int , fillStar: Int , remainder: Double) -> UIImage? {
        if index < fillStar {
            return UIImage(named: Images.Fill_Star.names)
        } else if index == fillStar && remainder >= 0.5 {
            return UIImage(named: Images.Half_Star.names)
        } else {
            return UIImage(named: Images.Empty_Star.names)
        }
    }
    // MARK: - Actions
    
    @objc func starTapped(_ gesture: UITapGestureRecognizer) {
        guard let star = gesture.view else { return }
        let newRating = star.tag + 1
        updateRatingStar(for: Double(newRating))
    }
    
    private func showSizeAndColorPopup(type: SelectedSizeAndColor) {
        let dimmedView = UIView(frame: self.view.bounds)
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        dimmedView.alpha = 0.0
        dimmedView.tag = 1000
        self.view.addSubview(dimmedView)
        
        // التغيير هنا: إضافة UITapGestureRecognizer مع تعيين cancelsTouchesInView = false
        //            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        //            tapGesture.cancelsTouchesInView = false // هذا السطر يمنع إلغاء اللمسات الأخرى
        //            dimmedView.addGestureRecognizer(tapGesture)
        
        let popupWidth: CGFloat = self.view.bounds.width
        let popupHeight: CGFloat = 450
        let popupFrame = CGRect(x: 0, y: self.view.bounds.height, width: popupWidth, height: popupHeight)
        let popup = SizeAndColorPupuesView(frame: popupFrame)
        
        popup.selectedType = type
        popup.delegate = self
        popup.setupUI()
        dimmedView.addSubview(popup)
        UIView.animate(withDuration: 0.5, animations: {
            dimmedView.alpha = 1.0
            popup.frame.origin.y = self.view.bounds.height - popupHeight
        })
    }
    
    @objc func dismissPopup() {
        if let dimmedView = self.view.viewWithTag(1000) {
            UIView.animate(withDuration: 0.5, animations: {
                dimmedView.alpha = 0.0
                if let popup = dimmedView.subviews.first(where: { $0 is SizeAndColorPupuesView }) {
                    popup.frame.origin.y = self.view.bounds.height
                }
            }, completion: { _ in
                dimmedView.removeFromSuperview()
            })
        }
    }
    
}

extension ProductsVC: SizeAndColorPupuesViewProtocol {
    
    func didPressDone(in popup: SizeAndColorPupuesView , selectedSize: String? , selectedColor: String?) {
        
        if let size = selectedSize {
            sizeLabel.text =  "\(size)"
        }
        if let  color = selectedColor {
            colorLabel.text =  "\(color)"
        }
        
        
        dismissPopup()
        
        if popup.selectedType == .size {
            print(" User finished size selected . ")
        } else {
            print(" User finished color selected .")
        }
        
    }
    
    
}
