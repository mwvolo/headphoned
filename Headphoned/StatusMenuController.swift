//
//  StatusMenuController.swift
//  Headphoned
//
//  Created by Michael Harrison on 9/17/15.
//  Copyright (c) 2015 Michael Harrison. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var headphoneMenu: NSMenu!
    @IBOutlet weak var deviceLabel: NSMenuItem!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    
    
    @IBAction func quitApp(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(self)
        
    }
    
    override func awakeFromNib() {
        let headphoneIcon = NSImage(named: "headphoneIcon")
        statusItem.image = headphoneIcon
        deviceLabel.title = "Initializing..."
        statusItem.menu = headphoneMenu
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateAudio", userInfo: nil, repeats: true)
        
    }
    
    @objc func updateAudio() {
        var deviceName = EZAudioDevice.currentOutputDevice().name
        let redHeadphones = NSImage(named: "redHeadphones")
        let greenHeadphones = NSImage(named: "greenHeadphones")
        
        if deviceName == "Built-in Output" {
            statusItem.image = greenHeadphones
        }else{
            statusItem.image = redHeadphones
        }
        
        statusItem.menu = headphoneMenu
        
        deviceLabel.title = deviceName
    }
}
