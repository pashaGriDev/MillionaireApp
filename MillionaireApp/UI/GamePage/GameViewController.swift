// MillionaireApp, 2024

import UIKit
import SnapKit

final class GameViewController: UIViewController {
    weak var coordinator: AppCoordinatorProtocol?
     
    private var price = 0
    private var questionNumber = 0
    private let parser = JsonParser()
    
    private let backgroundImageView = UIImageView(image: UIImage(named: "firstBackgroundImage"))
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "imageLogo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = .zero
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var questionNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    private lazy var buttonA =  CustomButton(numberAnswer: "A", answer: "")
    private lazy var buttonB =  CustomButton(numberAnswer: "B", answer: "")
    private lazy var buttonC =  CustomButton(numberAnswer: "C", answer: "")
    private lazy var buttonD =  CustomButton(numberAnswer: "D", answer: "")
    
    private let cluePersonButton =  ClueButton(imageName: "cluePerson")
    private let cluePhoneButton =  ClueButton(imageName: "cluePhone")
    private let clue50Button =  ClueButton(imageName:  "clue50")
    
    private lazy var secondLineStack: UIStackView = {
       let stack = UIStackView()
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.addArrangedSubview(questionNumberLabel)
        stack.addArrangedSubview(priceLabel)
        return stack
    }()
    
    private lazy var questionVerticalStack: UIStackView = {
       let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10
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
    
    private lazy var mainVerticalStack: UIStackView = {
       let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 50
        stack.addArrangedSubview(questionVerticalStack)
        stack.addArrangedSubview(clueStackView)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
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
        view.addSubviews([
            backgroundImageView,logoImageView, questionLabel, secondLineStack, mainVerticalStack
        ])
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(50)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.greaterThanOrEqualTo(150).priority(.high)
        }
        
        secondLineStack.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(10)
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        mainVerticalStack.snp.makeConstraints {
            $0.top.equalTo(secondLineStack.snp.bottom).offset(30)
            $0.trailing.leading.equalToSuperview().inset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
    
    private func getData() {
        if  let json = parser.getDataFromJsonCodable(fileName: JsonFilenames.easy) {
            questionLabel.text = json.results[0].question
            questionNumber += 1
            price += 250
            questionNumberLabel.text = "Вопрос \(questionNumber)"
            priceLabel.text = "\(price) RUB"
            
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
