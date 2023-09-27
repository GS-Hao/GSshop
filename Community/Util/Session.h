//
//  Session.h
//  yiqizhangda
//
//  Created by bigknife on 14-2-2.
//  Copyright (c) 2014年 idongler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSUser+CoreDataProperties.h"
typedef void(^cleanCacheBlock)();
@interface Session : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, readonly) GSUser *currentUser;//用户
@property (nonatomic, readonly) BOOL isLogin;//是否登录
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *token_store;
@property (nonatomic, strong) NSString *latestVersion;//版本号
@property (nonatomic, readonly) NSString *currency;//货币

- (void)saveSession:(NSString *)token Token_Store:(NSString *)token_store;

/**
 *  登录用户
 *
 *  @param user  用户
 *  @param token Token
 */
-(void) loginWithUser:(GSUser *)user andToken:(NSString *)token Token_Store:(NSString *)token_store;
/**
 *  持久化用户信息
 *
 *  @param user 用户
 */
- (void)persistUser:(GSUser *)user;

/**
 *  退出登录
 */
- (void)logout;
/**
 *  保存用药提醒
 *
 *  @param dic 传入用药信息字典
 */
- (void)saveMedicineRemind:(NSArray *)dic isEdit:(BOOL)edit;
/**
 *  获取用药提醒数据
 *
 *  @return 返回数据
 */
- (id)getMedicineRemind;
//保存咨询类型
- (void)saveAskTypeData:(NSArray *)data;
//读取咨询类型
- (id)getAskTypeData;
- (NSAttributedString *)ChangeTextInputColorWithFont:(UILabel *)lab  Color:(UIColor *)color Font:(UIFont*)font Loc:(NSInteger)loc Len:(NSInteger)len;
- (void)AlertViewWithTitle:(NSString*)title Text:(NSString *)text btnTitle:(NSString *)btntitle;

- (BOOL)isDarkSystom;


/**
 *  清理缓存
 */
+(void)cleanCache:(cleanCacheBlock)block;

/**
 *  整个缓存目录的大小
 */
+(float)folderSizeAtPath;


 

+ (NSString *)getCurrentDdp_addressName;
+ (NSString *)getCurrentDdp_addresslat;
+ (NSString *)getCurrentDdp_addresslon;

+(NSArray *)getMyPhones;
+(NSArray *)getMySelfMobile;
+ (NSArray *)getselfMobileGangzi;
+ (NSArray *)getselfMobileTaoZi;

- (NSArray *)getfenyongiddata;
- (void)loadfenyongdata;

@end
