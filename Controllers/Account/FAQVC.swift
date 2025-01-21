//
//  FAQVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 21/01/2025.
//

import UIKit

class FAQVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var faqTV: UITableView!
    
    // MARK: - Variables - Arry
    var faqsList: [FAQ] = [
        
    ]
    
    // MARK: - UI Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    
}
// MARK: - UI Setup

extension FAQVC {
    private func setupUI() {
        
    }
    
}
