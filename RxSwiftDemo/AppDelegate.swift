//
//  AppDelegate.swift
//  RxSwiftDemo
//
//  Created by Twisted Fate on 2020/8/28.
//  Copyright © 2020 Twisted Fate. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /// test Demo
        /// 测试
        let str = "test"
        
        
        let students: [Student] = getSchoolStudents()
        let grade2Class2Student = students.filter { (stu) -> Bool in
            return stu.classes == 2 && stu.grade == 2
        }
        print(grade2Class2Student)
        return true
    }
    
    func getSchoolStudents() -> [Student]{
        
        let stu1 = Student(grade: 1, classes: 1)
        let stu2 = Student(grade: 2, classes: 2)
        let stu3 = Student(grade: 3, classes: 2)
        let stu4 = Student(grade: 2, classes: 3)
        let stu5 = Student(grade: 3, classes: 1)
        let stu6 = Student(grade: 2, classes: 4)
        let stu7 = Student(grade: 2, classes: 2)

        return [stu1, stu2, stu3, stu4, stu5, stu6, stu7]
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

