//
//  AppDelegate.swift
//  LLScreenSaverListenerExample
//
//  Created by Will Chilcutt on 1/27/17.
//  Copyright © 2017 Laoba Labs. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, LLScreenSaverListenerDelegate
{
    var screenSaverListener : LLScreenSaverListener?
    
    func applicationDidFinishLaunching(_ aNotification: Notification)
    {
        //You don't have to put this in your AppDelegate. You can put it anywhere, just don't forget to set a delegate!
        screenSaverListener = LLScreenSaverListener(withDelegate: self)
    }

    //MARK: - LLScreenSaverListenerDelegate methods
    
    func handleScreenSaverLocked()
    {
        //Do whatever you want to do when the screen saver locks here
        print("Screen saver locked at \(Date())")
    }
    
    func handleScreenSaverUnlocked()
    {
        //Do whatever you want to do when the screen saver unlocks here
        print("Screen saver unlocked at \(Date())")
    }
}

