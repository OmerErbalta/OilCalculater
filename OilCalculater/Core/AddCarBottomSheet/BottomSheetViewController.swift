import UIKit
class BottomSheetViewController: UIViewController {
    let textField = UITextField()
    let addButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        let infoLabel = CustomLabel(text: "Araç Bilgisini Giriniz",color: .black, size: 16)

        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let bottomSheetView = UIView()
        bottomSheetView.backgroundColor = .white
        bottomSheetView.layer.cornerRadius = 16
        view.addSubview(bottomSheetView)
        bottomSheetView.addSubview(infoLabel)
        
        
        bottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:0),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:0),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
        
        textField.placeholder = "Plaka"
        textField.borderStyle = .roundedRect
        bottomSheetView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.setTitle("Ekle", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .green
        addButton.layer.cornerRadius = 8
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        bottomSheetView.addSubview(addButton)

        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            infoLabel.topAnchor.constraint(equalTo: bottomSheetView.topAnchor,constant: 16),
            infoLabel.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor,constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: 16),
            
            
            textField.topAnchor.constraint(equalTo: infoLabel.topAnchor, constant: 40),
            textField.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -16),
            
            
            addButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            addButton.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 16),
            addButton.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -16),
            addButton.bottomAnchor.constraint(equalTo: bottomSheetView.bottomAnchor, constant: -200),
            addButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func addButtonPressed() {
        if let plate = textField.text, !plate.isEmpty {
            if let homePageVC = presentingViewController as? HomePageViewController {
                homePageVC.addCar(plate: plate, image: UIImage(systemName: "car.rear")!)
            }
        }
        dismiss(animated: true, completion: nil)
    }
}
