import UIKit

class CarCard: UIView {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    var kilometer = UILabel()
    var lastBuyDate = UILabel()
    var amountOil = UILabel()
    
    var car: Car

    init(car: Car) {
        self.car = car
        super.init(frame: .zero)
        setupUI()
        setupGestureRecognizer()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGestureRecognizer() {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
            addGestureRecognizer(tapGestureRecognizer)
            isUserInteractionEnabled = true
        }

    @objc private func cardTapped() {
        let carDetailViewController = CarDetailViewController(car: car)
        let navController = UINavigationController(rootViewController: carDetailViewController)
        if let currentViewController = UIApplication.shared.windows.first?.rootViewController {
            navController.modalPresentationStyle = .fullScreen
            currentViewController.present(navController, animated: true, completion: nil)
        }
    }




    private func setupUI() {
        // Kartın genel görünümü
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4

        // Resim görünümü
        imageView.contentMode = .scaleAspectFit
        imageView.image = car.image
        imageView.tintColor = .black

        // Başlık etiketi
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.text = car.plate
        
        // Diğer etiketler
        kilometer.text = "Araç Kilometresi : 215.357"
        kilometer.font = UIFont.boldSystemFont(ofSize: 10)
        lastBuyDate.text = "Son Yakıt Alma Tarihi: 03.10.2000"
        lastBuyDate.font = UIFont.boldSystemFont(ofSize: 10)
        amountOil.text = "Miktar-Fiyat : 15L - 500 Tl "
        amountOil.font = UIFont.boldSystemFont(ofSize: 10)

        let carInfoStackView = UIStackView(arrangedSubviews: [imageView,titleLabel])
        let labelsStackView = UIStackView(arrangedSubviews: [kilometer, lastBuyDate, amountOil])
        carInfoStackView.axis = .vertical
        carInfoStackView.spacing = 10
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 10
        labelsStackView.distribution = .equalCentering
        addSubview(carInfoStackView)
        
        addSubview(labelsStackView)

        // Resim ve başlık etiketinin konumlandırılması
        carInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carInfoStackView.topAnchor.constraint(equalTo:topAnchor, constant: Const.height * 0.05),
            carInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            carInfoStackView.widthAnchor.constraint(equalToConstant: Const.width * 0.25),
            carInfoStackView.heightAnchor.constraint(equalToConstant: Const.width * 0.25),

            labelsStackView.topAnchor.constraint(equalTo: carInfoStackView.topAnchor, constant: Const.height * 0.01),
            labelsStackView.leadingAnchor.constraint(equalTo: carInfoStackView.leadingAnchor, constant: Const.width * 0.4),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Const.height * 0.05)
        ])
    }
}
