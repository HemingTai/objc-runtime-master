//
//  main.m
//  debug-objc
//
//  Created by Closure on 2018/12/4.
//

#import <Foundation/Foundation.h>
#import "Man.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Man *m = [[Man alloc] init];
        NSString *a = @"hello";
        NSString *b = [NSString stringWithFormat:@"hello"];
        if (a == b)
        {
            NSLog(@"a == b");
        }
        if ([a isEqualToString:b])
        {
            NSLog(@"a isEqualToString b");
        }
    }
    return 0;
}
