//
//  RocketLaunchesApp.swift
//  rocketLaunches
//
//  Created by Beyza Tumkor on 8/5/23.
//

import SwiftUI

@main
struct RocketLaunchesApp: App {
    var body: some Scene {
        WindowGroup{

            LaunchesView(launches: Launch.SampleData)
        }
    }
}
