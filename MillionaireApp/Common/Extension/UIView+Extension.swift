// MillionaireApp, 2024

import UIKit

extension UIView {
    internal func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    func applyGradient() {
        let lightBlue = UIColor(hexString: "426D8B")
        let blue = UIColor(hexString: "203960")
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [lightBlue.cgColor, blue.cgColor]
        gradient.locations = [0.0, 1.1]
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension UIColor {
    static let customOrange = UIColor(red: 246/255, green: 99/255, blue: 36/255, alpha: 1)
}
