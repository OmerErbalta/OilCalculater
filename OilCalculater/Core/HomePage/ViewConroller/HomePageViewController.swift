import UIKit

class HomePageViewController: UIViewController {
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    var homepageVM = HomePageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5

        setupScrollView()
        setupStackView()
        setupAddButton()
        homepageVM.addCar(plate: "34 EH 2113",image: UIImage(systemName: "car.rear")!)
        for car in homepageVM.cars {
            let card = CarCard(car: car)
            stackView.addArrangedSubview(card)
        }

    }

    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }

    func setupAddButton() {
        let addButton = AddButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func addCar(plate: String, image: UIImage) {
        let newCar = Car(billList: [], plate: plate, image: image)
        homepageVM.cars.append(newCar)

        let card = CarCard(car: newCar)
        stackView.addArrangedSubview(card)

        stackView.layoutIfNeeded()
        if scrollView.contentSize.height > (view.bounds.height * 0.7){
            let bottomOffset = CGPoint(x: 0, y: card.frame.maxY - scrollView.bounds.size.height + Const.height * 0.05)
            scrollView.setContentOffset(bottomOffset, animated: true)
        }
       

    }
}
