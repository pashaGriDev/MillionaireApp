// MillionaireApp, 2024

import UIKit

private enum Constants {
    static let fileExtension = "json"
}

final class JsonParser {
    
    func getDataFromJsonCodable(fileName: String) -> QuestionModel? {
        if let url  = Bundle.main.url(forResource:  fileName, withExtension: Constants.fileExtension) {
            if let text = try? Data(contentsOf: url) {
                if let json = try? JSONDecoder().decode(QuestionModel.self, from: text) {
                    return json
                }
            }
        }
        return nil
    }
    
}



