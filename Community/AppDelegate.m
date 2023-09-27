//
//  AppDelegate.m
//  xiangle
//
//  Created by wei cui on 2020/2/23.
//  Copyright © 2020 wei cui. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "AgreementController.h"
#import "ContentController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedInstance
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(![defaults boolForKey:@"firstLogin"]){
        NSLog(@"firstLogin");
        
        AgreementController *ac=[[AgreementController alloc] init];
        UINavigationController *navVc=[[UINavigationController alloc] initWithRootViewController:ac];
        //设置窗口的根控制器
        self.window.rootViewController=navVc;
     }else{
         //跟控制器
         UITabBarController *tabBarController=[[TabBarController alloc] init];
         //当跳转了某个控制器隐藏TabBar，再返回，TabBar切换控制器的时候选中文字颜色竟然变蓝色了！
         tabBarController.tabBar.tintColor = bgColor;//设置一个默认色
         self.window.rootViewController=tabBarController;
     }
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark Universal Link
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        NSURL *url = userActivity.webpageURL;
        NSLog(@"url:%@", url);//https://xiangle.cuiwei.net/detail/?id=123
        NSString *host = url.host;
        if ([host isEqualToString:@"xiangle.cuiwei.net"]) {
            //进行我们需要的处理
            ContentController *cc=[[ContentController alloc] init];
            cc.id=90;//解析url,得到帖子id=90
            UITabBarController *tabBarVc= [UIApplication sharedApplication].keyWindow.rootViewController;
            UINavigationController *nav= (UINavigationController *) tabBarVc.selectedViewController;
            [nav pushViewController:cc animated:YES];
            //NSLog(@"TODO....");
//            UINavigationController *nav (UINavigationController *) tab
        } else {
            //Objective-C
            NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @YES};
            [application openURL:url options:options completionHandler:nil];
            //Swift
            //let options = [UIApplicationOpenURLOptionUniversalLinksOnly : true]
            //UIApplication.shared.open(url, options: options, completionHandler: nil)
        }
    }
    return YES;
}

#pragma mark - CoreData
- (void)saveContext {
    NSManagedObjectContext *context = self.managedObjectContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (NSManagedObjectModel *)managedObjectModel {
    if (!_managedObjectModel) {
        // 创建数据模型文件，类型为momd
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"YK" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"YK.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

-(NSManagedObjectContext *)managedObjectContext{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

#pragma mark - Alert
- (void)showAlertWithTitle:(NSString *)title Message:(NSString *)message leftStr:(NSString *)leftStr RightStr:(NSString *)strRight handler:(void (^ _Nullable)(NSString * _Nonnull))handler{
    UIViewController *selfVC = self.topViewController;
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    if (![NSString isEmptyString:leftStr]) {
        [alertVC addAction:[UIAlertAction actionWithTitle:leftStr style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            handler(@"1");
        }]];
    }
    if (![NSString isEmptyString:strRight]) {
        [alertVC addAction:[UIAlertAction actionWithTitle:strRight style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            handler(@"2");
        }]];
    }
    [selfVC presentViewController:alertVC animated:YES completion:nil];
}

//获取顶部viewController
- (UIViewController *)topViewController
{
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
