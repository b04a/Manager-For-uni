//
//  formmaterTimestamp.swift
//  testAPI
//
//  Created by Danil Bochkarev on 30.10.2022.
//

import Foundation

struct CurrentWeatherData : Codable {
    let daily : Daily
}

struct Daily : Codable {
    let time : [String]
    let temperature2MMax, temperature2MMin: [Double]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}
