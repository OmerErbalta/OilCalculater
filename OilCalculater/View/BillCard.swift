import UIKit
class BillCard: UIView {
    let bill: Bill
    let oilLiterLabel: UILabel
    let moneyLabel: UILabel
    let dateLabel: UILabel

    init(bill: Bill) {
        self.bill = bill
        self.oilLiterLabel = UILabel()
        self.moneyLabel = UILabel()
        self.dateLabel = UILabel()

        super.init(frame: .init(x: Const.width * 0.05, y: 0, width: Const.width, height: 75))

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        

        oilLiterLabel.font = UIFont.boldSystemFont(ofSize: 14)
        oilLiterLabel.text = "Yakıt Miktarı: \(bill.oilLiter)"
        moneyLabel.font = UIFont.boldSystemFont(ofSize: 14)
        moneyLabel.text = "Tutar: \(bill.money)"
        dateLabel.font = UIFont.boldSystemFont(ofSize: 14)
        dateLabel.text = "Tarih: 03.10.2000"

        let stackView = UIStackView(arrangedSubviews: [oilLiterLabel, moneyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        addSubview(dateLabel)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            dateLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: Const.width * 0.65)
        ])
    }
}
