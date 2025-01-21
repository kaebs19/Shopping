//
//  LanguageVC.swift
//  Shopping
//
//  Created by Mohammed Saleh on 20/01/2025.
//

import UIKit

class LanguageVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageTV: UITableView!
    @IBOutlet weak var doneBtn: UIButton!

    
    // MARK: - Variables - Arry
    var languageList: [Languages] = [
        Languages(languageName: .English, isSelected: true) ,
        Languages(languageName: .Arabic, isSelected: false) 
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    

}

// MARK: - UI Setup
extension LanguageVC {
    
    func setup() {
        customNavigationBar(items: [.CART , .MENU], title: .none)
        titleLabel.customLabel(text: Libs.ChangeLanguage.textLib, color: .C161616, size:  .size_20 , font: .cairoBold)
        setupTableView(tv: languageTV)
        doneBtn.customButton(text: .Done, textColor: .CFFFFFF ,backgroundColor: .C00CBFF, ofSize: .size_16, font: .cairoBold, styleFont: .bold)
        doneBtn.addTarget(self, action: #selector(doneBtnTapped), for: .touchUpInside)
        doneBtn.addRadius(cornerRadius: 20)
    }
    
    private func setupTableView(tv: UITableView) {
        tv.configureTableView(cellName: .LanguageTVCell , delgate: self , dataSoucre: self)
        tv.hideScrollTableView()
        tv.configureSeparator(inset: 0, style: .none)
    }
    
    @objc private func doneBtnTapped() {
        print("Done Btn Tapped")
    }
    

}

// MARK: - UITableViewDelegate
extension LanguageVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for (index , _) in languageList.enumerated() {
            languageList[index].isSelected = false
        }
        
        languageList[indexPath.row].isSelected = true
        DispatchQueue.main.async {
            self.languageTV
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


// MARK: - UITableViewDataSource
extension LanguageVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(index: indexPath, cellType: LanguageTVCell.self)
        cell.configureCell(cellData: languageList[indexPath.row])
        return cell
    }
    
}
