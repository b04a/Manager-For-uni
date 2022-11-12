//
//  apiCell.swift
//  testAPI
//
//  Created by Danil Bochkarev on 30.10.2022.
//

import Foundation

struct ApiCell {
    func getPosts(compHandler: @escaping (CurrentWeather) -> Void) {
        
        
        let urlString = "https://api.open-meteo.com/v1/gfs?latitude=55.75&longitude=49.12&daily=temperature_2m_max,temperature_2m_min&timezone=Europe%2FMoscow"
        
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url!) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    compHandler(currentWeather)
                                    
                }
            }
        }
        task.resume()
    }


    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()

        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData)
                else {
                return nil
            }
            return currentWeather
            
                    
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
