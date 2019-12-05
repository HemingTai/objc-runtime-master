//
//  AppDelegate.m
//  Debug-Objc-App
//
//  Created by Hem1ng on 2019/5/29.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/************************ App的生命周期 ************************
 * App的生命周期分别调用哪些方法（iOS 13以前）：
 * App从启动开始到进入首页分别会调用以下方法：didFinishLaunchingWithOptions -> viewDidLoad -> viewWillAppear -> applicationDidBecomeActive -> viewDidAppear
 * 从前台进入后台分别会调用以下方法：applicationWillResignActive -> applicationDidEnterBackground
 * 从后台进入前台分别会调用以下方法：applicationWillEnterForeground -> applicationDidBecomeActive
 * 从前台进入多任务状态会调用方法：applicationWillResignActive
 * 从多任务状态杀死App分别会调用以下方法：applicationDidEnterBackground -> applicationWillTerminate
 *************************************************************/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"--didFinishLaunchingWithOptions");
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"--applicationWillResignActive");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"--applicationDidEnterBackground");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"--applicationWillEnterForeground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"--applicationDidBecomeActive");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"--applicationWillTerminate");
}


@end
