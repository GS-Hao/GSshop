//
//  GSComment+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/26.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSComment+CoreDataProperties.h"

@implementation GSComment (CoreDataProperties)

+ (NSFetchRequest<GSComment *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GSComment"];
}

@dynamic avatar;
@dynamic cellHeight;
@dynamic content;
@dynamic id;
@dynamic image;
@dynamic images;
@dynamic joke_content;
@dynamic joke_id;
@dynamic nickname;
@dynamic order;
@dynamic topic_id;
@dynamic type;
@dynamic user_id;
@dynamic video;

@end
