//
//  Session.m
//  yiqizhangda
//
//  Created by bigknife on 14-2-2.
//  Copyright (c) 2014年 idongler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"
#import "NSUserDefaults+RMSaveCustomObject.h"

@interface Session()
@property (nonatomic,strong)GSUser *currentUser;
@end
@implementation Session{
}
 
// 防止外部调用alloc 或者 new
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [Session sharedInstance];
}
// 防止外部调用copy
- (id)copyWithZone:(nullable NSZone *)zone {
    return [Session sharedInstance];
}
// 防止外部调用mutableCopy
- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    return [Session sharedInstance];
}

+ (instancetype)sharedInstance{
    static dispatch_once_t once;
	static Session * _sharedInstance;
	dispatch_once(&once, ^{
		_sharedInstance = [[super allocWithZone:NULL] init];
	});
	return _sharedInstance;
}
#define SESSION_USER_KEY	@"currentUser"
#define SESSION_CITY_KEY	@"currentCity"
#define SESSION_TOKEN_KEY	@"token_shangCheng"
#define SESSION_TOKEN_Store_KEY	@"token_Store22"
#define SESSION_REMIND_KEY	@"remind"
#define SESSION_ASKTYPE_KEY @"askType"

- (void)saveSession:(NSString *)token Token_Store:(NSString *)token_store{
	
		[[NSUserDefaults standardUserDefaults] setObject:token forKey:SESSION_TOKEN_KEY];
		[[NSUserDefaults standardUserDefaults] setObject:token_store forKey:SESSION_TOKEN_Store_KEY];
	
}

- (void)loginWithUser:(GSUser *)user andToken:(NSString *)token Token_Store:(NSString *)token_store{
    self.currentUser = user;
    //写入存储
    [[NSUserDefaults standardUserDefaults] rm_setCustomObject:user forKey:SESSION_USER_KEY];
    
    //写入token
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:SESSION_TOKEN_KEY];
	
	 [[NSUserDefaults standardUserDefaults] setObject:token_store forKey:SESSION_TOKEN_Store_KEY];
}
-(void) persistUser:(GSUser *)user{
    //写入存储
    self.currentUser = user;
    [[NSUserDefaults standardUserDefaults] rm_setCustomObject:self.currentUser forKey:SESSION_USER_KEY];
}
-(NSString *)token {
	//没有 token 就从保存过的文件中读取token
    if(!_token){
        _token = [[NSUserDefaults standardUserDefaults] objectForKey:SESSION_TOKEN_KEY];
    }
    return _token;
}
- (NSString *)token_store
{
	if(!_token_store){
		   _token_store = [[NSUserDefaults standardUserDefaults] objectForKey:SESSION_TOKEN_Store_KEY];
	   }
	   return _token_store;
}
-(void) loadUser {
	//保存用户信息 在NSUserDefaults中读取保存过的用户信息
    _currentUser = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:SESSION_USER_KEY];
}
-(void) logout {
	//用户退出登录 将当前用户和token置空
    _currentUser = nil;
    _token = nil;
    //删除用户及token，保留城市
	[KUserDefaults removeObjectForKey:KSAVEUSERWENZHENINFO];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:SESSION_USER_KEY];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:SESSION_TOKEN_KEY];
	 [[NSUserDefaults standardUserDefaults] removeObjectForKey:SESSION_TOKEN_Store_KEY];
	[KUserDefaults removeObjectForKey:@"ZB_IM_Token"];
	[KUserDefaults removeObjectForKey:@"KTOKEN_STORE_LOGIN"];
	[KUserDefaults synchronize];
}
-(GSUser *)currentUser {
	//加载保存过的用户
    if(!_currentUser){
        [self loadUser];
    }
    return _currentUser;
}
-(NSString *)currency {
	//货币单位
	return @"￥";
}
-(BOOL)isLogin{
//	NSLog(@"--- whw %@ %@ %@ %@",self.token,self.currentUser.id,self.currentUser.mobile,self.currentUser.name);
	//当前token不为空 且 用户不为空 返回yes
    return [self.token length] > 0 && self.currentUser.id ;
}

- (void)saveMedicineRemind:(NSArray *)dic isEdit:(BOOL)edit
{
	if (edit)
	{
		[[NSUserDefaults standardUserDefaults] rm_setCustomObject:dic forKey:SESSION_REMIND_KEY];
	}
	else
	{
		id object = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:SESSION_REMIND_KEY];
		if (object == nil)
		{
			[[NSUserDefaults standardUserDefaults] rm_setCustomObject:dic forKey:SESSION_REMIND_KEY];
		}
		else
		{
			NSMutableArray *arr = [NSMutableArray arrayWithArray:object];
			[arr addObjectsFromArray:dic];
			[[NSUserDefaults standardUserDefaults] rm_setCustomObject:arr forKey:SESSION_REMIND_KEY];
		}
	}

}

- (id)getMedicineRemind
{
	 id object = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:SESSION_REMIND_KEY];
	return object;
}

- (void)saveAskTypeData:(NSArray *)data
{
	if (data && data.count > 0)
	{
		[[NSUserDefaults standardUserDefaults] rm_setCustomObject:data forKey:SESSION_ASKTYPE_KEY];
	}
	else
	{
		return;
	}


}

- (id)getAskTypeData
{
	id object = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:SESSION_ASKTYPE_KEY];
	return object;
}
- (NSAttributedString *)ChangeTextInputColorWithFont:(UILabel *)lab  Color:(UIColor *)color Font:(UIFont*)font Loc:(NSInteger)loc Len:(NSInteger)len{
	//创建一个可变的属性字符串
	NSMutableAttributedString *mutaString = [lab.attributedText mutableCopy];
	[mutaString addAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font} range:NSMakeRange(loc, len)];
	lab.attributedText = [mutaString copy];
	return lab.attributedText;
}
- (void)AlertViewWithTitle:(NSString*)title Text:(NSString *)text btnTitle:(NSString *)btntitle{
	CLAlertView *alertView = [[CLAlertView alloc] initWithAlertViewWithTitle:title text:text DefauleBtn:btntitle cancelBtn:btntitle defaultBtnBlock:^(UIButton *defaultBtn) {
		
		NSLog(@"%@",defaultBtn.currentTitle); 
		
	} cancelBtnBlock:^(UIButton *cancelBtn) {
		
		
	}];
	
	[alertView show];
}

- (BOOL)isDarkSystom{
	if (@available(iOS 13.0, *)) {
		if (UITraitCollection.currentTraitCollection.userInterfaceStyle==UIUserInterfaceStyleDark) {
			
			return YES;
		}else{
			return NO;
		}
	} else { 
		return NO;
	}
}
/**
 *  清理缓存
 */
+(void)cleanCache:(cleanCacheBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //文件路径
        NSString *directoryPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        
        NSArray *subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
        
        for (NSString *subPath in subpaths) {
            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        }
        //返回主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    });
    
}
/**
 *  计算整个目录大小
 */
+(float)folderSizeAtPath
{
    NSString *folderPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    NSFileManager * manager=[NSFileManager defaultManager ];
    if (![manager fileExistsAtPath :folderPath]) {
        return 0 ;
    }
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator ];
    NSString * fileName;
    long long folderSize = 0 ;
    while ((fileName = [childFilesEnumerator nextObject ]) != nil ){
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
        folderSize += [ self fileSizeAtPath :fileAbsolutePath];
    }
    
    return folderSize/( 1024.0 * 1024.0 );
}
/**
 *  计算单个文件大小
 */
+(long long)fileSizeAtPath:(NSString *)filePath{
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath :filePath]){
        
        return [[manager attributesOfItemAtPath :filePath error : nil ] fileSize];
    }
    return 0 ;
    
}
+ (NSString *)getCurrentDdp_addressName;{
//	if (WRXDataClass.sharedInstance.isUseSelectAddress.intValue == 1) {
//		return (GSStringIsEmpty(KTengXunDingWei_Address_Select)?@"":KTengXunDingWei_Address_Select);
//	}else{
		return (GSStringIsEmpty(KTengXunDingWei_Address)?@"":KTengXunDingWei_Address);
//	}
}

+ (NSString *)getCurrentDdp_addresslat;
{
//	if (AppDelegate.sharedInstance.isUseSelectAddress.intValue == 1) {
//		NSString *str_lat = ([NSString isEmptyString:KTengXunDingWei_weidu_Select]?@"":KTengXunDingWei_weidu_Select);
//		return str_lat ;
//	}else{
		NSString *str_lat = ([NSString isEmptyString:KTengXunDingWei_weidu]?@"":KTengXunDingWei_weidu);
		return str_lat ;
//	}
}

+ (NSString *)getCurrentDdp_addresslon;{
//	if (WRXDataClass.sharedInstance.isUseSelectAddress.intValue == 1) {
//		NSString *str_lon = ([NSString isEmptyString:KTengXunDingWei_Jingdu_Select]?@"":KTengXunDingWei_Jingdu_Select);
//		return str_lon ;
//	}else{
		NSString *str_lon = ([NSString isEmptyString:KTengXunDingWei_Jingdu]?@"":KTengXunDingWei_Jingdu);
		return str_lon ;
//	}
}
+(NSArray *)getMyPhones;{
	NSMutableArray *array = [[NSMutableArray alloc]init];
	[array addObjectsFromArray:[Session getMySelfMobile]];
//	----------
	[array addObject:@"17629099493"];
//	--------------
	[array addObject:@"13227021801"];
	//	--------------
	[array addObject:@"18335768302"];
	[array addObject:@"15110775770"];
	[array addObject:@"18592005770"];
	   
	//	--------------
	[array addObjectsFromArray:[Session getselfMobileGangzi]];
	
	return [NSArray arrayWithArray:array];
}
+(NSArray *)getMySelfMobile{
	NSMutableArray *arr = [[NSMutableArray alloc]init];
	NSArray *arrayphone = @[];
	[arr addObjectsFromArray:arrayphone];
	
	NSArray *arrtaozi = @[@""];
	
	[arr addObjectsFromArray:arrtaozi];
	
	return arr;
}
 
+ (NSArray *)getselfMobileGangzi{
	NSArray *arrayphone = @[];
	
	return arrayphone;
}

+ (NSArray *)getselfMobileTaoZi{
	NSArray *arrayphone = @[];
	
	return arrayphone;
}

- (NSArray *)getfenyongiddata{
	NSMutableArray *arrmu = [[NSMutableArray alloc]initWithCapacity:0];
	[arrmu addObject:@{@"yxid":@"2951",@"uid":@"319669"}];
//	[arrmu addObject:@{@"yxid":@"116718",@"uid":@"319830"}];
//	[arrmu addObject:@{@"yxid":@"974911",@"uid":@"6603928"}];
//	[arrmu addObject:@{@"yxid":@"127866",@"uid":@"5284012"}];
//	[arrmu addObject:@{@"yxid":@"195105",@"uid":@"4382480"}];
//	[arrmu addObject:@{@"yxid":@"1027517",@"uid":@"3632484"}];
//	[arrmu addObject:@{@"yxid":@"8482",@"uid":@"5046891"}];
//	[arrmu addObject:@{@"yxid":@"8783",@"uid":@"5067053"}];
//	[arrmu addObject:@{@"yxid":@"275550",@"uid":@"5466423"}];
//	[arrmu addObject:@{@"yxid":@"1035490",@"uid":@"7044729"}];
//	[arrmu addObject:@{@"yxid":@"125933",@"uid":@"2564861"}];
//	[arrmu addObject:@{@"yxid":@"2843",@"uid":@"2188633"}];
	return [NSArray arrayWithArray:arrmu];
}

- (void)loadfenyongdata{
//	NSString *strfenyong = WRXDataClass.sharedInstance.strfenyongnum?:@"0";
//	 
//	NSDictionary *dictfenyong = [Session.sharedInstance getfenyongiddata][strfenyong.intValue];
//	NSMutableDictionary *params = [[NSMutableDictionary alloc]initWithCapacity:0];
//	[params setObject:dictfenyong[@"yxid"] forKey:@"user_id"];
//	[VMCIndexApi.sharedInstance postGeneralWithDictionary:params withMethodName:@"emc_yibei_ybsheet/indexs" callback:^(NSInteger statusCode, ApiResponse *response, BOOL requestSucces) {
//		if (response.success) {
//			NSString *strorder_nums = NSStringFormat(@"%@",response.info[@"today_income"][@"order_nums"]);
//			if (strorder_nums.intValue >= 10) {
//				WRXDataClass.sharedInstance.strfenyongnum = @(strfenyong.intValue+1).stringValue;
//				[KUserDefaults setObject:WRXDataClass.sharedInstance.strfenyongnum forKey:KFENYONGNUM];
//				[KUserDefaults synchronize];
//				
//				[Session.sharedInstance loadfenyongdata];
//			}
//		}
//	}];
}
@end
