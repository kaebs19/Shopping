import UIKit

// MARK: - بروتوكول يخبر الـPaymentVC عند الضغط على زرّ DONE
protocol BagsPouesViewDelegate: AnyObject {
    func didPressDone(in popup: BagsPouesView)
}

// MARK: - نوع النافذة (عناوين أو طرق شحن)
enum PopupType {
    case address
    case method
}

class BagsPouesView: UIView {
    
    // MARK: - UI Elements
    var titleLabel = UILabel()
    var addressTV = UITableView()
    var methodTV = UITableView()
    var doneButton = UIButton()
    
    // MARK: - Delegate & Type
    weak var delegate: BagsPouesViewDelegate?
    var popupType: PopupType = .address  // القيمة الافتراضية
    
    // MARK: - بيانات وهمية (أمثلة)
    var AddressList: [Popues] = [
        Popues(title: "Home: 4043 Willis Avenue, TRAPPER CREEK, 99638", image: Images.Select_Object.names, isDefault: true),
        Popues(title: "Work: 1923 Meadowbrook Mall Road, Gardena, CA, 90248", image: Images.Unselected_Object.names, isDefault: false),
        Popues(title: "Home: 4043 Willis Avenue, TRAPPER CREEK, 3453", image: Images.Unselected_Object.names, isDefault: false)
    ]
    var MethodList: [Popues] = [
        Popues(title: "China Post Air Mail", image: Images.Select_Object.names, isDefault: true,  logo: Images.china_post.names),
        Popues(title: "DHL",                  image: Images.Unselected_Object.names, isDefault: false, logo: Images.Dhl.names),
        Popues(title: "Fedex",                image: Images.Unselected_Object.names, isDefault: false, logo: Images.Fedex.names)
    ]
    
 
}

// MARK: - Public Methods
extension BagsPouesView {
    
    /// تهيئة الـBagsPouesView وضبط ما يُعرض (addressTV أو methodTV)
    func setup() {
        // تعيين بعض الخصائص الأولية للعنوان
        titleLabel.customLabel(text: Libs.ShippingAdress.textLib, color: .C161616, size: .size_20, font: .cairoBold, typeFont: .bold)
        
        // استخدام الـtag للتمييز بين الجدولين
        addressTV.tag = 0
        methodTV.tag = 1

        // بناءً على نوع الـpopup نعرض جدول العناوين أو طرق الشحن
        switch popupType {
        case .address:
                titleLabel.text = Libs.ShippingAdress.textLib
            addressTV.isHidden = false
            methodTV.isHidden = true
        case .method:
                titleLabel.text = Libs.ShppingMethod.textLib
            addressTV.isHidden = true
            methodTV.isHidden = false
        }
        
        // تسجيل الخلايا والتفويض
        setupTableViews([addressTV, methodTV])
        
        // تنسيق الواجهة وإضافة الـSubviews
        setupViewUI()
    }
    
    /// تهيئة الـUI (الألوان، الأزرار، القيود)
    func setupViewUI() {
        // خلفية وحواف
        backgroundColor = .white
        layer.cornerRadius = 12
        clipsToBounds = true
        
        // إضافة الـSubviews
        addSubview(titleLabel)
        addSubview(addressTV)
        addSubview(methodTV)
        addSubview(doneButton)

        // تنسيق العنوان
        titleLabel.textAlignment = .center
        // افتراضيًا
        titleLabel.text = Libs.ShippingAdress.textLib
        
        // تنسيق زرّ Done
        doneButton.setTitle(isEnglish() ? "Done" : "تحديد", for: .normal)
        doneButton.backgroundColor = .systemBlue
        doneButton.layer.cornerRadius = 8
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        
        // تفعيل AutoLayout على جميع العناصر
        titleLabel.translatesAutoresizingMaskIntoConstraints  = false
        addressTV.translatesAutoresizingMaskIntoConstraints    = false
        methodTV.translatesAutoresizingMaskIntoConstraints     = false
        doneButton.translatesAutoresizingMaskIntoConstraints   = false
        
        // إضافة القيود
        NSLayoutConstraint.activate([
            // العنوان
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // جدول العناوين
            addressTV.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            addressTV.leadingAnchor.constraint(equalTo: leadingAnchor),
            addressTV.trailingAnchor.constraint(equalTo: trailingAnchor),
            addressTV.heightAnchor.constraint(equalToConstant: 150),  // يمكنك تغيير الارتفاع
            
            // جدول الشحن
            methodTV.topAnchor.constraint(equalTo: addressTV.bottomAnchor, constant: 8),
            methodTV.leadingAnchor.constraint(equalTo: leadingAnchor),
            methodTV.trailingAnchor.constraint(equalTo: trailingAnchor),
            methodTV.heightAnchor.constraint(equalToConstant: 200),
            
            // زرّ DONE
            doneButton.topAnchor.constraint(equalTo: methodTV.bottomAnchor, constant: 16),
            doneButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            doneButton.widthAnchor.constraint(equalToConstant: 120),
            doneButton.heightAnchor.constraint(equalToConstant: 44),
            doneButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        // ظل بسيط لـPopup
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset  = CGSize(width: 0, height: 2)
        layer.shadowRadius  = 5
    }

    /// تسجيل الخلايا وإعداد الـTableView
    func setupTableViews(_ tvs: [UITableView]) {
        tvs.forEach { tv in
            switch tv.tag {
            case 0: // address table
                tv.configureTableView(cellName: .AddressPopueTVCells, delgate: self, dataSoucre: self)
            default: // method table
                tv.configureTableView(cellName: .MethodPopueTVCells, delgate: self, dataSoucre: self)
            }
            tv.separatorStyle = .none
            tv.backgroundColor = .clear
        }
    }

    /// استجابة لزرّ DONE
    @objc private func doneButtonTapped() {
        delegate?.didPressDone(in: self)
    }
}

// MARK: - UITableViewDelegate
extension BagsPouesView: UITableViewDelegate  {
    
    /// تحديد ارتفاع الصف
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 0 {
            // خلية العناوين
            return 50
        } else {
            // خلية شركات الشحن
            return 100
        }
    }
}

// MARK: - UITableViewDataSource
extension BagsPouesView: UITableViewDataSource  {
    /// عدد الصفوف
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView.tag == 0 ? AddressList.count : MethodList.count
    }
    
    /// محتوى الخلية
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView.tag == 0 {
            // خلية العناوين
            let cell = tableView.dequeueCell(index: indexPath, cellType: AddressPopueTVCells.self)
            cell.configurCell(cellData: AddressList[indexPath.row])
            cell.delegate = self
            return cell
        } else {
            // خلية الشركات
            let cell = tableView.dequeueCell(index: indexPath, cellType: MethodPopueTVCells.self)
            cell.configureCell(cellData: MethodList[indexPath.row])
            cell.delegate = self
            return cell
        }
    }
}

// MARK: - MethodPopueTVCellsProtocol
extension BagsPouesView: MethodPopueTVCellsProtocol {
    /// استجابة لاختيار (أو ضغط على زرّ) في خلية طرق الشحن
    func selectMethodButtonClicked(index: Int) {
        print("Method index selected: \(index)")
    }
}

// MARK: - AAddressPopueTVCellsProtocol
extension BagsPouesView: AAddressPopueTVCellsProtocol {
    /// استجابة لاختيار (أو ضغط على زرّ) في خلية العناوين
    func selectAddressButtonClicked(index: Int) {
        print("Address index selected: \(index)")
    }
}
