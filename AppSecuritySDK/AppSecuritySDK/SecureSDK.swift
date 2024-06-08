//
//  Sample.swift
//  AppSecuritySDK
//
//  Created by Ashish Prajapati on 28/08/23.
//

import Foundation
import UIKit

public class SecureSDK {
    
    
    /// isJailBroken return true if iPhone is jailbroken
    public static var isJailBroken: Bool {
        get{
            JailbreakDetection.isJailBroken
        }
    }
    
    
    /// detectMaliciousApp accept list of MaliciousAppModel into detecte, and it return  MaliciousAppModel list. Before using this method you need to add LSApplicationQueriesSchemes in your info.plist file.
    public static func detectMaliciousApp( appList: [MaliciousAppModel], complition:( _ detectedAppList:[MaliciousAppModel])->Void ){
        AppDetection.leDetectMaliciousApp(appList: appList) { arrMaliciousApp in complition(arrMaliciousApp)
        }
    }
    
    
    
    /// detectScreenShotTakenWithObserver will add notification observer into detecte wether screen shot taken.
    public static func detectScreenShotTakenWithObserver(complition: @escaping(_ notification: Notification)->Void){
        ScreenCaptureDetection.isScreenShotTaken { notification in
            complition(notification)
        }
    }
    
    
    /// detectScreenRecordingWithObserver will add notification observer into detecte wether screen recording is on or off.
    public static func detectScreenRecordingWithObserver(complition: @escaping(_ isScreenRecording:Bool, _ notification: Notification)->Void){

        ScreenCaptureDetection.isScreenRecording { isScreenRecording, notification in
            complition(isScreenRecording, notification)
        }
    }
    
    
    
    /// removeScreenCapturingObserver will remove the added observer for screen shot and screen recording. 
    public static func removeScreenCapturingObserver(observer: Any){
        ScreenCaptureDetection.removeScreenShotObserver(observer: observer)
        ScreenCaptureDetection.removeScreenRecordingObserver(observer: observer)
    }
    
    
}
