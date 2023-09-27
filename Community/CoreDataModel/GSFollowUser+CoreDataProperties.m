//
//  GSFollowUser+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSFollowUser+CoreDataProperties.h"

@implementation GSFollowUser (CoreDataProperties)

+ (NSFetchRequest<GSFollowUser *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSFollowUser"];
}

@dynamic avatar;
@dynamic id;
@dynamic nickname;
@dynamic quotes;
@dynamic to_user_id;
@dynamic topic_id;
@dynamic type;
@dynamic user_id;

@end
