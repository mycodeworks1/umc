//
//  FeedAPIInput.swift
//  weak9_p
//
//  Created by 유철민 on 12/6/23.
//

import Foundation

struct FeedAPIInput : Encodable{
    var lat : Double?
    var lon : Double?
    var appid : String? = "767274f3324ce52e8021f7f5cbae04fc"
    var units : String? = "metric"
}

struct FeedAPIOutput: Decodable {
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var name: String?
    var cod: Int?

    struct Weather: Decodable {
        var id: Int?
        var main: String?
        var description: String?
        var icon: String?
    }

    struct Main: Decodable {
        var temp: Double?
        var feels_like: Double?
        var temp_min: Double?
        var temp_max: Double?
        var pressure: Int?
        var humidity: Int?
        var sea_level: Int?
        var grnd_level: Int?
    }

    struct Wind: Decodable {
        var speed: Double?
        var deg: Int?
        var gust: Double?
    }

    struct Clouds: Decodable {
        var all: Int?
    }

    struct Sys: Decodable {
        var type: Int?
        var id: Int?
        var country: String?
        var sunrise: Int?
        var sunset: Int?
    }
}

