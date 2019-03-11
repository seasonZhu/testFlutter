#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "Runner-Swift.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
     FPSLabel *fps = [FPSLabel new];
    fps.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width - 100, 64, 80, 22);
    //[self.window.rootViewController.view addSubview:fps];
    [self.window.rootViewController.view insertSubview:fps atIndex:0];
    NSLog(@"%@",self.window.rootViewController);
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
