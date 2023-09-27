//
//  GSCategory+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/26.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSCategory+CoreDataProperties.h"

@implementation GSCategory (CoreDataProperties)

+ (NSFetchRequest<GSCategory *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSCategory"];
}

@dynamic id;
@dynamic name;
@dynamic order;

@end
