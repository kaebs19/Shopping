//
//  SizeAndColorPupuesView.swift
//  Shopping
//
//  Created by Mohammed Saleh on 17/01/2025.
//

import UIKit

protocol SizeAndColorPupuesViewProtocol: NSObjectProtocol {
    func didPressDone(in popup: SizeAndColorPupuesView)
}

enum SelectedSizeAndColor {
    case size
    case color
}

class SizeAndColorPupuesView: UIView {
    
    // MARK: - Outlets
    var sizeTV = UITableView()
    var titleLabel = UILabel()
    var colorTV = UITableView()
    var doneButton = UIButton()
    
    // MARK: - Delegate & Type
    weak var delegate: SizeAndColorPupuesViewProtocol?
    var selectedType: SelectedSizeAndColor = .size
    
    // MARK: - بيانات وهمية (أمثلة)
    var sizesList = [
        Size(name: Libs.XSmall.textLib, isSelected: false),
        Size(name: Libs.Small.textLib, isSelected: false),
        Size(name: Libs.Medium.textLib, isSelected: false),
        Size(name: Libs.Large.textLib, isSelected: false),
        Size(name: Libs.Oversize.textLib, isSelected: false)
    ]
    
    var colorList = [
        Color(name: Libs.Black.textLib, isSelected: false, colorValue: .black),
        Color(name: Libs.White.textLib, isSelected: false, colorValue: .white),
        Color(name: Libs.Red.textLib, isSelected: false, colorValue: .red),
        Color(name: Libs.Grey.textLib, isSelected: false, colorValue: .gray)
    ]
    
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    
}

// MARK: - Public Methods
extension SizeAndColorPupuesView {
    
    func setupUI() {
        titleLabel.customLabel(text: Libs.Size.textLib, color: .C000000, size: .size_20 , typeFont: .semibold)
        sizeTV.tag = 0
        colorTV.tag = 1
        
        switch selectedType {
            case .size:
                titleLabel.text = Libs.Size.textLib
                colorTV.isHidden = true
                sizeTV.isHidden = false
            case .color:
                titleLabel.text = Libs.Color.textLib
                colorTV.isHidden = false
                sizeTV.isHidden = true
        }
        
        setupTableViews([sizeTV , colorTV])
        setupViewUI()
    }
    
    func setupViewUI() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
        backgroundColor = .white
        
        // إضافة الظل
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        
        addSubview(titleLabel)
        addSubview(sizeTV)
        addSubview(colorTV)
        addSubview(doneButton)

        //addSubviews(titleLabel , sizeTV , colorTV , doneButton)

        // title
        titleLabel.textAlignment = .center
        titleLabel.text = Libs.Size.textLib
        // Done
        doneButton.setTitle(isEnglish() ? "Done": "تم التحديد" , for: .normal)
        doneButton.backgroundColor = Colors.C00CBFF.uiColor
        doneButton.addRadius(cornerRadius: 8)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)        
        UIView.disableAutoresizingMask(for: titleLabel , sizeTV , colorTV , doneButton)
        // إضافة القيود
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor , constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -24),
        ])
        
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -24),
            doneButton.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 24),
            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -24),
            doneButton.heightAnchor.constraint(equalToConstant: 55)
            ])
        
        NSLayoutConstraint.activate([
            sizeTV.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: 5),
            sizeTV.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 5),
            sizeTV.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -5),
            sizeTV.bottomAnchor.constraint(equalTo: doneButton.topAnchor , constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            colorTV.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            colorTV.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 5),
            colorTV.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -5),
            colorTV.bottomAnchor.constraint(equalTo: doneButton.topAnchor , constant: -20)
            
        ])
    }
    
    func setupTableViews(_ tvs: [UITableView]) {
        tvs.forEach { tv in
            
            switch tv.tag {
                case 0: tv.configureTableView(cellName: .SizesPupuesTVCells , delgate: self , dataSoucre: self)
                default :   tv.configureTableView(cellName: .ColorsPupuesTVCells , delgate: self , dataSoucre: self)
            }
            tv.hideScrollTableView(hide: true)
            tv.configureSeparator(inset: 0, style: .none)
            tv.isUserInteractionEnabled = true  
        }
    }
    
    @objc func doneButtonTapped() {
        delegate?.didPressDone(in: self)
        removeFromSuperview()
    }
    
}


// MARK: - UITableViewDelegate
extension SizeAndColorPupuesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 0 {
            for i in 0..<sizesList.count {
                sizesList[i].isSelected = (i == indexPath.row)
            }
            sizeTV.reloadData()
        } else {
            for i in 0..<colorList.count {
                colorList[i].isSelected = (i == indexPath.row)
            }
            colorTV.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {        
        tableView.tag == 0 ? 40 : 50
    }
    
}

// MARK: - UITableViewDataSource
extension SizeAndColorPupuesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.tag == 0 ? sizesList.count : colorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
            case 0:
                let cell = tableView.dequeueCell(index: indexPath, cellType: SizesPupuesTVCells.self)
                cell.configureCell(cellData: sizesList[indexPath.row])
                return cell
            default :
                let cell = tableView.dequeueCell(index: indexPath, cellType: ColorsPupuesTVCells.self)
                cell.configureCell(cellData: colorList[indexPath.row])
                return cell
        }
    }
    
    
}
