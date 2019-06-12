import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var presenter: Presenter! {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
}

extension BaseViewController: BaseView {
    func hideLoading() {
        Loader.sharedLoader.hide()
    }
    
    func showLoading() {
        Loader.sharedLoader.start()
    }
    
    func showAlert(with error: Error) {
        let error = handleError(error: error)
        let alertViewController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
    
    private func handleError(error: Error) -> Error {
        if let baseError = error as? BaseErrorApp {
            return baseError.baseError
        } else {
            return error
        }
    }
}
