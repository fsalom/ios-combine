import Foundation
import UIKit
import Combine

final class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var cancellables = Set<AnyCancellable>()
    var viewModel: HomeViewModelProtocol!

    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required public init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        viewModel.viewDidLoad()
        setupBindings()
        configure()
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    func setupBindings() {
        viewModel.cryptosPublisher
                    .receive(on: DispatchQueue.main)
                    .sink(receiveValue: { (response) in
                        self.tableView.reloadData()
                    })
                    .store(in: &cancellables)
    }

    func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UINib(nibName: "CryptoCell", bundle: nil),
                                forCellReuseIdentifier: "CryptoCell")
        self.tableView.rowHeight = 60
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cryptos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoCell
        cell.crypto = viewModel.cryptos[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
