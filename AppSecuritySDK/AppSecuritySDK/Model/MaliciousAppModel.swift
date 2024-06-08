//
//  ISGRemotAppModel.swift
//  ISGSecuritySDK
//
//  Created by isglocal admin on 01/12/22.
//

import Foundation


public struct MaliciousAppModel {
    public var appName, icon, urlScheme: String
    
    public init(appName: String, icon: String, urlScheme: String) {
        self.appName = appName
        self.icon = icon
        self.urlScheme = urlScheme
    }
}
