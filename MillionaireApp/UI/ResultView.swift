// MillionaireApp, 2024

import UIKit

class ResultView: UIView {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .firstBackground
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imageLogo
        return  imageView
    }()
    
    private let resultScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Your score is here"
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Medium", size: 24)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "LOSE"
        label.textAlignment = .center
        label.font = UIFont(name: "Syne", size: 50)
        label.textColor = UIColor(red: 246/255, green: 99/255, blue: 36/255, alpha: 1)
        return label
    }()
    
    private lazy var restartButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 36)
        button.setTitle("PLAY", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 52/255, green: 184/255, blue: 58/255, alpha: 1)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var saveResultButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 36)
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 52/255, green: 184/255, blue: 58/255, alpha: 1)
        button.layer.cornerRadius = 20
        return button
    }()
    
    func setupLayots() {
        self.addSubviews([backgroundImageView,
                          logoImageView,
                          resultScoreLabel,
                          resultLabel,
                          restartButton,
                          saveResultButton
                         ])
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(201)
            make.width.equalTo(201)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.topMargin).inset(19)
        }
        
        resultScoreLabel.snp.makeConstraints { make in
            make.height.equalTo(42)
            make.width.equalTo(345)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.topMargin).inset(225)
        }
        
        resultLabel.snp.makeConstraints { make in
                make.height.equalTo(87)
                make.width.equalTo(282)
                make.centerX.equalToSuperview()
                make.top.equalTo(self.snp.topMargin).inset(267)
        }
        
        restartButton.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(self.frame.width / 2 - 16)
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.bottom.equalTo(self.snp.bottomMargin).inset(30)
        }
        
        saveResultButton.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(self.frame.width / 2 - 16)
            make.centerX.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalTo(self.snp.bottomMargin).inset(30)
        }
        
    }
    
    func addSaveButtonTarget(_ target: Any?, action: Selector) {
        saveResultButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addRestartButtonTarget(_ target: Any?, action: Selector) {
        restartButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
}
