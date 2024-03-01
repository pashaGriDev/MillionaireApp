// MillionaireApp, 2024

import Foundation
import UIKit

extension NSAttributedString {
    static func formattedText(_ text: String, attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: attributes)
    }
}
