// MillionaireApp, 2024

import UIKit

extension UIButton {
    class func clueButton(imageName: String) -> UIButton {
        let button = UIButton()
        if let image = UIImage(named: imageName) {
            button.setImage(image, for: .normal)
        }
        button.snp.makeConstraints {
            $0.width.equalTo(107)
            $0.height.equalTo(83)
        }
        return button
    }
}
    
