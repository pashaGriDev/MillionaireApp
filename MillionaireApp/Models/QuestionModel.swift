// MillionaireApp, 2024

import Foundation

struct QuestionModel {
    let response_code: Int
    let results: [ResulytsModel]
}

struct ResulytsModel {
    
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}
