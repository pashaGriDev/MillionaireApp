// MillionaireApp, 2024

import UIKit

extension UIView {
    internal func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
