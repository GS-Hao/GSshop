//
//  AIDCoreDataManager.h
//  AIDNurse
//
//  Created by leo on 2019/4/2.
//  Copyright © 2019年 AID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeJoke+CoreDataProperties.h"
#import "GSNotify+CoreDataProperties.h"
#import "GSUser+CoreDataProperties.h"
#import "GSLike+CoreDataProperties.h"
#import "GSFavorite+CoreDataProperties.h"
#import "GSFollowUser+CoreDataProperties.h"

@interface AIDCoreDataManager : NSObject
+(id)createEntity:(Class)aClsaa;
+(void)deleteAllEntity:(Class)aClsaa;
+ (NSArray *)getAllEntitys:(Class)aClsaa;

#pragma -mark - AIDPatient
+(HomeJoke *)getHomeJokeEntityById:(int32_t)jid;
+ (NSArray *)getHomeJokeEntityByType:(int32_t)type;
+ (NSArray *)getCommentEntityByJid:(int32_t)jid;
+ (NSArray *)getNotifyEntityByUserid:(int32_t)userid;
+ (GSNotify *)getNotifyEntityByContent:(NSString *)text;
+ (GSUser *)getUserEntityById:(int)uid;
+ (GSUser *)getUserEntityByMobile:(NSString *)mobile;
+ (GSLike *)getLikeEntityById:(int)uid AndJokeid:(int)jokeid;
+ (GSFavorite *)getFavoriteEntityById:(int)uid AndJokeid:(int)jokeid;
+ (void)deleteEntity:(Class)aClsaa AndId:(int)jid;
+ (NSArray *)getCommentEntityByUid:(int32_t)uid;
+ (GSFollowUser *)getFollowUserEntityById:(int)oid;
+ (NSArray *)getFollowUserEntityByUid:(int)uid;

#pragma -mark --
+ (NSString *)getPinYinString:(NSString *)aString;
@end
