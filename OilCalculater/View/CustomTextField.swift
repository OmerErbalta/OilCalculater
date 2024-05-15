import UIKit

class CustomTextField: UITextField {
    init(frame: CGRect, color: UIColor, placeHolder: String, icon: UIImage? = nil) {
        super.init(frame: frame)
        setup(color: color, placeHolder: placeHolder, icon: icon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(color: .black, placeHolder: "", icon: UIImage())
    }
    
    private func setup(color: UIColor, placeHolder: String, icon: UIImage?) {
        self.borderStyle = .roundedRect
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: 16)
        self.placeholder = placeHolder
        
        if let icon = icon{
            let iconImageView = UIImageView(image: icon)
            iconImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            iconImageView.contentMode = .scaleAspectFit
            self.leftView = iconImageView
        }
        
        self.leftViewMode = .always
    }
}
