import Foundation
import PromiseKit

class CityClimateUseCase {
    
    private let repository: WeatherRepository
    
    init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    func execute(city: String) -> Promise<Climate> {
        return self.repository.RequestWeather(from: city)
    }
}
