import Foundation

struct Climate: Codable {
    var coord: Coordinates?
    var weather: Weather?
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
    var lat: Int?
    var lon: Int?
}

struct Sys: Codable {
    var country: String?
    var sunrise: String?
    var sunset: String?
}

struct Weather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Wind: Codable {
    var speed: Int?
    var deg: Int?
}

struct Clouds: Codable {
    var all: Int?
}
