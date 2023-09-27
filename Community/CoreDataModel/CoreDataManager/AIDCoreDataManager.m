//
//  AIDCoreDataManager.m
//  AIDNurse
//
//  Created by leo on 2019/4/2.
//  Copyright © 2019年 AID. All rights reserved.
//

#import "AIDCoreDataManager.h"
#import "HomeJoke+CoreDataProperties.h"
#import "GSUser+CoreDataProperties.h"
#import "GSLike+CoreDataProperties.h"

@implementation AIDCoreDataManager

+ (id)createEntity:(Class)aClsaa{
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;
    NSString *entityName = NSStringFromClass(aClsaa);
    NSEntityDescription *description = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    HomeJoke *entity = [[HomeJoke alloc] initWithEntity:description insertIntoManagedObjectContext:context];
    return entity;
}
+(void)deleteAllEntity:(Class)aClsaa{
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;
    NSString *entityName = NSStringFromClass(aClsaa);
    
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    NSArray* resultArray = [context executeFetchRequest:request error:nil];
    
    [context performBlockAndWait:^{
        if (resultArray.count > 0) {
            for (NSManagedObject * object in resultArray) {
                [context deleteObject:object];
            }
            [context save:nil];
        }
    }];
}

+(void)deleteEntity:(Class)aClsaa AndId:(int)jid {
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;
    NSString *entityName = NSStringFromClass(aClsaa);
    
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %d", jid]];
    
    NSArray* resultArray = [context executeFetchRequest:request error:nil];
    
    [context performBlockAndWait:^{
        if (resultArray.count > 0) {
            for (NSManagedObject * object in resultArray) {
                [context deleteObject:object];
            }
            [context save:nil];
        }
    }];
}

+ (NSArray *)getAllEntitys:(Class)aClsaa{
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;
    NSString *entityName = NSStringFromClass(aClsaa);
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:entityName];

    NSArray* resultArray = [context executeFetchRequest:request error:nil];
    NSSortDescriptor *pid = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
    NSArray *sorts = [[NSArray alloc] initWithObjects:pid, nil];
    NSArray *tempArray = [resultArray sortedArrayUsingDescriptors:sorts];
     return tempArray;
}



+ (HomeJoke *)getHomeJokeEntityById:(int32_t)jid{
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"HomeJoke" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"id == %d", jid]];
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    if (resultArray.count) {
        return resultArray[0];
    }
    return nil;
}

+ (NSArray *)getHomeJokeEntityByType:(int32_t)type {
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"HomeJoke" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    if (type != 0) {
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"type == %d", type]];
    }
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    
    NSSortDescriptor *pid = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:NO];
    NSArray *sorts = [[NSArray alloc] initWithObjects:pid, nil];
    NSArray *tempArray = [resultArray sortedArrayUsingDescriptors:sorts];
    return tempArray;
}

+ (GSUser *)getUserEntityByMobile:(NSString *)mobile{
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSUser" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"mobile == %@", mobile]];
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    if (resultArray.count) {
        return resultArray[0];
    }
    return nil;
}

+ (GSUser *)getUserEntityById:(int)uid{
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSUser" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"id == %d", uid]];
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    if (resultArray.count) {
        return resultArray[0];
    }
    return nil;
}

+ (GSLike *)getLikeEntityById:(int)uid AndJokeid:(int)jokeid{
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSLike" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"user_id == %d", uid]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"joke_id == %d", jokeid]];
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    if (resultArray.count) {
        return resultArray[0];
    }
    return nil;
}

+ (GSFavorite *)getFavoriteEntityById:(int)uid AndJokeid:(int)jokeid{
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSFavorite" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"user_id == %d", uid]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"joke_id == %d", jokeid]];
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    if (resultArray.count) {
        return resultArray[0];
    }
    return nil;
}

+ (NSArray *)getCommentEntityByUid:(int32_t)uid {
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSComment" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    if (uid >= 0) {
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"user_id == %d", uid]];
    }
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    
    NSSortDescriptor *pid = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
    NSArray *sorts = [[NSArray alloc] initWithObjects:pid, nil];
    NSArray *tempArray = [resultArray sortedArrayUsingDescriptors:sorts];
    return tempArray;
}

+ (NSArray *)getCommentEntityByJid:(int32_t)jid {
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSComment" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    if (jid >= 0) {
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"joke_id == %d", jid]];
    }
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    
    NSSortDescriptor *pid = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
    NSArray *sorts = [[NSArray alloc] initWithObjects:pid, nil];
    NSArray *tempArray = [resultArray sortedArrayUsingDescriptors:sorts];
    return tempArray;
}

+ (NSArray *)getNotifyEntityByUserid:(int32_t)userid {
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSNotify" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"user_id == %d", userid]];
    
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    
    NSSortDescriptor *pid = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
    NSArray *sorts = [[NSArray alloc] initWithObjects:pid, nil];
    NSArray *tempArray = [resultArray sortedArrayUsingDescriptors:sorts];
    return tempArray;
}

+ (GSNotify *)getNotifyEntityByContent:(NSString *)text {
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSNotify" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"content == %@", text]];
    
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    
    if (resultArray.count) {
        return resultArray[0];
    }
    return nil;
}

+ (GSFollowUser *)getFollowUserEntityById:(int)oid {
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSFollowUser" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"id == %d", oid]];
    
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    
    if (resultArray.count) {
        return resultArray[0];
    }
    return nil;
}

+ (NSArray *)getFollowUserEntityByUid:(int)uid {
    NSManagedObjectContext *context = [AppDelegate sharedInstance].managedObjectContext;

    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"GSFollowUser" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"user_id == %d", uid]];
    
    
    NSArray* resultArray = [context executeFetchRequest:fetchRequest error:nil];
    
    NSSortDescriptor *pid = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
    NSArray *sorts = [[NSArray alloc] initWithObjects:pid, nil];
    NSArray *tempArray = [resultArray sortedArrayUsingDescriptors:sorts];

    return resultArray;
}

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)getPinYinString:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
    NSMutableString *allString = [NSMutableString new];
    
    int count = 0;
    
    for (int  i = 0; i < pinyinArray.count; i++)
    {
        for(int i = 0; i < pinyinArray.count;i++)
        {
            if (i == count) {
                [allString appendString:@"#"];
                //区分第几个字母
            }
            [allString appendFormat:@"%@",pinyinArray[i]];
        }
        [allString appendString:@","];
        count ++;
    }
    NSMutableString *initialStr = [NSMutableString new];
    //拼音首字母
    for (NSString *s in pinyinArray)
    {
        if (s.length > 0)
        {
            [initialStr appendString:  [s substringToIndex:1]];
        }
    }
//    [allString appendFormat:@"#%@",initialStr];
//    [allString appendFormat:@",#%@",aString];
//    NSLog(@"zhon:%@ py:%@",aString ,initialStr);
    return initialStr;
}

@end
