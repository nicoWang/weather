import Foundation
import UIKit

extension UITableViewCell: NibLoadableView { }

extension UITableViewCell: ReusableView { }

extension UITableViewCell {
    func clearInit() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
}
