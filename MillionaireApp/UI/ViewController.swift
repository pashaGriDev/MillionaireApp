//  MillionaireApp

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.text = "Hello World!"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 4) { [weak self] in
            guard let self else { return }
            label.alpha = 1
        }
    }
    
    private func setup() {
        view.backgroundColor = .lightGray
        
        view.addSubview(label)
        label.alpha = 0
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

