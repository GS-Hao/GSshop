//
//  AppDelegate.h
//  xiangle
//
//  Created by wei cui on 2020/2/23.
//  Copyright © 2020 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)sharedInstance;

- (UIViewController *)topViewController;

- (void)showAlertWithTitle:(NSString *)title Message:(NSString *)message leftStr:(NSString *)leftStr RightStr:(NSString *)strRight handler:(void (^ _Nullable)(NSString * _Nonnull))handler;

- (void)saveContext;
@property(nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property(nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

