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
        FAQ(question: "\(Libs.Question.textLib) 1", answer: "\(Libs.Answer.textLib) 1", isExpanded: false, answerNumber: 1),
        FAQ(question: "\(Libs.Question.textLib) 2", answer: "Answer 2 Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2Answer 2", isExpanded: false, answerNumber: 2) ,
        FAQ(question: "\(Libs.Question.textLib) 3", answer: "\(Libs.Answer.textLib) 3", isExpanded: false, answerNumber: 3),
        FAQ(question: "\(Libs.Question.textLib) 4", answer: "\(Libs.Answer.textLib) 4", isExpanded: false, answerNumber: 4)

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
        customNavigationBar(items: [.MENU , .CART], title: .none)
        titleLabel.customLabel(text: Libs.FAQ.textLib, color: .C161616, size: .size_20 , font: .cairoBold)
        setupTableView(tv: faqTV)
    }
    
    private func setupTableView(tv: UITableView) {
        tv.configureTableView(cellName: .FAQTVCell , delgate: self , dataSoucre: self)
        tv.hideScrollTableView()
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 130
        tv.separatorStyle = .none
        tv.animateSequentially()
    }
}


// MARK: - UITableViewDelegate
extension FAQVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        faqsList[indexPath.row].isExpanded = !faqsList[indexPath.row].isExpanded
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // return faqsList[indexPath.row].isExpanded ?  UITableView.automaticDimension : 60
    
        return UITableView.automaticDimension
    }
    
}


// MARK: - UITableViewDataSource
extension FAQVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(index: indexPath, cellType: FAQTVCell.self)
        cell.configuraCell(with: faqsList[indexPath.row])
        return cell
    }
    
}
