// MillionaireApp, 2024

import UIKit
import SnapKit
import AVFoundation

final class ProgressViewController: UIViewController {
        
    enum SoundFilenames: String {
        case successSound = "correctAnswerSound"
        case failureSound = "wrongAnswerSound"
    }
    
    weak var coordinator: AppCoordinator?
    
    private var timer: Timer?
    
    private var audioPlayer: AVAudioPlayer?
    
    private let imagesModel = ProgressImage.makeModel()
    
    //TODO: Input data from init()
    
    private let currentQuestion: Int
    private let isCorrectQuestion: Bool
    private let money: Int
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(QuestionImageCell.self, forCellWithReuseIdentifier: QuestionImageCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let backgroundImageView = UIImageView(image: .firstBackground)
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: .imageLogo)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    init(currentQuestion: Int, isCorrectQuestion: Bool, money: Int) {
        self.currentQuestion = currentQuestion
        self.isCorrectQuestion = isCorrectQuestion
        self.money = money
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupControllerBehavior()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        audioPlayer?.stop()
        timer = nil
    }
    
    //MARK: - private methods
    
    private func setup() {
        view.addSubviews([backgroundImageView, logoImageView, collectionView])
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(80)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(40)
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
        }
    }
        
    private func playSound(for filename: String) {
        guard let path = Bundle.main.path(forResource: filename, ofType: ".mp3") else {
            print("From AVAudio: Can't find filepath")
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            
        } catch {
            print("From AVAudio: \(error.localizedDescription)")
        }
    }
        
    private func setupControllerBehavior() {
        switch isCorrectQuestion {
        case true:
            playSound(for: SoundFilenames.successSound.rawValue)
            timer = .scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] _ in
                
                self?.coordinator?.pop()
            }
            
        case false:
            playSound(for: SoundFilenames.failureSound.rawValue)
            timer = .scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] _ in
                
                self?.coordinator?.showResultScreen(with: self?.money ?? 0)
            }
        }
    }
    
    private func getBackgroundImageForCell(at item: Int) -> ProgressImage {
        let initialImage = imagesModel[item]
        var image = initialImage
        
        if initialImage.number <= currentQuestion {
            image = ProgressImage(number: initialImage.number, amount: initialImage.amount, backgroundImage: .current)
            if (initialImage.number == 5 || initialImage.number == 10) && initialImage.number != currentQuestion {
                image = initialImage
            }
            if !isCorrectQuestion && initialImage.number == currentQuestion {
                image = ProgressImage(number: initialImage.number, amount: initialImage.amount, backgroundImage: .wrong)
            }
        }
        return image
    }
}


//MARK: - collection dataSource/delegate

extension ProgressViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionImageCell.identifier, for: indexPath) as! QuestionImageCell
        
        let imageForCell = getBackgroundImageForCell(at: indexPath.item)
        cell.setupCell(image: imageForCell)
        return cell
    }
}

extension ProgressViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = (collectionView.bounds.height - 10 * 14) / 15
        return CGSize(width: width, height: height)
    }
}

