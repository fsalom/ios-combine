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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    func setupBindings() {
        viewModel.$response
                    .receive(on: DispatchQueue.main)
                    .sink(receiveValue: { (response) in
                        //self.label.text = response.message
                    })
                    .store(in: &cancellables)
    }
}

struct Response: Codable {
    let message: String
}
