//
//  LLScreenSaverListener.swift
//  LLScreenSaverListenerExample
//
//  Created by Will Chilcutt on 1/27/17.
//  Copyright © 2017 Laoba Labs. All rights reserved.
//

import Cocoa

let kLLScreenSaverListenerScreenSaverIsLockedNotificationName : NSNotification.Name = NSNotification.Name("com.apple.screenIsLocked")
let kLLScreenSaverListenerScreenSaverIsUnlockedNotificationName : NSNotification.Name = NSNotification.Name("com.apple.screenIsUnlocked")

protocol LLScreenSaverListenerDelegate
{
    func handleScreenSaverLocked()
    func handleScreenSaverUnlocked()
}

class LLScreenSaverListener: NSObject
{
    var delegate : LLScreenSaverListenerDelegate!
    
    convenience init(withDelegate givenDelegate : LLScreenSaverListenerDelegate)
    {
        self.init()
        
        delegate = givenDelegate
        
        DistributedNotificationCenter.default().addObserver(self,
                                                            selector: #selector(handleScreenSaverLocked),
                                                            name:kLLScreenSaverListenerScreenSaverIsLockedNotificationName,
                                                            object: nil)
        DistributedNotificationCenter.default().addObserver(self,
                                                            selector: #selector(handleScreenSaverUnlocked),
                                                            name:kLLScreenSaverListenerScreenSaverIsUnlockedNotificationName,
                                                            object: nil)
    }
    
    func handleScreenSaverLocked()
    {
        //Do anything else you want to do here before telling the delegate
        delegate.handleScreenSaverLocked()
    }

    func handleScreenSaverUnlocked()
    {
        //Do anything else you want to do here before telling the delegate
        delegate.handleScreenSaverUnlocked()
    }
}
