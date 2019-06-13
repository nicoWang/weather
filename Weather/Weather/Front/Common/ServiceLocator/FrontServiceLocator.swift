import Foundation

class FrontServiceLocator: ServiceLocatorModule {
    func registerServices(serviceLocator: ServiceLocator) {
        serviceLocator.register { self.provideSearchViewController() }
    }
    
    private func provideSearchViewController() -> SearchViewController {
        let viewController = SearchViewController()
        viewController.searchPresenter = SearchPresenter(
            view: viewController,
            usecase: ServiceLocator.inject()
        )
        return viewController
    }
}
