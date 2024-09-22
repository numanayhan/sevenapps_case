


import Foundation
import UIKit

@IBDesignable
class UserLabel: UILabel {

    // Font size
    @IBInspectable var customFontSize: CGFloat = 16.0 {
        didSet {
            self.font = self.font.withSize(customFontSize)
        }
    }

    // Text color
    @IBInspectable var customTextColor: UIColor = UIColor.white {
        didSet {
            self.textColor = customTextColor
        }
    }

    // Text alignment using NSTextAlignment
    @IBInspectable var textAlignmentValue: String = "left" {
        didSet {
            switch textAlignmentValue.lowercased() {
            case "center":
                self.textAlignment = .center
            case "right":
                self.textAlignment = .right
            default:
                self.textAlignment = .left
            }
        }
    }
    
    // Corner radius
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = cornerRadius > 0
        }
    }

    // Border width
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    // Border color
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    // Background color for label
    @IBInspectable var customBackgroundColor: UIColor = UIColor.clear {
        didSet {
            self.backgroundColor = customBackgroundColor
        }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaults()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDefaults()
    }

    private func setDefaults() {
        self.textColor = customTextColor
    }
}
