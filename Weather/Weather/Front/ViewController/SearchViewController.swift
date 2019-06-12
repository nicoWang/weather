import UIKit

class SearchViewController: BaseViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchPresenter: SearchPresenter!
    
    override var presenter: Presenter {
        return searchPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func customizeUI() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
