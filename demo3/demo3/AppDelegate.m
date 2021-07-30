//
//  AppDelegate.m
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import "AppDelegate.h"
#import "ShowinfoTableViewController.h"
@interface AppDelegate ()
@property (nonatomic,strong) ShowinfoTableViewController *showinfoTableViewController;
@end

@implementation AppDelegate

- (ShowinfoTableViewController *)showinfoTableViewController{
    if (!_showinfoTableViewController) {
        _showinfoTableViewController = [[ShowinfoTableViewController alloc]init];
    }
    return _showinfoTableViewController;
}
-(void)configWindow{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:self.showinfoTableViewController];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self configWindow];
    return YES;
}


@end
