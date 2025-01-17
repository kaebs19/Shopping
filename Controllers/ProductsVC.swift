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
    @IBOutlet weak var productNameLable: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var backStarView: UIView!
    @IBOutlet  var starImageViews: [UIImageView]!

    
    // MARK: - Properties
    private var currentRating: Double = 0.0 {
        didSet{
            updateRatingStar(for: currentRating)
        }
    }

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
    
    private func showSizeAndColorPopup(type:SelectedSizeAndColor) {

        let dimmedView = UIView(frame: self.view.bounds)
            dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            dimmedView.alpha = 0.0
            dimmedView.tag = 1000
            self.view.addSubview(dimmedView)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        tapGesture.cancelsTouchesInView = false
            dimmedView.addGestureRecognizer(tapGesture)
            
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
    
    func didPressDone(in popup: SizeAndColorPupuesView) {
        
        dismissPopup()
        
        if popup.selectedType == .size {
            print(" User finished size selected . ")
        } else {
            print(" User finished color selected .")
        }
        
    }
    
    
}
