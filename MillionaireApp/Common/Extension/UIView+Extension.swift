// MillionaireApp, 2024

import UIKit

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
    
    internal func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
