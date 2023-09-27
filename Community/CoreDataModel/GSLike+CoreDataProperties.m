//
//  GSLike+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSLike+CoreDataProperties.h"

@implementation GSLike (CoreDataProperties)

+ (NSFetchRequest<GSLike *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSLike"];
}

@dynamic cellHeight;
@dynamic content;
@dynamic id;
@dynamic image;
@dynamic images;
@dynamic joke_id;
@dynamic order;
@dynamic topic_id;
@dynamic type;
@dynamic user_id;
@dynamic video;

@end
