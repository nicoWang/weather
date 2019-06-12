

import Foundation

class CoreServiceLocator: ServiceLocatorModule {
    func registerServices(serviceLocator: ServiceLocator) {
        serviceLocator.register { self.provideWeatherRepository() }
        serviceLocator.register { self.provideCityClimateUsecase() }
    }
    
    private func provideWeatherRepository() -> WeatherRepository {
        return WeatherRepository()
    }
    
    private func provideCityClimateUsecase() -> CityClimateUseCase {
        return CityClimateUseCase(repository: ServiceLocator.inject())
    }
}
