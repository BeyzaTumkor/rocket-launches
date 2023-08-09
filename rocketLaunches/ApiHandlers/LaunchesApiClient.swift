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
    
    //making this variable to be able to access it when appending data to the list view
    var allLaunches: [Launch] = []
  
    //this function is to do a get call on the api and decode the returning json into the model i have made.
    func fetchLaunchesFromAPI() async throws -> [Launch] {
        let url = URL(string: "https://ll.thespacedevs.com/2.2.0/launch/upcoming/")!
        let (data, _) = try await URLSession.shared.data(from:url)

        let decoded = try JSONDecoder().decode(AllLaunches.self, from: data)
        
        
        return decoded.results
       // allLaunches = decoded.results
    }
    
    //made this to download the image from the image url that is included in the data from the api
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
