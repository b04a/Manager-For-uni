//
//  CurrentWeather.swift
//  testAPI
//
//  Created by Danil Bochkarev on 02.11.2022.
//

import Foundation


struct CurrentWeather {
    let oneDate : String
    var oneDateStr : String {
        return "\(formatterNub(time: oneDate))"
    }
    
    let twoDate : String
    var twoDateStr : String {
        return "\(formatterNub(time: twoDate))"
    }
    
    let threeDate : String
    var threeDateStr : String {
        return "\(formatterNub(time: threeDate))"
    }
    
    let fourDate : String
    var fourDateStr : String {
        return "\(formatterNub(time: fourDate))"
    }
    
    let fiveDate : String
    var fiveDateStr : String {
        return "\(formatterNub(time: fiveDate))"
    }
    
    let sixDate : String
    var sixDateStr : String {
        return "\(formatterNub(time: sixDate))"
    }
    
    let sevenDate : String
    var sevenDateStr : String {
        return "\(formatterNub(time: sevenDate))"
    }
    
    let oneDateTempMin : Double
    let twoDateTempMin : Double
    let threeDateTempMin : Double
    let fourdayDateTempMin : Double
    let fiveDateTempMin : Double
    let sixDateTempMin : Double
    let sevenDateTempMin : Double
    let oneDateTempMax : Double
    let twoDateTempMax : Double
    let threeDateTempMax : Double
    let fourdayDateTempMax : Double
    let fiveDateTempMax : Double
    let sixDateTempMax : Double
    let sevenDateTempMax : Double
    
    init?(currentWeatherData: CurrentWeatherData) {
        oneDate = currentWeatherData.daily.time[0]
        twoDate = currentWeatherData.daily.time[1]
        threeDate = currentWeatherData.daily.time[2]
        fourDate = currentWeatherData.daily.time[3]
        fiveDate = currentWeatherData.daily.time[4]
        sixDate = currentWeatherData.daily.time[5]
        sevenDate = currentWeatherData.daily.time[6]
        
        oneDateTempMin = currentWeatherData.daily.temperature2MMin[0]
        twoDateTempMin = currentWeatherData.daily.temperature2MMin[1]
        threeDateTempMin = currentWeatherData.daily.temperature2MMin[2]
        fourdayDateTempMin = currentWeatherData.daily.temperature2MMin[3]
        fiveDateTempMin = currentWeatherData.daily.temperature2MMin[4]
        sixDateTempMin = currentWeatherData.daily.temperature2MMin[5]
        sevenDateTempMin = currentWeatherData.daily.temperature2MMin[6]
        
        oneDateTempMax = currentWeatherData.daily.temperature2MMax[0]
        twoDateTempMax = currentWeatherData.daily.temperature2MMax[1]
        threeDateTempMax = currentWeatherData.daily.temperature2MMax[2]
        fourdayDateTempMax = currentWeatherData.daily.temperature2MMax[3]
        fiveDateTempMax = currentWeatherData.daily.temperature2MMax[4]
        sixDateTempMax = currentWeatherData.daily.temperature2MMax[5]
        sevenDateTempMax = currentWeatherData.daily.temperature2MMax[6]
    }

    func formatterNub(time : String) -> String {
        let a = time
        var result = 0
        var main = ""

        for character in a {
            result += 1
            if result == 9 || result == 10 {
                main += String(character)
            }
        }

        return main
    }
}
