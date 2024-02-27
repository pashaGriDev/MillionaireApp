// MillionaireApp, 2024

import UIKit
import SnapKit

final class ProgressViewController: UIViewController {
    
    //TODO: Временная переменная. Хранит текущий номер вопроса
    private var currentQuestion: Int = 1
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .firstBackground
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: .imageLogo)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    
    //MARK: layout
    
    private func setupLayout() {
        view.addSubviews([backgroundImageView,
                         logoImageView])
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(80)
        }
    }
}
