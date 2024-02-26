// MillionaireApp, 2024

import UIKit

final class StartScreenViewController: UIViewController {
    
    //MARK: ImageViews
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background1")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageLogo")
        return imageView
    }()
    
    //MARK: Labels
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Кто хочет стать миллионером?"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    //MARK: Buttons
    private lazy var rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Правила игры", for: .normal)
        button.tintColor = .systemGreen
        button.titleLabel?.font = .systemFont(ofSize: 36, weight: .bold)
        return button
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Начало игры", for: .normal)
        button.tintColor = .systemGreen
        button.titleLabel?.font = .systemFont(ofSize: 36, weight: .bold)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    
    //MARK: - layout
    private func setupLayout() {
        [backgroundImageView,
         logoImageView,
         welcomeLabel,
         mainLabel,
         rulesButton,
         startButton].forEach { view.addSubview($0) }
        
        backgroundImageView.snp.makeConstraints { make in
            make.center.size.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(225)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).inset(-20)
            make.centerX.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        rulesButton.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).inset(-140)
            make.centerX.equalToSuperview()
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(rulesButton.snp.bottom).inset(-30)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: Actions
    @objc private func startButtonAction() {
        //TODO: destinationVC (start game)
    }
    
    @objc private func rulesButtonAction() {
        //TODO: destinationVC (rules of game)
    }
}
