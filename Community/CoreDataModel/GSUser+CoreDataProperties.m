//
//  GSUser+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSUser+CoreDataProperties.h"

@implementation GSUser (CoreDataProperties)

+ (NSFetchRequest<GSUser *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSUser"];
}

@dynamic avatar;
@dynamic birthday;
@dynamic city;
@dynamic email;
@dynamic followers;
@dynamic following;
@dynamic gender;
@dynamic id;
@dynamic like;
@dynamic nickname;
@dynamic order;
@dynamic posts;
@dynamic province;
@dynamic quotes;
@dynamic status;
@dynamic token;
@dynamic uname;
@dynamic welcome;

@dynamic mobile;
@dynamic passwd;

@end
