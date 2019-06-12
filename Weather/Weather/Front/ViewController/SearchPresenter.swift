import Foundation

class SearchPresenter: Presenter {
    
    private weak var view: BaseView?
    
    init(view: BaseView) {
        self.view = view
    }
}
