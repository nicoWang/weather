import Foundation
import Alamofire
import PromiseKit

class BaseApiManager {
    
    func request(path: String, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?) -> Promise<Data> {

        return Promise<Data> { seal in
            Alamofire.request(Constants.mainUrl, method: method, parameters: parameters, headers: headers).responseJSON { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        seal.fulfill(data)
                    } else {
                        seal.reject(BaseError.undefined)
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}
