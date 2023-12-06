//
//  ViewController.swift
//  weak9_p
//
//  Created by 유철민 on 12/6/23.
//

import UIKit
import Alamofire

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class ViewController: UIViewController {
    
    var iconURL = "https://openweathermap.org/img/wn/"
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    func updateUI(with info: Response) {
        weather.text = info.weather
        // 화씨를 섭씨로 변환하여 표시
        if let fahrenheitTemp = Double(info.temperature) {
            let celsiusTemp = fahrenheitTemp//fahrenheitToCelsius(fahrenheit: fahrenheitTemp)
            temperature.text = "\(celsiusTemp) °C"
        } else {
            temperature.text = "N/A"
        }
        weatherIcon.load(url: URL(string: iconURL + info.weatherIcon + "@2x.png")!)
    }
    
    @IBAction func showSeoul(_ sender: Any) {
        city.text = "Seoul"
        callWeather(feedAPIInput: FeedAPIInput(lat : 37.56667 , lon: 126.97806)) { result in
            switch result {
            case .success(let info):
                self.updateUI(with: info)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction func showDaejeon(_ sender: Any) {
        city.text = "Daejeon"
        callWeather(feedAPIInput: FeedAPIInput(lat: 36.35111, lon: 127.38500)) { result in
            switch result {
            case .success(let info):
                self.updateUI(with: info)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction func showBusan(_ sender: Any) {
        city.text = "Busan"
        callWeather(feedAPIInput: FeedAPIInput(lat: 35.17944, lon: 129.07556)) { result in
            switch result {
            case .success(let info):
                self.updateUI(with: info)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //time
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var current_date_string = formatter.string(from: Date())
        time.text = current_date_string
    }
    
    //    func callWeather(feedAPIInput : FeedAPIInput) -> response{
    //
    //        var weather : String
    //        var temperature : String
    //        var weatherIcon : String
    //
    //        //호출하고 저기에 정리
    //        AF.request("https://api.openweathermap.org/data/2.5/weather?", method: .get, parameters: feedAPIInput).validate().responseDecodable(of: [FeedAPIOutput].self) { response in
    //            switch response.result{
    //            case .success(let result):
    //                print("성공")
    //            case .failure(let error):
    //                print(error.localizedDescription)
    //            }
    //        }
    //
    //
    //        return response(weather: <#T##String#>, temperature: <#T##String#>, weatherIcon: <#T##String#>)
    //    }
    
    func callWeather(feedAPIInput: FeedAPIInput, completion: @escaping (Result<Response, Error>) -> Void) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?", method: .get, parameters: feedAPIInput).validate().responseDecodable(of: FeedAPIOutput.self) { response in
            switch response.result {
            case .success(let result):
                if let weather = result.weather?.first?.main,
                   let temperature = result.main?.temp,
                   let weatherIcon = result.weather?.first?.icon {
                    let response = Response(weather: weather, temperature: "\(temperature)", weatherIcon: weatherIcon)
                    completion(.success(response))
                } else {
                    completion(.failure(NSError(domain: "Parsing Error", code: 0, userInfo: nil)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fahrenheitToCelsius(fahrenheit: Double) -> String {
        let celsius = String((fahrenheit - 32) / 1.8)
        return celsius
    }
    
    
}

class Response{
    var weather : String
    var temperature : String
    var weatherIcon : String
    
    init(weather: String, temperature: String, weatherIcon: String) {
        self.weather = weather
        self.temperature = temperature
        self.weatherIcon = weatherIcon
    }
}
