// MillionaireApp, 2024

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    func start()
    func showRulesScreen()
    func showProgressScreen(questionNumber: Int, result: Bool, money: Int)
    func showResultScreen(with result: Int)
    func showGameScreen()
    func pop()
}

class AppCoordinator: AppCoordinatorProtocol {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let viewController = StartViewController()
        viewController.coordinator = self
        navigation.setViewControllers([viewController], animated: false)
    }
    
    func showRulesScreen() {
        let rulesViewController = RulesViewController()
        navigation.present(rulesViewController, animated: true)
    }
    
    func showProgressScreen(questionNumber: Int, result: Bool, money: Int) {
        let viewController = ProgressViewController(currentQuestion: questionNumber, isCorrectQuestion: result, money: money)
        viewController.coordinator = self
        navigation.pushViewController(viewController, animated: true)
    }
    
    func showResultScreen(with result: Int) {
        let viewController = ResultViewController(result: result)
        viewController.coordinator = self
        navigation.pushViewController(viewController, animated: true)
    }
    
    func showGameScreen() {
        let viewController = GameViewController()
        viewController.coordinator = self
        navigation.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigation.popViewController(animated: true)
    }
}
