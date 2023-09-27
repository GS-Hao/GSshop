//
//  GSFollowTopic+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSFollowTopic+CoreDataProperties.h"

@implementation GSFollowTopic (CoreDataProperties)

+ (NSFetchRequest<GSFollowTopic *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSFollowTopic"];
}

@dynamic id;
@dynamic image;
@dynamic name;
@dynamic sum;
@dynamic to_user_id;
@dynamic topic_id;
@dynamic type;
@dynamic user_id;

@end
