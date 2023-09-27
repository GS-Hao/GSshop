//
//  GSTopic+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSTopic+CoreDataProperties.h"

@implementation GSTopic (CoreDataProperties)

+ (NSFetchRequest<GSTopic *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSTopic"];
}

@dynamic id;
@dynamic image;
@dynamic is_follow;
@dynamic name;
@dynamic order;
@dynamic sum;

@end
