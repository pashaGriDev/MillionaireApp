// MillionaireApp, 2024

import UIKit
import SnapKit
//TODO: Поменять нейминги
final class QuestionImageCell: UICollectionViewCell {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
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
    
    
    public func setupCell(image: ProgressImageModel) {
        backgroundImageView.image = image.backgroundImage.image
        questionLabel.text = "Вопрос \(image.number)"
        if image.number == 15 {
            amountLabel.text = "1 Миллион"
        } else {
            amountLabel.text = "\(image.amount) RUB"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundImageView.image = nil
        questionLabel.text = nil
        amountLabel.text = nil
    }
    
    private func setupLayout() {
        contentView.addSubviews([backgroundImageView,
                         questionLabel,
                         amountLabel])
        
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
