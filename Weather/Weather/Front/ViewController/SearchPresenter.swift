import Foundation
import PromiseKit

class SearchPresenter: Presenter {
    
    private weak var view: BaseView?
    private let usecase: CityClimateUseCase
    
    init(
        view: BaseView,
        usecase: CityClimateUseCase
        ) {
        self.view = view
        self.usecase = usecase
    }
    
    func viewDidLoad() {
        usecase.execute(city: "Buenos Aires").done { city in
            print(city)
        }
    }
}
