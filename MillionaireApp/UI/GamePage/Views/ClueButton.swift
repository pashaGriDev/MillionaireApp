// MillionaireApp, 2024

import UIKit
import SnapKit

final class ClueButton: UIButton {
    
    private let width: CGFloat = 107
    private let height: CGFloat = 83
    
    init(imageName: String) {
        super.init(frame: .zero)
        
        let image = UIImage(named: imageName)
        setImage(image, for: .normal)
        
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
