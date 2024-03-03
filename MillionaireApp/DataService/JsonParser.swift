// MillionaireApp, 2024

import UIKit

private enum Constants {
    static let fileExtension = "json"
}

enum JsonFilenames: String {
    case easy = "QuestionsEasy"
    case medium = "QuestionsMedium"
    case hard = "QuestionsHard"
}

final class JsonParser {
    
    private let decoder = JSONDecoder()
    
    func getDataFromJsonCodable(fileName: JsonFilenames) -> QuestionModel? {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let url  = Bundle.main.url(forResource:  JsonFilenames.easy.rawValue, withExtension: Constants.fileExtension) {
            if let text = try? Data(contentsOf: url) {
                if let json = try? decoder.decode(QuestionModel.self, from: text) {
                    return json
                }
            }
        }
        return nil
    }
}



