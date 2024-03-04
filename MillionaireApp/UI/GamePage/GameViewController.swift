// MillionaireApp, 2024

import UIKit
import SnapKit

final class GameViewController: UIViewController {
    weak var coordinator: AppCoordinatorProtocol?
     
    private var price = 0
    private var questionNumber = 0
    private let parser = JsonParser()
    private var timer: Timer?
    private var seconds = 30
    
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
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "00:30"
        return label
    }()
    
    private lazy var buttonA =  CustomButton(numberAnswer: "A", answer: "")
    private lazy var buttonB =  CustomButton(numberAnswer: "B", answer: "")
    private lazy var buttonC =  CustomButton(numberAnswer: "C", answer: "")
    private lazy var buttonD =  CustomButton(numberAnswer: "D", answer: "")
    
    private let cluePersonButton =  ClueButton(imageName: "cluePerson")
    private let cluePhoneButton =  ClueButton(imageName: "cluePhone")
    private let clue50Button =  ClueButton(imageName:  "clue50")
    
    private lazy var arrayAnswers = [buttonA, buttonB, buttonC, buttonD]
    
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
        addActions()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setAnswersButtons()
        getData()
        startTimer()
    }
    
    override func viewDidLayoutSubviews() {
        buttonA.applyGradient()
        buttonB.applyGradient()
        buttonC.applyGradient()
        buttonD.applyGradient()
    }
    
    @objc func updateTimer() {
        seconds -= 1
        timerLabel.text = "00:\(seconds)"
          
        if seconds == 0 {
            stopTimer()
            wrongAnswerTapped()
        }
      }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        seconds = 30
        timerLabel.isHidden = false
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timerLabel.isHidden = true
        timerLabel.text = "00:30"
       }
    
    private func setAnswersButtons() {
        _ = arrayAnswers.map { button in
            button.isEnabled = true
            button.showText()
            button.tag = 0
        }
    }
    
    private func setup() {
        view.addSubviews([
            backgroundImageView,logoImageView, questionLabel, timerLabel, secondLineStack, mainVerticalStack
        ])
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(50)
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.greaterThanOrEqualTo(100).priority(.high)
        }
        
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        secondLineStack.snp.makeConstraints {
            $0.top.equalTo(timerLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        mainVerticalStack.snp.makeConstraints {
            $0.top.equalTo(secondLineStack.snp.bottom).offset(30)
            $0.trailing.leading.equalToSuperview().inset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
    
    private func addActions() {
        for i in arrayAnswers {
            i.addAction(UIAction { _ in
                i.isEnabled = false
                i.highlighte(isHighlighted: true)
                self.stopTimer()
                if i.tag == 1 {
                    self.rightAnswerTapped()
                } else {
                    self.wrongAnswerTapped()
                }
            }, for: .touchUpInside)
        }
        
        clue50Button.addAction(UIAction { _ in
            _ = self.arrayAnswers.map({ button in
                if button.tag != 2 &&  button.tag != 1 {
                    button.hideText()
                }
                self.clue50Button.isEnabled = false
                
            })
        }, for: .touchUpInside)
        
        cluePersonButton.addAction(UIAction { _ in
            self.findRightAnswer(by: "Зал", with: 7)
            self.cluePersonButton.isEnabled = false
        }, for: .touchUpInside)
        
        cluePhoneButton.addAction(UIAction { _ in
            self.findRightAnswer(by: "Друг", with: 8)
            self.cluePhoneButton.isEnabled = false
        }, for: .touchUpInside)
    }

    
    private func rightAnswerTapped() {
        //TODO: Coordinator
        
        navigationController?.pushViewController(ProgressViewController(currentQuestion: questionNumber, isCorrectQuestion: true), animated: true)
        
        _ = arrayAnswers.map({ button in
            button.highlighte(isHighlighted: false )
        })
    }
    
    private func wrongAnswerTapped() {
        //TODO: Coordinator
        
        navigationController?.pushViewController(ProgressViewController(currentQuestion: questionNumber, isCorrectQuestion: false), animated: true)
    }
    
    private func findRightAnswer( by person: String, with probability: Int) {
        let result = Int.random(in: 1...10)
        var answer = ""
        
        if result < probability {
            _ = arrayAnswers.map { button in
                if button.tag == 1 {
                    answer = button.leftLabel.text ?? String()
                }
            }
        } else {
            _ = arrayAnswers.map { button in
                if button.tag == 1 {
                    answer = button.leftLabel.text ?? String()
                }
            }
        }
        showAlert(answer: answer, by: "\(person)")
    }
    
    private func showAlert(answer: String, by person: String) {
        let alert = UIAlertController(title: "\(person) считает, что правильный ответ:", message: "\(answer)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func calculatePrice() {
        switch price {
        case let x where x == 0: price = 100
        case let x where x == 200: price = 300
        case let x where x == 300: price = 500
        case let x where x == 64000: price = 125000
        default: price *= 2
        }
    }
    
    private func defineLevelOfQuestion() -> JsonFilenames {
        var fileName: JsonFilenames
        
        switch price {
        case let x where x < 1000: fileName = .easy
        case let x where x > 1000 && x < 32000: fileName = .medium
        case let x where x > 32000: fileName = .hard
        default: fileName = .easy
        }
        return fileName
    }
    
    private func getData() {
        
        var fileName = defineLevelOfQuestion()

        if  let json = parser.getDataFromJsonCodable(fileName: fileName) {
            questionLabel.text = json.results[questionNumber].question
            calculatePrice()
            priceLabel.text = "\(price) RUB"
            
            arrayAnswers.shuffle()
            for i in arrayAnswers {
                guard let index = arrayAnswers.firstIndex(of: i) else {return}
                var  answer: String
            
                if index > 2 {
                    answer = json.results[questionNumber].correctAnswer
                    i.tag = 1
                } else if index == 2 {
                    i.tag = 2
                    answer = json.results[questionNumber].incorrectAnswers[index]
                } else {
                    answer = json.results[questionNumber].incorrectAnswers[index]
                }
                i.reloadViews(answer: answer)
            }
            questionNumber += 1
            questionNumberLabel.text = "Вопрос \(questionNumber)"
        }
    }
}
