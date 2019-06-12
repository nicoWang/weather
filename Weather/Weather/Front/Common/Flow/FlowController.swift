import Foundation
import UIKit

class FlowController {
    
    private var navigation: UINavigationController?
    
    func start() -> UINavigationController {
        let viewController: SearchViewController = ServiceLocator.inject()
        navigation = UINavigationController(rootViewController: viewController)
        return navigation!
    }
    
}
