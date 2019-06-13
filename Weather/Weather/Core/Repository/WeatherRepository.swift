import Foundation
import PromiseKit
import Alamofire

class WeatherRepository: BaseApiManager {
    func RequestWeather(from place: String) -> Promise<Climate> {
        var params = Parameters()
        params["city"] = place
            return Promise<Climate> { seal  in
                
                request(path: place, method: .get, parameters: params, headers: nil).done { response in
                    guard let climate = try? JSONDecoder().decode(Climate.self, from: response) else { return seal.reject(BaseError.undefined) }
                    seal.fulfill(climate)
                    }.catch { error in
                        seal.reject(BaseError.undefined)
                }
        }
    }
}
