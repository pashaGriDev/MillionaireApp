// MillionaireApp, 2024

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    func start()
}

class AppCoordinator: AppCoordinatorProtocol {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let viewController = StartViewController()
        navigation.setViewControllers([viewController], animated: false)
    }
}
