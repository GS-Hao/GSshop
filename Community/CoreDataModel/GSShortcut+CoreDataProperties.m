//
//  GSShortcut+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSShortcut+CoreDataProperties.h"

@implementation GSShortcut (CoreDataProperties)

+ (NSFetchRequest<GSShortcut *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSShortcut"];
}

@dynamic count;
@dynamic icon;
@dynamic id;
@dynamic link;
@dynamic order;
@dynamic title;
@dynamic type;

@end
