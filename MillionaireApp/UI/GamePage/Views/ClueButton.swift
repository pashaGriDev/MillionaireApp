// MillionaireApp, 2024

import UIKit
import SnapKit

final class ClueButton: UIButton {
    
    private let width: CGFloat = 107
    private let height: CGFloat = 83
    private let imageName: String
    private lazy var originalImage: UIImage = {
        let image = UIImage(named: imageName)
        return image ?? UIImage()
    }()
    
    init(imageName: String) {
        self.imageName = imageName
        super.init(frame: .zero)
        setImage(originalImage, for: .normal)
        
        snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(height)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
