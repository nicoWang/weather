import Foundation

class FlowControllerServiceLocator: ServiceLocatorModule {
    func registerServices(serviceLocator: ServiceLocator) {
        serviceLocator.registerSingleton(provideFlow())
    }
    
    func provideFlow() -> FlowController {
        return FlowController()
    }
}
