//
//  AppDelegate.m
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import "AppDelegate.h"
#import "UserinfoTableViewController.h"
@interface AppDelegate ()
@property (nonatomic,strong) UserinfoTableViewController *userinfoTableViewController;
@end

@implementation AppDelegate

- (UserinfoTableViewController *)userinfoTableViewController{
    if (!_userinfoTableViewController) {
        _userinfoTableViewController = [[UserinfoTableViewController alloc]init];
    }
    return _userinfoTableViewController;
}
-(void)configWindow{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:self.userinfoTableViewController];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self configWindow];
    return YES;
}


@end
