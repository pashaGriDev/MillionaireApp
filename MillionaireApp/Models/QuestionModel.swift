// MillionaireApp, 2024

import Foundation

struct QuestionModel: Codable {
    let responseCode: Int
    let results: [ResultsModel]
}

struct ResultsModel: Codable {
    
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}
