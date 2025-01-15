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
    /// - Parameters:
    ///   - cellName: The UICollectionViewCell type to dequeue.
    ///   - indexPath: The indexPath specifying the location of the cell.
    /// - Returns: A reusable cell of the specified type.
    ///
    /// تستدعي خلية قابلة لإعادة الاستخدام باستخدام معرف محدد.
    /// - المعلمات:
    ///   - cellName: نوع الخلية المراد استدعاؤها.
    ///   - indexPath: الموقع المحدد للخلية.
    /// - الإرجاع: خلية قابلة لإعادة الاستخدام من النوع المحدد.
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


