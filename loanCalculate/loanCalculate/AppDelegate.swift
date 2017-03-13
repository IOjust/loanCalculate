//
//  AppDelegate.swift
//  loanCalculate
//
//  Created by 月亮 on 2017/3/12.
//  Copyright © 2017年 月亮. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
        //当应用程序从活动状态到非活动状态，这个发生在突然的打断，比如来电话。或者短信，或者当用户推出应用程序。过渡到后台状态
        //用这个方法暂停正在进行的任务，禁用计时器 。游戏用这个方法来暂停游戏
        //        print("applicationWillResignActive 被执行了")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //当程序被推送到后台的时候调用。所以要设置后台继续运行，则在这个函数里面设置即可
        //用这个方法来释放共享的资源 ， 保存用户数据 ，停用计时器。
        //        print("applicationDidEnterBackground 被执行了")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
        //当程序从后台将要重新回到前台时候调用，你取消进入后台的时候调用的程序
        //        print("applicationWillEnterForeground 被执行了")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //应用程序进入活动状态。这时候需要重新启用应用程序
        //        print("applicationDidBecomeActive 被执行了")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        //应用程序将要被终结的时候执行  可以适当保存数据之类的
        //        print("applicationWillTerminate 被执行了")
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        //如果为应用程序分配了太多内存操作系统会终止应用程序的运行，在终止前会执行这个方法，通常可以在这里进行内存清理工作防止程序被终止
        //print("applicationDidReceiveMemoryWarning 被执行了")
    }
    
    func applicationSignificantTimeChange(_ application: UIApplication) {
        //当系统时间发生改变时执行
    }
    
    func application(_ application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect) {
        //当StatusBar框将要变化时执行
    }


}

