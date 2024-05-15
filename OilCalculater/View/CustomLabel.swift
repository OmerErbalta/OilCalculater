import UIKit

class CustomLabel: UILabel {
    var customSize: CGFloat = 20 {
        didSet {
            self.font = UIFont.boldSystemFont(ofSize: customSize)
        }
    }

    override var text: String? {
        didSet {
            self.attributedText = NSAttributedString(string: text ?? "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: customSize)])
        }
    }

    init(text: String, color: UIColor = .black, size: CGFloat = 20, icon: UIImage? = nil) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = color
        self.customSize = size
        setup()
        
        if let icon = icon {
            // Add icon
            let attachment = NSTextAttachment()
            attachment.image = icon
            let iconString = NSAttributedString(attachment: attachment)
            let mutableAttributedString = NSMutableAttributedString(attributedString: iconString)
            
            // Add space between icon and text
            mutableAttributedString.append(NSAttributedString(string: " "))
            
            // Add text
            mutableAttributedString.append(NSAttributedString(string: text))
            
            self.attributedText = mutableAttributedString
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        self.font = UIFont.boldSystemFont(ofSize: customSize)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

// Example usage
let label = CustomLabel(text: "Example", color: .red, size: 24, icon: UIImage(systemName: "star.fill"))
