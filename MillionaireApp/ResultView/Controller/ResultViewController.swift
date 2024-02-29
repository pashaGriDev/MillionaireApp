// MillionaireApp, 2024

import UIKit


class ResultViewController: UIViewController {
    
    private lazy var restartButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 36)
        button.setTitle("ИГРАТЬ СНОВА", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var saveResultButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 36)
        button.setTitle("СОХРАНИТЬ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        return button
    }()
    
    // MARK: - LifeCycle
    
    let customView = ResultView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(customView)
        customView.setupLayots()
        setupLayots()
    }
    
    // MARK: - Methods
    
    @objc func restartGame(sender: UIButton) {
        print("TRY AGAIN")
    }
    
    @objc func saveResult(sender: UIButton) {
        print("SAVE RESULT")
    }
    
    func setupLayots() {
        view.addSubviews([customView, saveResultButton, restartButton])
        
        restartButton.addTarget(self, action: #selector(restartGame(sender:)), for: .touchUpInside)
        saveResultButton.addTarget(self, action: #selector(saveResult(sender:)), for: .touchUpInside)
        
        customView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        restartButton.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.equalTo(view.snp.leadingMargin)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.snp.bottomMargin).inset(30)
        }
        
        saveResultButton.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.equalTo(view.snp.leadingMargin)
            make.centerX.equalTo(view)
            make.bottom.equalTo(restartButton.snp.top).inset(-30)
        }
    }
    
    func checkResult(result: Int) {
        switch result {
        case 1_000..<32_000 :
            customView.setLabelText(score: 1000, result: "ВЫ ВЫЙГРАЛИ")
        case 32_000..<500_000 :
            customView.setLabelText(score: 32000, result: "ВЫ ВЫЙГРАЛИ")
        case 500_000..<1_000_000 :
            customView.setLabelText(score: 500000, result: "ВЫ ВЫЙГРАЛИ")
        case 1_000_000... :
            customView.setLabelText(score: 1000000, result: "ВЫ ВЫЙГРАЛИ")
        default:
            customView.setLabelText(score: 0, result: "ВЫ ПРОТГРАЛИ")
        }
    }
}


