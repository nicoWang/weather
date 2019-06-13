import Foundation

struct Climate: Codable {
    var coord: Coordinates?
    var weather: [Weather]?
    var sys: Sys?
    var base: String?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var id: Int?
    var name: String?
    var cod: Int?
}

struct Coordinates: Codable {
    var lon: Double?
    var lat: Double?
}

struct Sys: Codable {
    var country: String?
    var sunrise: Double?
    var sunset: Double?
}

struct Weather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Wind: Codable {
    var speed: Double?
    var deg: Double?
}

struct Clouds: Codable {
    var all: Double?
}
