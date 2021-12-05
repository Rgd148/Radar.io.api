//
//  ViewController.swift
//  Radar.io.api
//
//  Created by Raghad Alahmadi on 28/04/1443 AH.
//




import UIKit
import Foundation

struct AddressInfo: Codable {
    let meta: Meta
    let addresses: [Address]
}

// MARK: - Address
struct Address: Codable {
    let latitude, longitude: Double
    let geometry: Geometry
    let country, countryCode, countryFlag: String
    let distance: Int
    let borough, city, number, neighborhood: String
    let postalCode, stateCode, state, street: String
    let layer, formattedAddress, placeLabel: String
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

// MARK: - Meta
struct Meta: Codable {
    let code: Int
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getAddress()
    }

    func getAddress(){
        let urlSession = URLSession.shared

        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.radar.io"
        urlComponents.path = "/v1/search/autocomplete"
        
        
        
        let query1 = URLQueryItem(name: "query", value: "brooklyn+roasting")
        urlComponents.queryItems = [query1]
        
//        let query2 = URLQueryItem(name: "near" , value: "40.70390,-73.98670")
       // urlComponents.queryItems = [query2]
        
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        
        urlRequest.allHTTPHeaderFields = ["Authorization":"prj_live_pk_178da382ad860afb4537623f61d623af6e524e92"]
     let task = urlSession.dataTask(with: urlRequest) { ( data: Data?, response: URLResponse?, error: Error?) in
      //   print(String(data: data!, encoding: .utf8))
//           let task = urlSession.downloadTask(with: urlRequest) { (data: Data? , response: URLResponse?, error: Error? ) in

            do{
                let jsonDecoder = JSONDecoder()
                let response = try jsonDecoder.decode(AddressInfo.self, from: data!)
               

                print(response)
                print("data fetch")
            }
            catch {
                print("Erorr fetching the data : \(error)")
            }
    }
        task.resume()
        
       
//        let task1 = urlSession.downloadTask(with: urlRequest) { URL?, URLResponse?, Error? in
//
//        }
        
        

}

}






//

//class AddressResponse : Codable {
//    var addresses: [AddressesInfo] = []
//}
//
//struct AddressesInfo: Codable{
//
//    var  latitude : Float
//    var longitude : Float
//   var geometry : GeometryInfo
//     var country: String
//              var countryCode: String
//              var distance: Int
//              var city: String
//              var  postalCode: Int
//              var state: String
//              var street: String
//              var layer: String
//              var formattedAddress: String
//              var placeLabel: String
//
//}
//struct GeometryInfo: Codable{
//    var type: String
//    var coordinates: [Float]
//
//}
//
//
//
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        getAddress()
//    }
//
//
//
//    func getAddress(){
//
//
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "api.radar.io"
//        urlComponents.path = "/search/autocomplete"
//
//        let query1 = URLQueryItem(name: "query", value: "brooklyn+roasting")
//        urlComponents.queryItems = [query1]
//
//        let query2 = URLQueryItem(name: "near" , value: "40.70390,-73.98670")
//        urlComponents.queryItems = [query2]
//
//        let urlSession = URLSession.shared
//
//
//        var urlRequest = URLRequest(url: urlComponents.url!)
//        urlRequest.httpMethod = "GET"
//        urlRequest.allHTTPHeaderFields = ["Authorization":"prj_live_pk_50aa85d22767bb4c45174f6c086e964d3a444f8a"]
//
//
//
//     let task = urlSession.dataTask(with: urlRequest) { ( data: Data?, response: URLResponse?, error: Error?) in
//
//       //    let task = urlSession.downloadTask(with: urlRequest) { (data: Data? , response: URLResponse?, error: Error? ) in
//
//            do{
//                let jsonDecoder = JSONDecoder()
//                let response = try jsonDecoder.decode(AddressResponse.self, from: data!)
//                print(response.addresses)
//            }
//            catch {
//                print("Erorr fetching the data : \(error)")
//            }
//    }
//        task.resume()
//
//
//
//
//
//
//
//}
//
//}

