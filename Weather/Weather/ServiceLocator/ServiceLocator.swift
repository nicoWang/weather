import Foundation

protocol ServiceLocatorModule {
    
    func registerServices(serviceLocator: ServiceLocator)
}

class ServiceLocator {
    static let sharedLocator = ServiceLocator()
    
    private var registry = [ObjectIdentifier: Any]()
    
    static func registerModules() {
        
        sharedLocator.registerModules([
            FlowControllerServiceLocator(),
            CoreServiceLocator(),
            FrontServiceLocator()
            ])
    }
    
    func register<Service>(_ factory: @escaping () -> Service) {
        let serviceId = ObjectIdentifier(Service.self)
        registry[serviceId] = factory
    }
    
    func registerSingleton<Service>(_ singletonInstance: Service) {
        let serviceId = ObjectIdentifier(Service.self)
        registry[serviceId] = singletonInstance
    }
    
    func registerModules(_ modules: [ServiceLocatorModule]) {
        modules.forEach { $0.registerServices(serviceLocator: self) }
    }
    
    static func registerModules(_ modules: [ServiceLocatorModule]) {
        sharedLocator.registerModules(modules)
    }
    
    static func inject<Service>() -> Service {
        return sharedLocator.inject()
    }
    
    private func inject<Service>() -> Service {
        let serviceId = ObjectIdentifier(Service.self)
        if let factory = registry[serviceId] as? () -> Service {
            return factory()
        } else if let singletonInstance = registry[serviceId] as? Service {
            return singletonInstance
        } else {
            fatalError("No registered entry for \(Service.self)")
        }
    }
}
