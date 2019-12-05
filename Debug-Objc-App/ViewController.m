//
//  ViewController.m
//  Debug-Objc-App
//
//  Created by Hem1ng on 2019/5/29.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSMutableString *cString;
@property (nonatomic, strong) NSMutableString *sString;
@property (nonatomic, weak) NSMutableString *wString;
@property (nonatomic, assign) NSMutableString *aString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    NSLog(@"--viewDidLoad");
    
    NSMutableString *abc = [[NSMutableString alloc] initWithString: @"abc"];
    self.cString = abc;
    self.sString = abc;
    self.wString = abc;
    self.aString = abc;
    
    NSLog(@"__%p__%@",abc,abc);
    NSLog(@"c__%p__%@",self.cString,self.cString);
    NSLog(@"s__%p__%@",self.sString,self.sString);
    NSLog(@"w__%p__%@",self.wString,self.wString);
    NSLog(@"a__%p__%@",self.aString,self.aString);
    
    NSLog(@"retainCount: %@",[abc valueForKey:@"retainCount"]);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"--viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"--viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"--viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"--viewDidDisappear");
}


@end
