// MillionaireApp, 2024

import UIKit
import SnapKit

final class StartViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .firstBackground
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imageLogo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
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
    
    private lazy var rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Правила игры", for: .normal)
        button.tintColor = .systemGreen
        button.titleLabel?.font = .systemFont(ofSize: 36, weight: .bold)
        button.addTarget(self, action: #selector(rulesButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Начало игры", for: .normal)
        button.tintColor = .systemGreen
        button.titleLabel?.font = .systemFont(ofSize: 36, weight: .bold)
        button.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupLayout()
    }
    
    
    //MARK: layout
    
    private func setupLayout() {
        view.addSubviews([backgroundImageView,
                          logoImageView,
                          welcomeLabel,
                          mainLabel,
                          rulesButton,
                          startButton])
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(225)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        rulesButton.snp.makeConstraints { make in
            make.bottom.equalTo(startButton.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: Actions
    
    @objc private func startButtonAction() {
        //TODO: destinationVC (start game)
        let RVC = ResultViewController()
        show(RVC, sender: nil)
    }
    
    @objc private func rulesButtonAction() {
        //TODO: destinationVC (rules of game)
    }
}
