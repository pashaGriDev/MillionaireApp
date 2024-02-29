// MillionaireApp, 2024

import UIKit
import SnapKit

final class QuestionImageCell: UICollectionViewCell {
    
    private let backgroundImageView = UIImageView()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //TODO: Убрать логику
    public func setupCell(image: ProgressImage, question number: Int, isCorrect: Bool) {
        var currentImage = image
        
        if image.number <= number {
            currentImage = ProgressImage(number: image.number, amount: image.amount, backgroundImage: .current)
            if (image.number == 5 || image.number == 10) && image.number != number {
                currentImage = ProgressImage(number: image.number, amount: image.amount, backgroundImage: image.backgroundImage)
            }
            if !isCorrect && image.number == number {
                currentImage = ProgressImage(number: image.number, amount: image.amount, backgroundImage: .wrong)
            }
        }
        
        backgroundImageView.image = currentImage.backgroundImage.image
        questionLabel.text = "Вопрос \(image.number)"
        if image.number == 15 {
            amountLabel.text = "1 Миллион"
        } else {
            amountLabel.text = "\(image.amount) RUB"
        }
    }
    //TODO: Убрать?
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundImageView.image = nil
        questionLabel.text = nil
        amountLabel.text = nil
    }
    
    private func setupLayout() {
        contentView.addSubviews([backgroundImageView, questionLabel, amountLabel])
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        questionLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
