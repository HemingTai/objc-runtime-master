//
//  main.m
//  Debug-Objc-App
//
//  Created by Hem1ng on 2019/5/29.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int global_i = 1;
static int static_global_j = 2;

int main(int argc, char * argv[]) {
    static int static_k = 3;
    int val = 4;
    
    void (^block)(void) = ^{
        global_i ++;
        static_global_j ++;
        static_k ++;
        NSLog(@"i:%d,j:%d,k:%d,v:%d",global_i,static_global_j,static_k,val);
    };
    global_i ++;
    static_global_j ++;
    static_k ++;
    val ++;
    NSLog(@"---i:%d,j:%d,k:%d,v:%d",global_i,static_global_j,static_k,val);
    
    block();
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
