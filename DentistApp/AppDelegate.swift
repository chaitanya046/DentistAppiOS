//
//  AppDelegate.swift
//  DentistApp
//
//  Created by user174125 on 6/11/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        //Used third-party IQKeyBoardManager to move the view up when the keyboard appears on top of it.
        IQKeyboardManager.shared.enable = true
        //let doctorStore = DoctorStore()
        //let doctorsController = window!.rootViewController as! DoctorsListViewController
        //doctorsController.doctorStore = doctorStore
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    //core data
         lazy var persistentContainer: NSPersistentContainer = {
             /*
              The persistent container for the application. This implementation
              creates and returns a container, having loaded the store for the
              application to it. This property is optional since there are legitimate
              error conditions that could cause the creation of the store to fail.
             */
             let container = NSPersistentContainer(name: "Patients")
             container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                 if let error = error as NSError? {
                     // Replace this implementation with code to handle the error appropriately.
                     // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                      
                     /*
                      Typical reasons for an error here include:
                      * The parent directory does not exist, cannot be created, or disallows writing.
                      * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                      * The device is out of space.
                      * The store could not be migrated to the current model version.
                      Check the error message to determine what the actual problem was.
                      */
                     fatalError("Unresolved error \(error), \(error.userInfo)")
                 }
             })
             return container
         }()

         // MARK: - Core Data Saving support

         func saveContext () {
             let context = persistentContainer.viewContext
             if context.hasChanges {
                 do {
                     try context.save()
                 } catch {
                     // Replace this implementation with code to handle the error appropriately.
                     // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                     let nserror = error as NSError
                     fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                 }
             }
         }
    
    
    
    
}

extension UIApplication {
    class var topViewController: UIViewController? { return getTopViewController() }
    private class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController { return getTopViewController(base: nav.visibleViewController) }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController { return getTopViewController(base: selected) }
        }
        if let presented = base?.presentedViewController { return getTopViewController(base: presented) }
        return base
    }

    private class func _share(_ data: [Any],
                              applicationActivities: [UIActivity]?,
                              setupViewControllerCompletion: ((UIActivityViewController) -> Void)?) {
        let activityViewController = UIActivityViewController(activityItems: data, applicationActivities: nil)
        setupViewControllerCompletion?(activityViewController)
        UIApplication.topViewController?.present(activityViewController, animated: true, completion: nil)
    }

    class func share(_ data: Any...,
                     applicationActivities: [UIActivity]? = nil,
                     setupViewControllerCompletion: ((UIActivityViewController) -> Void)? = nil) {
        _share(data, applicationActivities: applicationActivities, setupViewControllerCompletion: setupViewControllerCompletion)
    }
    class func share(_ data: [Any],
                     applicationActivities: [UIActivity]? = nil,
                     setupViewControllerCompletion: ((UIActivityViewController) -> Void)? = nil) {
        _share(data, applicationActivities: applicationActivities, setupViewControllerCompletion: setupViewControllerCompletion)
    }
    
   
    
    
    
}
