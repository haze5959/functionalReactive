//
//  AppDelegate.swift
//  functionalReactive
//
//  Created by 권오규 on 2017. 3. 6..
//  Copyright © 2017년 권오규. All rights reserved.
//

/*
 # functionalReactive
 
 Swift의 오프소스 관리툴인 CocoaPods와
 요즘 각광받고 있는 함수형 리액티브(RxSwift)프로그래밍을 이용한 프로젝트!

 # 프로젝트 소개!
 
 일단 제가 만들 것은 슬롯머신!
 함수형 프로그래밍의 가장 큰 장점인 멀티코어를 원활히 사용하기 쉽다.
 즉, 스레드를 여러개를 이용해서 만들거란 말씀.
 
 # 프로젝트 개요
 
 간단하다. 버튼을 누르면 3개의 슬롯이 돌아가고, 각각의 슬롯은 개별적인 스래드로 돌아간다!
 또 다시 버튼을 누르면 슬롯이 하나씩 멈추게 되고, 각각의 슬롯의 숫자를 조합해 결과를 나타나게 된다.
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        NSLog("앱이 실행되었다.");
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

