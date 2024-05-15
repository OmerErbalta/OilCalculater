import UIKit

class AddButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    private func setupButton() {
        setTitle("+", for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .green
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        layer.cornerRadius = 25
        
        addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }

    @objc func addButtonTapped() {
        let bottomSheetVC = BottomSheetViewController()
        bottomSheetVC.modalPresentationStyle = .pageSheet
        bottomSheetVC.sheetPresentationController?.detents = [.medium(), .medium()]
        
        UIApplication.shared.windows.first?.rootViewController?.present(bottomSheetVC, animated: true)
    }
}
