//
//  TableView+Extension.swift
//  Shopping
//
//  Created by Mohammed Saleh on 06/01/2025.
//

import Foundation
import UIKit

extension UITableView {
    /// تسجيل خلية في الجدول باستخدام النوع العام.
    /// Register a cell in the table using the generic type.
    func register<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: String(describing: cell))
    }
    
    /// تهيئة الجدول مع تسجيل الخلية وتعيين الـ delegate والـ dataSource.
    /// Configure the table with cell registration, delegate, and dataSource.
    func configureTableView(cellName: TVCells,
                            delgate: UITableViewDelegate? = nil,
                            dataSoucre: UITableViewDataSource? = nil) {
        self.dataSource = dataSoucre
        self.delegate = delgate
        self.register(UINib(nibName: String(describing: cellName.rawValue), bundle: nil), forCellReuseIdentifier: cellName.rawValue)
    }
    
    /// تهيئة الفواصل بين الخلايا مع تحديد المسافات والنمط.
    /// Configure cell separators with insets and style.
    func configureSeparator(inset: CGFloat, style: UITableViewCell.SeparatorStyle) {
        self.separatorInset = UIEdgeInsets(
            top: inset,
            left: inset,
            bottom: inset,
            right: inset)
        self.separatorStyle = style
    }
    
    /// إخفاء أو إظهار مؤشر التمرير العمودي.
    /// Hide or show the vertical scroll indicator.
    func hideScrollTableView(hide: Bool = true) {
        self.showsVerticalScrollIndicator = !hide
        self.showsHorizontalScrollIndicator = !hide
    }
    
    /// إعادة استخدام الخلية باستخدام النوع العام.
    /// Dequeue a reusable cell using the generic type.
    func dequeueCell<T: UITableViewCell>(index: IndexPath, cellType: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: index) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: cellType))")
        }
        return cell
    }
    
    /// إضافة ظل لخلية الجدول.
    /// Adds a shadow to a table view cell.
    func addShadowToCell(cell: UITableViewCell) {
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 4
        cell.layer.masksToBounds = false
    }
    
    /// إضافة رسوم متحركة لظهور الخلايا.
    /// Adds animations to cells when they appear.
    func animateCells() {
        let cells = self.visibleCells
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(index), options: .transitionFlipFromRight, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    /// عرض واجهة فارغة عند عدم وجود بيانات.
    /// Displays an empty state view when no data is available.
    func showEmptyState(message: String) {
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.textColor = .gray
        emptyView.addSubview(messageLabel)
        self.backgroundView = emptyView
    }
}

extension UITableViewCell {
    /// تعيين نمط التحديد للخلية (بدون تحديد بشكل افتراضي).
    /// Set the selection style of the cell (none by default).
    func noSelectionStyleCell(style: UITableViewCell.SelectionStyle = .none) {
        self.selectionStyle = style
    }
}
