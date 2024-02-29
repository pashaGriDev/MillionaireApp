// MillionaireApp, 2024

import UIKit
import SnapKit

class ResultViewController: UIViewController {
    
    private let result: Int
    private let customView = ResultView()
    
    private lazy var restartButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 36)
        button.setTitle("ИГРАТЬ СНОВА", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(restartGame(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var saveResultButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 36)
        button.setTitle("СОХРАНИТЬ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(saveResult(sender:)), for: .touchUpInside)
        return button
    }()
    
    init(result: Int) {
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        showResult(result: result)
    }
    
    // MARK: - Methods
    
    @objc private func restartGame(sender: UIButton) {
        print("TRY AGAIN")
    }
    
    @objc private func saveResult(sender: UIButton) {
        print("SAVE RESULT")
    }
    
    private func setupView() {
        view.addSubviews([customView, saveResultButton, restartButton])
        
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
    
    private func showResult(result: Int) {
        switch result {
        case 0 :
            customView.setLabelText(score: 0, result: "ВЫ ПРОИГРАЛИ")
        default:
            customView.setLabelText(score: result, result: "ВЫ ВЫЙГРАЛИ")
        }
    }
}


