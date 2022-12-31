//
//  HomeViewController.swift
//  ios-combine
//
//  Created by Fernando Salom Carratala on 28/12/22.
//

import Foundation
import UIKit
import Combine

final class HomeViewController: UIViewController {
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
                        print("COMBINE")
                        print(response)
                    })
                    .store(in: &cancellables)
    }
}

struct Response: Codable {
    let message: String
}
