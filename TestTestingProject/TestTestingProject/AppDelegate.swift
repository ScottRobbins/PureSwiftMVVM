//
//  AppDelegate.swift
//  TestTestingProject
//
//  Created by Scott Robbins on 2/5/16.
//  Copyright © 2016 Mobile Defense. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? RegistrationViewController {
            window?.rootViewController = vc
            
            let registrationInputValidator = RegistrationInputValidator()
            vc.viewModel = RegistrationViewControllerDefaultViewModel(registrationInputValidator: registrationInputValidator)
            window?.makeKeyAndVisible()
        }
        
        return true
    }
}

