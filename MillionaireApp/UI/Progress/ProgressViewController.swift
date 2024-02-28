// MillionaireApp, 2024

import UIKit
import SnapKit

final class ProgressViewController: UIViewController {
    
    private let imagesModel = ProgressImage.mockModel()
    
    //TODO: Временная переменная. Хранит текущий номер вопроса
    private var currentQuestion: Int = 1
    private var isCorrectQuestion: Bool = true
    
    private lazy var questionCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(QuestionImageCell.self, forCellWithReuseIdentifier: QuestionImageCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
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

    
    convenience init(currentQuestion: Int, isCorrectQuestion: Bool) {
        self.init()
        self.currentQuestion = currentQuestion
        self.isCorrectQuestion = isCorrectQuestion
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    
    //MARK: layout
    
    private func setupLayout() {
        view.addSubviews([backgroundImageView,
                         logoImageView,
                         questionCollectionView])
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(80)
        }
        
        questionCollectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(40)
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
        }
    }
}


//MARK: - collection dataSource/delegate

extension ProgressViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionImageCell.identifier, for: indexPath) as! QuestionImageCell
        cell.setupCell(image: imagesModel[indexPath.item], question: currentQuestion, isCorrect: isCorrectQuestion)
        return cell
    }
}

extension ProgressViewController: UICollectionViewDelegateFlowLayout {
    var inset: CGFloat { return 10 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = (collectionView.bounds.height - inset * 14) / 15
        return CGSize(width: width, height: height)
    }
}
