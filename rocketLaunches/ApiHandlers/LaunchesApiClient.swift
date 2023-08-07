//
//  LauncesApiClient.swift
//  rocketLaunches
//
//  Created by Beyza Tumkor on 8/6/23.
//

import Foundation
import UIKit


class LaunchesApiClient {
    typealias JSON = [String: String]
    
//    static func getDataFromAPI(with completion: @escaping (JSON) -> ()){
//        let urlString = "https://ll.thespacedevs.com/2.2.0/launch/upcoming/"
//        let url = URL(string: urlString)
//
//        guard let unwrappedURL = url else {return}
//
//        let session = URLSession.shared
//        let task = session.dataTask(with: unwrappedURL) {(data, response, error) in
//           print("started")
//            guard let unwrappedData = data else {return}
//
//            do {
//                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! JSON
//                print(responseJSON)
//                completion(responseJSON)
//                print("got data")
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//
//    }
//
    func fetchLaunchesFromAPI() async throws -> [Launch]{
        let url = URL(string: "https://ll.thespacedevs.com/2.2.0/launch/upcoming/")!
        let (data, _) = try await URLSession.shared.data(from:url)

        let decoded = try JSONDecoder().decode(AllLaunches.self, from: data)
        return decoded.results
    }
    
    static func downloadImage(at urlString: String, completion: @escaping (Bool, UIImage?)->()){
        let url = URL(string: urlString)
        guard let unwrappedURL = url else {return}
        
        let request = URLRequest(url: unwrappedURL)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) {data, response, error in
            guard let data = data, let image = UIImage(data:data) else {completion(false, nil); return}
            completion(true, image)
        }
        task.resume()
    }
    

}
