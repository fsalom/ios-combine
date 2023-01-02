import Foundation

struct DataNetworkResponse<T: Codable>: Codable {
    let data: T?

    init(data: T?) {
        self.data = data
    }
}
