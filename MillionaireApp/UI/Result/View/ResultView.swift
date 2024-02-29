// MillionaireApp, 2024

import UIKit
import SnapKit

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
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Medium", size: 24)
        label.textColor = .white
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .customOrange
        label.font = UIFont(name: "Syne", size: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Methods
    
    private func setupLayouts() {
        self.addSubviews([backgroundImageView, logoImageView, resultScoreLabel, resultLabel])
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(201)
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
    }
    
    func setLabelText(score: Int, result: String) {
        resultScoreLabel.text = "ВАШ ВЫЙГРЫШ \(score)"
        resultLabel.text = result
    }
}
