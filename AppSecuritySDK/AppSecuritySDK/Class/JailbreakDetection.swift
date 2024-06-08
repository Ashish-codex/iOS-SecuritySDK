//
//  ISGDetectJailbreak.swift
//  ISGSecuritySDK
//
//  Created by ASHISH on 06/12/22.
//

import Foundation
import UIKit


public class JailbreakDetection {

    
    private static  var maliciousAppPath: [String] = [
        "/Applications/Cydia.app",
        "/Applications/blackra1n.app",
        "/Applications/FakeCarrier.app",
        "/Applications/Icy.app",
        "/Applications/IntelliScreen.app",
        "/Applications/MxTube.app",
        "/Applications/RockApp.app",
        "/Applications/SBSettings.app",
        "/Applications/WinterBoard.app"
    ]
    
    private static var maliciousSystemPath: [String] = [
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
        "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
        "/private/var/lib/apt",
        "/private/var/lib/cydia",
        "/private/var/mobile/Library/SBSettings/Themes",
        "/private/var/stash",
        "/private/var/tmp/cydia.log",
        "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
        "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
        "/usr/bin/sshd",
        "/usr/libexec/sftp-server",
        "/usr/sbin/sshd",
        "/bin/bash",
        "/etc/apt"

    ]
    
    
    public static var isJailBroken: Bool {
        get{
            
            if self.isCydiaInstalled(){ return true }
            if self.isContainMaliciousAppPath(){ return true }
            if self.isContainMaliciousSystemPath(){ return true }
            if self.canEditSystemFile(){ return true }
            
            return false
        }
    }
    
    
    
    private static func isCydiaInstalled() -> Bool{
        return UIApplication.shared.canOpenURL(URL(string: "cydia://")!)
    }
    
    
    private static func isContainMaliciousAppPath() -> Bool{
        for appPath in self.maliciousAppPath {
            if FileManager.default.fileExists(atPath: appPath){
                return true
            }
        }
        return false
    }
    
    
    private static func isContainMaliciousSystemPath() -> Bool{
        for systemPath in self.maliciousSystemPath {
            if FileManager.default.fileExists(atPath: systemPath){
                return true
            }
        }
        return false
    }
    
    
    
    private static func canEditSystemFile() -> Bool{
        let jailBreakText = "You are hacked :)"
        
        do {
            try jailBreakText.write(toFile: "/private/jailbreak.txt", atomically: true, encoding: .utf8)
            return true
        } catch let err {
            print("\n Exception during Edit System File \(err.localizedDescription) \n ")
            
            return false
        }
    }
    
    
}
