//
//  CollectionView+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 03/01/2025.
//

import Foundation
import UIKit



extension UICollectionView {
    
    /// Registers a UICollectionViewCell using a nib file and sets the delegate and dataSource.
    /// - Parameters:
    ///   - cell: The UICollectionViewCell type to register.
    ///   - delegate: The object that acts as the delegate for the collection view.
    ///   - dataSource: The object that acts as the data source for the collection view.
    ///
    /// تقوم بتسجيل خلية UICollectionView باستخدام ملف nib وتعيين الـ delegate و dataSource.
    /// - المعلمات:
    ///   - cell: نوع الخلية المراد تسجيلها.
    ///   - delegate: الكائن الذي يعمل كـ delegate للـ UICollectionView.
    ///   - dataSource: الكائن الذي يعمل كـ dataSource للـ UICollectionView.
    func registerCVNib<Cell: UICollectionViewCell>(
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
}
