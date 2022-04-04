//
//  Configuration.swift
//  pawsome
//
//  Created by Nhuja Shakya on 3/28/22.
//

import Foundation

struct DeploymentMode: OptionSet {
    typealias RawValue = Int
    
    static func ==(lhs: DeploymentMode, rhs: DeploymentMode) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    var rawValue: DeploymentMode.RawValue
    static let uat: DeploymentMode = DeploymentMode(rawValue: 0)
    static let live: DeploymentMode = DeploymentMode(rawValue: 1)
    static let local: DeploymentMode = DeploymentMode(rawValue: 2)
}

struct Configuration {
    let baseURL: String
    
    static var conf: Configuration {
        switch deploymentMode {
        case .local:
            return Configuration(
                baseURL: "http://localhost:5000/api/")
        case .uat:
            return Configuration(
                baseURL: "https://pawsome-server.herokuapp.com/api/")
        default:
            return Configuration(
                baseURL: "https://pawsome-server.herokuapp.com/api/")
        }
    }
}
