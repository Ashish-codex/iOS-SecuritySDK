//
//  ViewController.swift
//  AppSecurityDemo
//
//  Created by Ashish Prajapati on 28/08/23.
//

import UIKit
import AppSecuritySDK


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if SecureSDK.isJailBroken {
            print(" isJailBroken true")
        }else{
            print(" isJailBroken false")
        }
        
        
        let arrApp = [
            MaliciousAppModel(appName: "AnyDesk", icon: "anydesk", urlScheme: "anydesk")
        ]
        
        
        
        SecureSDK.detectMaliciousApp(appList: arrApp) { detectedAppList in
            for app in detectedAppList{
                print("App : \(app.appName)")
            }
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }


    
    func cap() {
        
        if UIScreen().isCaptured {
            print(" isCaptured is true")
        }
        else{
            print(" isCaptured is false")
        }
    }
}

