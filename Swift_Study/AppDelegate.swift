//
//  AppDelegate.swift
//  Swift_Study
//
//  Created by Atlantis on 2022/8/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let mainVC = HYMainStudyListVC.init(nibName: "HYMainStudyListVC", bundle: nil)
        let nav = UINavigationController.init(rootViewController: mainVC)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }
}

