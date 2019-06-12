//
//  WeatherRepository.swift
//  Weather
//
//  Created by Nicolas on 12/06/2019.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import Foundation
import PromiseKit

class WeatherRepository: BaseApiManager {
    func RequestWeather(from place: String) -> Promise<Climate> {
            return Promise<Climate> { seal  in
                
                request(url: Constants.mainUrl, method: .get, parameters: nil, headers: nil).done { response in
                    
                    guard let climate = try? JSONDecoder().decode(Climate.self, from: response) else { return                     seal.reject(BaseError.undefined) }
                    
                    seal.fulfill(climate)
                    }.catch { error in
                        seal.reject(BaseError.undefined)
                }
        }
    }
}
