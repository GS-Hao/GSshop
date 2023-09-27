//
//  GSNotify+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSNotify+CoreDataProperties.h"

@implementation GSNotify (CoreDataProperties)

+ (NSFetchRequest<GSNotify *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSNotify"];
}

@dynamic content;
@dynamic create_time;
@dynamic id;
@dynamic order;
@dynamic url;
@dynamic user_id;

@end
