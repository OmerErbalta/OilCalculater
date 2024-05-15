import UIKit

class CarDetailViewController: UIViewController {
    var car: Car
    
    init(car: Car) {
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .systemGray5
        // Bill List
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        var stackViewHeight = CGFloat(0)


        for _ in 0..<15 {
            let bill = BillCard(bill: Bill(oilLiter: 20, money: 300))
            stackViewHeight += bill.frame.maxY
            stackView.addArrangedSubview(bill)
        }
        print(stackViewHeight)
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: stackViewHeight)
        scrollView.addSubview(stackView)


        // Back Button
        let backButton = BackButton()
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        // Car Image
        let imageView = UIImageView(image: car.image)
        imageView.contentMode = .scaleAspectFit
        imageView.image = car.image
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        // Plate Number
        let titleLabel = CustomLabel(text: car.plate, color: .black, size: 20)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        // Car Info Stack View
        let carInfoStackView = UIStackView()
        carInfoStackView.axis = .horizontal
        carInfoStackView.spacing = 8
        carInfoStackView.alignment = .center
        carInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        carInfoStackView.addArrangedSubview(imageView)
        carInfoStackView.addArrangedSubview(titleLabel)
        view.addSubview(carInfoStackView)

        // Other Labels
        let kilometer = CustomLabel(text: "Araç Kilometresi: \(car.kilometer)", color: .black, size: 14)
        kilometer.translatesAutoresizingMaskIntoConstraints = false
        kilometer.backgroundColor = .white
        kilometer.textAlignment = .center
        kilometer.layer.borderWidth = 0.5
        
        view.addSubview(kilometer)

        let averageAmountOil = CustomLabel(text: "Ortalama Yakıt Tüketimi: 3.2 L", color: .black, size: 14)
        averageAmountOil.translatesAutoresizingMaskIntoConstraints = false
        averageAmountOil.backgroundColor = .white
        averageAmountOil.textAlignment = .center
        averageAmountOil.layer.borderWidth = 0.5
        view.addSubview(averageAmountOil)

        let averageAmountDetail = CustomLabel(text: "Kilometre Başına Harcanan Yakıt: 4,2 Tl", color: .black, size: 14)
        averageAmountDetail.translatesAutoresizingMaskIntoConstraints = false
        averageAmountDetail.backgroundColor = .white
        averageAmountDetail.textAlignment = .center
        averageAmountDetail.layer.borderWidth = 0.5
        view.addSubview(averageAmountDetail)

        
        let billListHeader = UIStackView()
        billListHeader.axis = .horizontal
        billListHeader.spacing = 0
        billListHeader.alignment = .center
        billListHeader.translatesAutoresizingMaskIntoConstraints = false
        billListHeader.backgroundColor = .red.withAlphaComponent(0.7)
        billListHeader.layer.borderWidth = 1

        let billListHeaderLabel = CustomLabel(text: "Yakıt Listesi", color: .black, size: 24)
        billListHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        billListHeaderLabel.textAlignment = .center
        billListHeaderLabel.textColor = .white


        //add Bill Button
        let addBill = UIButton()
        addBill.setImage(UIImage(systemName: "plus.square.fill"), for: .normal)
        addBill.tintColor = .white
        
        billListHeader.addArrangedSubview(billListHeaderLabel)
        billListHeader.addArrangedSubview(addBill)
        view.addSubview(billListHeader)
        
        
        // Layout Constraints
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),

            carInfoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            carInfoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           
            

            kilometer.topAnchor.constraint(equalTo: carInfoStackView.bottomAnchor, constant: 50),
            kilometer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            kilometer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            kilometer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            averageAmountOil.topAnchor.constraint(equalTo: kilometer.bottomAnchor, constant: 16),
            averageAmountOil.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            averageAmountOil.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            averageAmountOil.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            averageAmountDetail.topAnchor.constraint(equalTo: averageAmountOil.bottomAnchor, constant: 16),
            averageAmountDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            averageAmountDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            averageAmountDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            billListHeader.topAnchor.constraint(equalTo: averageAmountDetail.bottomAnchor, constant: 50),
            billListHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            billListHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            billListHeader.bottomAnchor.constraint(equalTo: scrollView.topAnchor,constant: 5),
           
            addBill.leadingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
                      
            scrollView.topAnchor.constraint(equalTo: billListHeader.bottomAnchor, constant: 5),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
