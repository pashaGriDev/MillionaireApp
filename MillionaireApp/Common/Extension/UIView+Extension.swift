// MillionaireApp, 2024

import UIKit

extension UIView {
    internal func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}

extension UIColor {
    static let customOrange = UIColor(red: 246/255, green: 99/255, blue: 36/255, alpha: 1)
}
