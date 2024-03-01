// MillionaireApp, 2024

import UIKit

private enum Constants {
    static let fileExtension = "json"
}

final class JsonParser {
    
    let decoder = JSONDecoder()
    
    func getDataFromJsonCodable(fileName: String) -> QuestionModel? {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let url  = Bundle.main.url(forResource:  fileName, withExtension: Constants.fileExtension) {
            if let text = try? Data(contentsOf: url) {
                if let json = try? decoder.decode(QuestionModel.self, from: text) {
                    print(json)
                    return json
                }
            }
        }
        return nil
    }
}



