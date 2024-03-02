// MillionaireApp, 2024

import UIKit

private extension CGFloat {
    static let cornerRadius = 16.0
}

class CustomButton: UIButton {
    private var numberAnswer: String
    private var answer: String
    
    private var leftLabel: UILabel = {
        let leftLabel = UILabel()
        leftLabel.textAlignment = .center
        leftLabel.textColor = .white
        leftLabel.font = .preferredFont(forTextStyle: .title1)
        return leftLabel
    }()
    
    private var rightLabel: UILabel = {
        let rightLabel = UILabel()
        rightLabel.textAlignment = .center
        rightLabel.textColor = .white
        rightLabel.font = .preferredFont(forTextStyle: .title1)
        return rightLabel
    }()
    
    init(numberAnswer: String, answer: String) {
        self.answer = answer
        self.numberAnswer = numberAnswer
        super.init(frame: .zero)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        setTitleColor(.systemBlue, for: .highlighted)
        layer.borderColor = UIColor(hexString: "686868").cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = CGFloat.cornerRadius
        
        addSubview(leftLabel)
        addSubview(rightLabel)
        layer.masksToBounds = true
    }
    
    private func setConstraints() {
        leftLabel.snp.makeConstraints {
            $0.leading.equalTo(snp.leading).offset(10)
            $0.centerY.equalTo(snp.centerY)
        }
        rightLabel.snp.makeConstraints {
            $0.trailing.equalTo(snp.trailing).offset(-10)
            $0.centerY.equalTo(snp.centerY)
        }
        snp.makeConstraints {
            $0.width.equalTo(320)
            $0.height.equalTo(54)
        }
    }
    
    func reloadViews(answer: String) {
        leftLabel.text = numberAnswer
        rightLabel.text = answer
    }
}
