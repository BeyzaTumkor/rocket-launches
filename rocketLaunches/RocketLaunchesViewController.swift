//
//  RocketLaunchesApp.swift
//  rocketLaunches
//
//  Created by Beyza Tumkor on 8/5/23.
//

import SwiftUI

import UIKit

struct launchesArray {
    static var launches: [Launch] = [];
}

class RocketLaunchesViewController: UIViewController  ,UITableViewDelegate{
    
    private let cellIdentifier = String(describing: LaunchesTableViewCell.self)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LaunchesTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
       
        return tableView
    }()
    
    
    
    lazy var dataSource: UITableViewDiffableDataSource<Section, Row> = {
        let dataSource: UITableViewDiffableDataSource<Section, Row> = UITableViewDiffableDataSource(tableView: tableView){ tableView, indexPath, row in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as! LaunchesTableViewCell
            cell.name = row.name
            cell.location = row.location
            cell.launchTime = row.launchTime
            return cell
        }
        return dataSource
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = dataSource
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
      
 
        Task{
            do{
                let results =  try await LaunchesApiClient().fetchLaunchesFromAPI()
                for launch in results{
                    launchesArray.launches.append(launch)
                }
                
            }catch{
                print(error)
            }
        }
    
        snapshots()
        tableView.reloadData()
    }
    
    func snapshots(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Row>()
        var section = Section(name: "name")
        snapshot.appendSections([section])
        
        let rows = getData()
        snapshot.appendItems(rows, toSection: section)
        dataSource.apply(snapshot)
    }
    
    func getData() -> [Row] {
       [
            .init(name: "launch.name"),
            .init(location: "lol"),
            .init(launchTime: "10:20")
        ]
        
    }
}


struct Section: Hashable {
    var id = UUID().uuidString
    var name: String?
    var location: String?
    var launchTime: String?
}

struct Row: Hashable {
    var id = UUID().uuidString
    var name: String?
    var location: String?
    var launchTime: String?
}


class LaunchesTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    let locationLabel = UILabel()
    var location: String? {
        didSet {
            locationLabel.text = location
        }
    }
    let launchTimeLabel = UILabel()
    var launchTime: String? {
        didSet {
            launchTimeLabel.text = launchTime
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addLabels()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    func addLabels(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        contentView.addSubview(nameLabel)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textColor = .black
        contentView.addSubview(locationLabel)
        
        launchTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        launchTimeLabel.textColor = .black
        contentView.addSubview(launchTimeLabel)
        
    }


}
//
