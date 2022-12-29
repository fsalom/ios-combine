//
//  HomeViewModel.swift
//  ios-combine
//
//  Created by Fernando Salom Carratala on 28/12/22.
//

import Foundation
import Combine

final class PostsViewModel: ObservableObject {
    @Published private(set) var response: Response?

    var infoUpdated: (() -> Void)?

    let router: HomeRouterProtocol

    var configurationsUpdated: (() -> Void)?
    var errorOcurred: ((Error) -> Void)?

    init(router: HomeRouterProtocol) {
        self.router = router
    }

    func viewDidLoad() {
    }

    func viewDidAppear() {
    }

    func viewDidDisappear() {
    }

    func fetch() {
        let url = URL(string: "https://example.com/api/data")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in
                // Maneja cualquier error o compleción aquí
            }, receiveValue: { [weak self] (response) in
                self?.response = response
            })
            .store(in: &cancellables)
    }
}
