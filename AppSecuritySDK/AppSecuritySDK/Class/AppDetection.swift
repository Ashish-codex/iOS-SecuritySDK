//
//  ISGDetectRemorteApplication.swift
//  ISGSecuritySDK
//
//  Created by ASHISH on 29/11/22.
//

import Foundation
import UIKit



class AppDetection {
    
    

    public static func leDetectMaliciousApp(appList: [MaliciousAppModel], complition: (_ detectedAppList:[MaliciousAppModel])->Void ) -> Void{
        
        guard appList.count > 0 else{
            complition(appList)
            return
        }
        
        
        var arrDetectedApp:[MaliciousAppModel] = []
        
        for app in appList{
            if UIApplication.shared.canOpenURL(URL(string: "\(app.urlScheme)://")! ){
                arrDetectedApp.append(app)
            }
        }
        
        complition(arrDetectedApp)
        return
    }
      
    
}
