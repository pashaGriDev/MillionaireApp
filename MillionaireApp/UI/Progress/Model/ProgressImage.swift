// MillionaireApp, 2024

import Foundation
import UIKit

struct ProgressImage {
    //MARK: Images enumeration
    enum ImageStates {
        case current
        case common
        case guarantee
        case final
        case wrong
        
        var image: UIImage {
            switch self {
            case .current:
                return .currentQueistion
            case .common:
                return .commonQuestion
            case .guarantee:
                return .guaranteePointQuestion
            case .final:
                return .finalQuestion
            case .wrong:
                return .wrongQuestion
            }
        }
    }
    
    let number: Int
    let amount: Int
    var backgroundImage: ImageStates
    
    static func mockModel() -> [ProgressImage] {
        var model: [ProgressImage] = [
            ProgressImage(number: 1, amount: 100, backgroundImage: .current),
            ProgressImage(number: 2, amount: 200, backgroundImage: .common),
            ProgressImage(number: 3, amount: 300, backgroundImage: .common),
            ProgressImage(number: 4, amount: 500, backgroundImage: .common),
            ProgressImage(number: 5, amount: 1000, backgroundImage: .guarantee),
            ProgressImage(number: 6, amount: 2000, backgroundImage: .common),
            ProgressImage(number: 7, amount: 4000, backgroundImage: .common),
            ProgressImage(number: 8, amount: 8000, backgroundImage: .common),
            ProgressImage(number: 9, amount: 16000, backgroundImage: .common),
            ProgressImage(number: 10, amount: 32000, backgroundImage: .guarantee),
            ProgressImage(number: 11, amount: 64000, backgroundImage: .common),
            ProgressImage(number: 12, amount: 125_000, backgroundImage: .common),
            ProgressImage(number: 13, amount: 250_000, backgroundImage: .common),
            ProgressImage(number: 14, amount: 500_000, backgroundImage: .common),
            ProgressImage(number: 15, amount: 1000_000, backgroundImage: .final),]
        model.reverse()
        return model
    }
}
