//
//  ISGDetectScreenCapture.swift
//  ISGSecuritySDK
//
//  Created by ASHISH on 05/12/22.
//

import Foundation
import UIKit




class ScreenCaptureDetection {
    
    private var effectView: UIVisualEffectView!


    
    public static func isScreenShotTaken(complition: @escaping(_ notification: Notification)->Void){

        NotificationCenter.default.addObserver(
            forName: UIApplication.userDidTakeScreenshotNotification,
            object: nil,
            queue: .main) { notification in
            complition(notification)
        }
    }
    
    
    public static func isScreenRecording(complition: @escaping(_ isScreenRecording:Bool, _ notification: Notification)->Void){
        
        
        NotificationCenter.default.addObserver(
            forName: UIScreen.capturedDidChangeNotification,
            object: nil,
            queue: .main) { notification in
        
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                guard let isCaptured = windowScene?.screen.isCaptured else{
                    print("Window Scene not found")
                    return
                }
                

                if isCaptured {
                    complition(true, notification)
                }else{
                    complition(false, notification)
                }
                
        }
    }
    
    
    public static func removeScreenShotObserver(observer: Any){
        
        NotificationCenter.default.removeObserver(
            observer,
            name: UIApplication.userDidTakeScreenshotNotification,
            object: nil )
        print("Remove Screenshot observer ")
    }


    public static func removeScreenRecordingObserver(observer: Any){
        
        NotificationCenter.default.removeObserver(
            observer,
            name: UIScreen.capturedDidChangeNotification,
            object: nil)
        print("Remove Screen recording observer ")
    }




    /// Will hide content view by adding blur view on top
//    public func addBlurView(windowView: UIView) {
//        let blurView = UIBlurEffect(style: .regular)
//        effectView = UIVisualEffectView(effect: blurView)
//        effectView.frame = windowView.bounds
//        effectView.alpha = 1
//        windowView.addSubview(effectView)
//    }
//
//
//    /// Will remove the blur view
//    public func removeBlurView(){
//        effectView.removeFromSuperview()
//    }

}


