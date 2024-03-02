// MillionaireApp, 2024

import UIKit
import SnapKit

final class GameViewController: UIViewController {
     
    private var price = 0
    private var questionNumber = 0
    private let parser = JsonParser()
    
    private let backgroundImageView = UIImageView.standartImageView(imageName: "gameBg")
    private let logoImageView = UIImageView.standartImageView(imageName: "imageLogo")
    
    

    private let questionlabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = .zero
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var questionNumberlabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var pricelabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var buttonA =  CustomButton(numberAnswer: "A", answer: "")
    private lazy var buttonB =  CustomButton(numberAnswer: "B", answer: "")
    private lazy var buttonC =  CustomButton(numberAnswer: "C", answer: "")
    private lazy var buttonD =  CustomButton(numberAnswer: "D", answer: "")
    
    
    private let cluePersonButton =  UIButton.clueButton(imageName: "cluePerson")
    private let cluePhoneButton =  UIButton.clueButton(imageName: "cluePhone")
    private let clue50Button =  UIButton.clueButton(imageName:  "clue50")
    
    private lazy var firstLineStack: UIStackView = {
       let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.spacing = 40
        stack.addArrangedSubview(logoImageView)
        stack.addArrangedSubview(questionlabel)
        return stack
    }()
    
    private lazy var secondLineStack: UIStackView = {
       let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 100
        stack.addArrangedSubview(questionNumberlabel)
        stack.addArrangedSubview(pricelabel)
        return stack
    }()
    private lazy var informStack: UIStackView = {
       let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 20
        stack.addArrangedSubview(firstLineStack)
        stack.addArrangedSubview(secondLineStack)
        return stack
    }()
    
    private lazy var questionVerticalStack: UIStackView = {
       let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 50
        stack.addArrangedSubview(buttonA)
        stack.addArrangedSubview(buttonB)
        stack.addArrangedSubview(buttonC)
        stack.addArrangedSubview(buttonD)
        return stack
    }()
    
    private lazy var clueStackView: UIStackView = {
       let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 15
        stack.addArrangedSubview(cluePersonButton)
        stack.addArrangedSubview(cluePhoneButton)
        stack.addArrangedSubview(clue50Button)
        return stack
    }()
    
    private lazy var mainVerticallStack: UIStackView = {
       let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 100
        stack.addArrangedSubview(questionVerticalStack)
        stack.addArrangedSubview(clueStackView)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getData()
    }
    
    override func viewDidLayoutSubviews() {
        buttonA.applyGradient()
        buttonB.applyGradient()
        buttonC.applyGradient()
        buttonD.applyGradient()
    }
    
    private func setup() {
        view.addSubviews([backgroundImageView, informStack, mainVerticallStack])
        
        backgroundImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(200)
        }
        logoImageView.snp.makeConstraints {
            $0.height.equalTo(87)
            $0.width.equalTo(87)
        }
        informStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(70)
        }
        mainVerticallStack.snp.makeConstraints {
            $0.top.equalTo(informStack.snp.bottom).offset(30)
            $0.trailing.leading.equalTo(10)
        }
    }
    
    private func getData() {
        if  let json = parser.getDataFromJsonCodable(fileName: "Questions") {
            questionlabel.text = json.results[0].question
            questionNumber += 1
            price += 250
            questionNumberlabel.text = "Вопрос \(questionNumber)"
            pricelabel.text = "\(price) RUB"
            
           let  answerA = json.results[0].incorrectAnswers[2]
            buttonA.reloadViews(answer: answerA)
           let  answerB = json.results[0].incorrectAnswers[2]
            buttonB.reloadViews(answer: answerB)
           let answerC = json.results[0].correctAnswer
            buttonC.reloadViews(answer: answerC)
           let answerD = json.results[0].incorrectAnswers[0]
            buttonD.reloadViews(answer: answerD)
        }
    }
}
