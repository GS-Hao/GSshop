//
//  HomeJoke+CoreDataClass.h
//  xiangle
//
//  Created by xianyikang on 2023/6/20.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeJoke : NSManagedObject

+ (NSArray *)getHomeJokeEntitysById:(NSString *)jid;

@end

NS_ASSUME_NONNULL_END

#import "HomeJoke+CoreDataProperties.h"
