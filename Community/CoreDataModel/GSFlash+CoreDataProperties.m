//
//  GSFlash+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSFlash+CoreDataProperties.h"

@implementation GSFlash (CoreDataProperties)

+ (NSFetchRequest<GSFlash *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSFlash"];
}

@dynamic id;
@dynamic image;
@dynamic order;
@dynamic title;
@dynamic url;

@end
