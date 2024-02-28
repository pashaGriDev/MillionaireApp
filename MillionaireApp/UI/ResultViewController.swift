// MillionaireApp, 2024

import UIKit
import SnapKit

class ResultViewController: UIViewController {
    
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
        label.font = .systemFont(ofSize: 24)
        label.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "LOSE or WIN"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 50)
        label.textColor = .systemRed
//        label.textColor = UIColor(red: 246, green: 99, blue: 36, alpha: 1)
        return label
    }()
    
    private lazy var restartButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 36)
        button.setTitle("PLAY AGAIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
//        button.backgroundColor = UIColor(red: 52, green: 184, blue: 58, alpha: 1)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(restartGame(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayots()
    }
    
    private func setupLayots() {
        view.addSubviews([backgroundImageView,
                          logoImageView,
                          resultScoreLabel,
                          resultLabel,
                          restartButton
                         ])
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(201)
            make.width.equalTo(201)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.topMargin).inset(19)
        }
        
        resultScoreLabel.snp.makeConstraints { make in
            make.height.equalTo(42)
            make.width.equalTo(345)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.topMargin).inset(225)
        }
        
        resultLabel.snp.makeConstraints { make in
                make.height.equalTo(87)
                make.width.equalTo(282)
                make.centerX.equalToSuperview()
                make.top.equalTo(view.snp.topMargin).inset(267)
        }
        
        restartButton.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp.bottomMargin).inset(30)
        }
    }
    
    @objc func restartGame(sender: UIButton) {
        print("RESTART GAME")
    }
    
}
