//
//  CollectionView+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 03/01/2025.
//

import Foundation
import UIKit



extension UICollectionView {
    
    /// تغيير اتجاه التمرير لـ UICollectionView.
    /// - Parameter direction: الاتجاه المطلوب (أفقي أو رأسي).
    func setScrollDirecton(_ direction: UICollectionView.ScrollDirection) {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = direction
        }
    }
    
    /// Registers a UICollectionViewCell using a nib file and sets the delegate and dataSource.
    /// تقوم بتسجيل خلية UICollectionView باستخدام ملف nib وتعيين الـ delegate و dataSource.
    
    func configureCVCell<Cell: UICollectionViewCell>(
        cell: Cell.Type,
        delegate: UICollectionViewDelegate,
        dataSource: UICollectionViewDataSource
    ) {
        let nibName = String(describing: Cell.self)
        self.delegate = delegate
        self.dataSource = dataSource
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    /// Registers a UICollectionViewCell using a nib file without setting the delegate and dataSource.
    /// - Parameter cell: The UICollectionViewCell type to register.
    ///
    /// تقوم بتسجيل خلية UICollectionView باستخدام ملف nib بدون تعيين delegate أو dataSource.
    /// - المعلمة:
    ///   - cell: نوع الخلية المراد تسجيلها.
    func register<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    /// Registers a UICollectionViewCell using class type without a nib file.
    /// - Parameter cell: The UICollectionViewCell type to register.
    ///
    /// تقوم بتسجيل خلية UICollectionView باستخدام النوع مباشرة بدون ملف nib.
    /// - المعلمة:
    ///   - cell: نوع الخلية المراد تسجيلها.
    func registerClass<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let cellName = String(describing: Cell.self)
        self.register(Cell.self, forCellWithReuseIdentifier: cellName)
    }
    
    /// تفعيل أو تعطيل التمرير في UICollectionView.
    func hideScrollIndicators(hideHorizontal: Bool = true , hideVertical: Bool = true) {
        self.showsVerticalScrollIndicator = !hideVertical
        self.showsHorizontalScrollIndicator = !hideHorizontal
    }
    
    /// تفعيل أو تعطيل التمرير باللمس.
    /// - Parameter isEnabled: تفعيل التمرير باللمس إذا كان `true`، وتعطيله إذا كان `false`.
    func enableScrollByTouch(_ isEnabled: Bool) {
        self.isScrollEnabled = isEnabled
    }
    
    /// تفعيل أو تعطيل التمرير باللمس السريع.
    /// - Parameter isEnabled: تفعيل التمرير باللمس السريع إذا كان `true`، وتعطيله إذا كان `false`.
    func enableFastScrollByTouch(_ isEnabled: Bool) {
        self.decelerationRate = isEnabled ? .fast : .normal
    }
    
    
    /// تحديث البيانات مع إمكانية إضافة تأثيرات مرئية.
    /// - Parameter completion: كتلة الإغلاق التي يتم تنفيذها بعد انتهاء التحديث.
    func reloadDataWithAnimation(completion: (() -> Void)? = nil) {
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.reloadData()
        }, completion: { _ in
            completion?()
        })
    }
    
    /// إعادة تحميل خلية معينة.
    /// - Parameter indexPath: موقع الخلية المراد إعادة تحميلها.
    func reloadItem(at indexPath: IndexPath) {
        self.reloadItems(at: [indexPath])
    }
    
    
    /// Dequeues a reusable UICollectionViewCell with a specified identifier.
    /// تستدعي خلية قابلة لإعادة الاستخدام باستخدام معرف محدد.
    func dequeue<T: UICollectionViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(identifier)")
        }
        return cell
    }
    
    /// Adjusts the direction of the collection view based on the app language.
    /// تقوم بضبط اتجاه UICollectionView تلقائيًا بناءً على لغة التطبيق.
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        // Set direction based on language
        if isEnglish() {
            self.semanticContentAttribute = .forceLeftToRight
            self.transform = CGAffineTransform.identity
        } else {
            self.semanticContentAttribute = .forceRightToLeft
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    
    
}

extension UICollectionViewCell {
    /// تأثير الاهتزاز (Shake Animation)
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        self.layer.add(animation, forKey: "shake")
    }
    
    /// تأثير التكبير (Scale Animation)
    func scaleAnimation() {
        UIView.animate(withDuration: 0.2, animations: {
            self.self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.self.transform = CGAffineTransform.identity
            }
        }
    }
    
    ///تأثير التلاشي (Fade Animation)
    func fadeIn(alpha: CGFloat = 0.0 , duration: TimeInterval = 1) {
        self.alpha = alpha
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }
    ///تأثير الظل (Shadow Effect)
    func applyShadow(color: UIColor = .lightGray , opacity: Float = 0.5 , shadowRadius: CGFloat = 4) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = false
    }
    func removeShadowCVCell() {
        self.layer.shadowColor = nil
        self.layer.shadowOpacity = 0
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 0
    }

    
}

extension UICollectionViewFlowLayout {
    
    /// Automatically flips the layout direction based on the current app language.
    /// تقوم بعكس اتجاه التخطيط تلقائيًا بناءً على لغة التطبيق.
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return isEnglish() ? false : true
    }
    
    /// ضبط المسافات بين الخلايا.
    /// - Parameters:
    ///   - spacing: المسافة بين الخلايا.
    ///   - direction: اتجاه التخطيط (أفقي أو رأسي).
    func setItemSpacing(_ spacing: CGFloat, direction: UICollectionView.ScrollDirection) {
        self.minimumLineSpacing = spacing
        self.minimumInteritemSpacing = spacing
        self.scrollDirection = direction
    }
    
    /// ضبط حجم الخلايا.
    /// - Parameter size: الحجم المطلوب للخلايا.
    func setItemSize(_ size: CGSize) {
        self.itemSize = size
    }
    
    
}


