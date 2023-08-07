//
//  RocketLaunchesApp.swift
//  rocketLaunches
//
//  Created by Beyza Tumkor on 8/5/23.
//

import SwiftUI


class RocketLaunchesViewController: UIViewController {
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("here")
        Task{
            do{
                let launches = try await LaunchesApiClient().fetchLaunchesFromAPI()
                print(launches)
                //LaunchesView(launches: launches)
            }catch{
                print(error)
            }
        }
//
        
//        var body: some Scene {
//            WindowGroup{
//                //LaunchesView(launches: Launch.SampleData[0])
//
//            }
//        }
        
        
    }
    

    
}
