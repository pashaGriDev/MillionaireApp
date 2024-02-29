// MillionaireApp, 2024

import UIKit
import SnapKit

final class RulesViewController:UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .firstBackground
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Правила игры"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let rulesLabel: UILabel = {
       let rules = UILabel()
        rules.text = ""
        rules.textColor = .white
        rules.numberOfLines = 0
        rules.textAlignment = .left
        rules.font = .systemFont(ofSize: 14, weight: .medium)
        return rules
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupLayout()
        let rulesStruct = RulesStruct()
        let formattedText = NSMutableAttributedString()
        formattedText.append(.formattedText(rulesStruct.rulesMainText, attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 12)]))
        formattedText.append(.formattedText(rulesStruct.rulesFirstQuestionsText, attributes: [.foregroundColor: UIColor.green, .font: UIFont.boldSystemFont(ofSize: 12)]))
        formattedText.append(.formattedText(rulesStruct.rulesFirstSaveQuestionText, attributes: [.foregroundColor: UIColor.red, .font: UIFont.boldSystemFont(ofSize: 12)]))
        formattedText.append(.formattedText(rulesStruct.rulesFirstQuestionsDescribeText, attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 12)]))
        formattedText.append(.formattedText(rulesStruct.rulesSecondQuestionsText, attributes: [.foregroundColor: UIColor.green, .font: UIFont.boldSystemFont(ofSize: 12)]))
        formattedText.append(.formattedText(rulesStruct.rulesSecondSaveQuestionText, attributes: [.foregroundColor: UIColor.red, .font: UIFont.boldSystemFont(ofSize: 12)]))
        formattedText.append(.formattedText(rulesStruct.rulesSecondQuestionsDescribeText, attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 12)]))
        formattedText.append(.formattedText(rulesStruct.rulesThirdQuestionsText, attributes: [.foregroundColor: UIColor.green, .font: UIFont.boldSystemFont(ofSize: 12)]))
        formattedText.append(.formattedText(rulesStruct.rulesTipsText, attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 12)]))
        rulesLabel.attributedText = formattedText
    }
    
    
    //MARK: layout
    
    private func setupLayout() {
        view.addSubviews([backgroundImageView,scrollView])
        scrollView.addSubviews([mainLabel, rulesLabel])
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }

        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).inset(40)
            make.centerX.equalToSuperview()
        }
        
        rulesLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
            make.bottom.equalTo(scrollView.snp.bottom).inset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            
        }
        
        
    }
    
}
