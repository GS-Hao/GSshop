//
//  HomeJoke+CoreDataProperties.m
//  xiangle
//
//  Created by xianyikang on 2023/6/20.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "HomeJoke+CoreDataProperties.h"

@implementation HomeJoke (CoreDataProperties)

+ (NSFetchRequest<HomeJoke *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"HomeJoke"];
}

@dynamic avatar;
@dynamic cellHeight;
@dynamic content;
@dynamic id;
@dynamic image;
@dynamic images;
@dynamic is_favorite;
@dynamic is_follow;
@dynamic is_like;
@dynamic nickname;
@dynamic quotes;
@dynamic topic_id;
@dynamic topic_name;
@dynamic type;
@dynamic user_id;
@dynamic video;
@dynamic order;

@end
