//
//  Launch.swift
//  rocketLaunches
//
//  Created by Beyza Tumkor on 8/5/23.
//

import Foundation

struct AllLaunches {
    let results: [Launch]
}

struct Launch {
    var id: String
    var url: String?
    var slug: String?
    var name: String
    //var status: KeyValuePairs<Any, Any>?
    var lastUpdated: String?
    var net: String?
    var windowEnd: String?
    var windowStart: String?
    //var netPrecision: KeyValuePairs<Any, Any>
    var probability: Int?
    var weatherConcerns: String?
    var holdReason: String?
    var failReason: String?
//    var hashtag: String
    //var launchServiceProvider: KeyValuePairs<Any, Any>
    //var rocketInfo: KeyValuePairs<Any, Any>
    //var mission: KeyValuePairs<Any, Any>
    //var pad: KeyValuePairs<Any, Any>
    var webcastLive: Bool?
    var imageLink: String?
    //var infoGraphic: String
    var program: [String]?
    var orbitalLaunchAttemptCount: Int?
    var locationLaunchAttemptCount: Int?
    var padLaunchAttemptCount: Int?
    var agencyLaunchAttemptCount: Int?
    var orbitalLaunchAttemptCountYear: Int?
    var locationLaunchAttemptCountYear: Int?
    var padLaunchAttemptCountYear: Int?
    var agencyLaunchAttemptCountYear: Int?
    
}
struct Wrapper {
    let items : [Launch]
}

extension Launch: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case url = "url"
        case slug = "slug"
        case name = "name"
        //case status = "status"
        case lastUpdated = "last_updated"
        case net = "net"
        case windowEnd = "window_end"
        case windowStart = "window_start"
        //case netPrecision = "net_precision"
        case probability = "probability"
        case weatherConcerns = "weather_concerns"
        case holdReason = "holdreason"
        case failReason = "failreason"
       
        //case launchServiceProvider = "launch_service_provider"
        //case rocketInfo = "rocket_info"
        //case mission = "mission"
        //case pad = "pad"
        case webcastLive = "webcast_live"
        case imageLink = "image"
       // case infoGraphic = "info_graphic"
        case program = "program"
        case orbitalLaunchAttemptCount = "orbital_launch_attempt_count"
        case locationLaunchAttemptCount = "location_launch_attempt_count"
        case padLaunchAttemptCount = "pad_launch_attempt_count"
        case agencyLaunchAttemptCount = "agency_launch_attempt_count"
        case orbitalLaunchAttemptCountYear = "orbital_launch_attempt_count_year"
        case locationLaunchAttemptCountYear = "location_launch_attempt_count_year"
        case padLaunchAttemptCountYear = "pad_launch_attempt_count_year"
        case agencyLaunchAttemptCountYear = "agency_launch_attempt_count_year"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(String.self, forKey: .id)!
        self.url = try values.decodeIfPresent(String.self, forKey: .url)
        self.slug = try values.decodeIfPresent(String.self, forKey: .slug)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)!
        self.lastUpdated = try values.decodeIfPresent(String.self, forKey: .lastUpdated)
        self.net = try values.decodeIfPresent(String.self, forKey: .net)
        self.windowEnd = try values.decodeIfPresent(String.self, forKey: .windowEnd)
        self.windowStart = try values.decodeIfPresent(String.self, forKey: .windowStart)
        self.probability = try values.decodeIfPresent(Int.self, forKey: .probability)
        self.weatherConcerns = try values.decodeIfPresent(String.self, forKey: .weatherConcerns)
        self.holdReason = try values.decodeIfPresent(String.self, forKey: .holdReason)
        self.failReason = try values.decodeIfPresent(String.self, forKey: .failReason)
        self.webcastLive = try values.decodeIfPresent(Bool.self, forKey: .webcastLive)
        self.imageLink = try values.decodeIfPresent(String.self, forKey: .imageLink)
        self.program = try values.decodeIfPresent([String].self, forKey: .program)
        self.orbitalLaunchAttemptCount = try values.decodeIfPresent(Int.self, forKey: .orbitalLaunchAttemptCount)
        self.locationLaunchAttemptCount = try values.decodeIfPresent(Int.self, forKey: .locationLaunchAttemptCount)
        self.padLaunchAttemptCount = try values.decodeIfPresent(Int.self, forKey: .padLaunchAttemptCount)
        self.agencyLaunchAttemptCount = try values.decodeIfPresent(Int.self, forKey: .agencyLaunchAttemptCount)
        self.orbitalLaunchAttemptCountYear = try values.decodeIfPresent(Int.self, forKey: .orbitalLaunchAttemptCountYear)
        self.locationLaunchAttemptCountYear = try values.decodeIfPresent(Int.self, forKey: .orbitalLaunchAttemptCountYear)
        self.padLaunchAttemptCountYear = try values.decodeIfPresent(Int.self, forKey: .padLaunchAttemptCountYear)
        self.agencyLaunchAttemptCountYear = try values.decodeIfPresent(Int.self, forKey: .agencyLaunchAttemptCountYear)

    }
    
}


extension AllLaunches: Decodable {
    enum CodingKeys: String, CodingKey{
        case results = "results"
    }
}



//#if DEBUG
//extension Launch{
//    static var SampleData: [Launch] =
//    [
//
//        Launch(
//            id: "ce0089c7-c61c-46a2-a9c1-10f2d6d066f0",
//            url: "https://ll.thespacedevs.com/2.2.0/launch/ce0089c7-c61c-46a2-a9c1-10f2d6d066f0/",
//            slug: "falcon-9-block-5-starlink-group-6-8",
//            name: "Falcon 9 Block 5 | Starlink Group 6-8",
//            status:[
//                "id": 1,
//                "name":"Go for Launch",
//                "abbrev": "Go",
//                "description": "Current T-0 confirmed by official or reliable sources."
//            ],
//            lastUpdated: "2023-08-06T07:14:05Z",
//            net: "2023-08-07T01:00:00Z",
//            windowEnd: "2023-08-07T04:22:00Z",
//            windowStart: "2023-08-07T01:00:00Z",
//            netPrecision: [
//                "id": 1,
//                "name": "Minute",
//                "abbrev": "MIN",
//                "description": "The T-0 is accurate to the minute."
//            ],
//            probability: 30,
//            weatherConcerns: "Cumulus Cloud Rule, Anvil Cloud Rules, Surface Electric Fields Rule",
//            holdReason: "",
//            failReason: "",
//            hashtag: nil,
//            launchServiceProvider: [
//                "id": 121,
//                "url": "https://ll.thespacedevs.com/2.2.0/agencies/121/",
//                "name": "SpaceX",
//                "type": "Commercial"
//            ],
//            rocketInfo: [
//                "id": 7862,
//                "configuration": [
//                    "id": 164,
//                    "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/164/",
//                    "name": "Falcon 9",
//                    "family": "Falcon",
//                    "full_name": "Falcon 9 Block 5",
//                    "variant": "Block 5"
//                ]
//            ],
//            mission: [
//                "id": 6370,
//                "name": "Starlink Group 6-8",
//                "description": "A batch of 22 satellites for the Starlink mega-constellation - SpaceX's project for space-based Internet communication system.",
//                "launch_designator": NULL,
//                "type": "Communications",
//                "orbit": [
//                    "id": 8,
//                    "name": "Low Earth Orbit",
//                    "abbrev": "LEO"
//                ],
//                "agencies": [
//                    [
//                        "id": 121,
//                        "url": "https://ll.thespacedevs.com/2.2.0/agencies/121/",
//                        "name": "SpaceX",
//                        "featured": true,
//                        "type": "Commercial",
//                        "country_code": "USA",
//                        "abbrev": "SpX",
//                        "description": "Space Exploration Technologies Corp., known as SpaceX, is an American aerospace manufacturer and space transport services company headquartered in Hawthorne, California. It was founded in 2002 by entrepreneur Elon Musk with the goal of reducing space transportation costs and enabling the colonization of Mars. SpaceX operates from many pads, on the East Coast of the US they operate from SLC-40 at Cape Canaveral Space Force Station and historic LC-39A at Kennedy Space Center. They also operate from SLC-4E at Vandenberg Space Force Base, California, usually for polar launches. Another launch site is being developed at Boca Chica, Texas.",
//                        "administrator": "CEO: Elon Musk",
//                        "founding_year": "2002",
//                        "launchers": "Falcon | Starship",
//                        "spacecraft": "Dragon",
//                        "launch_library_url": "https://launchlibrary.net/1.4/agency/121",
//                        "total_launch_count": 266,
//                        "consecutive_successful_launches": 27,
//                        "successful_launches": 256,
//                        "failed_launches": 10,
//                        "pending_launches": 121,
//                        "consecutive_successful_landings": 136,
//                        "successful_landings": 218,
//                        "failed_landings": 19,
//                        "attempted_landings": 237,
//                        "info_url": "http://www.spacex.com/",
//                        "wiki_url": "http://en.wikipedia.org/wiki/SpaceX",
//                        "logo_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/logo/spacex_logo_20220826094919.png",
//                        "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/spacex_image_20190207032501.jpeg",
//                        "nation_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/spacex_nation_20230531064544.jpg"
//                    ]
//                ]
//            ],
//            pad: [
//                "id": 80,
//                "url": "https://ll.thespacedevs.com/2.2.0/pad/80/",
//                "agency_id": 121,
//                "name": "Space Launch Complex 40",
//                "info_url": NULL,
//                "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40",
//                "map_url": "https://www.google.com/maps?q=28.56194122,-80.57735736",
//                "latitude": "28.56194122",
//                "longitude": "-80.57735736",
//                "location": [
//                    "id": 12,
//                    "url": "https://ll.thespacedevs.com/2.2.0/location/12/",
//                    "name": "Cape Canaveral, FL, USA",
//                    "country_code": "USA",
//                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
//                    "timezone_name": "America/New_York",
//                    "total_launch_count": 899,
//                    "total_landing_count": 36
//                ],
//                "country_code": "USA",
//                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
//                "total_launch_count": 192,
//                "orbital_launch_attempt_count": 192
//            ],
//            webcastLive: false,
//            imageLink: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_image_20230522082133.png",
//            infoGraphic: NULL,
//            program: [],
//            orbitalLaunchAttemptCount: 6475,
//            locationLaunchAttemptCount: 900,
//            padLaunchAttemptCount: 193,
//            agencyLaunchAttemptCount: 267,
//            orbitalLaunchAttemptCountYear: 118,
//            locationLaunchAttemptCountYear: 32,
//            padLaunchAttemptCountYear: 30,
//            agentLaunchAttemptCountYear: 54
//        )
//    ]
//}
//#endif
