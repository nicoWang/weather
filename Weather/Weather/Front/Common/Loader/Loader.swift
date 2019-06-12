import UIKit

class Loader: UIView {
    
    static var sharedLoader: Loader = Loader.loadFromXib()

    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var frontWindow: UIWindow?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeUI()
    }
    
    private func customizeUI() {
        self.frontWindow = UIApplication.shared.keyWindow
        holderView.cornerRadius(radius: 4)
    }
    
    func start() {
        isHidden = false
        frontWindow?.endEditing(true)
        frontWindow?.addSubview(self)
        activity.startAnimating()
    }
    
    func hide() {
        activity.stopAnimating()
        isHidden = true
        self.removeFromSuperview()
    }
}
