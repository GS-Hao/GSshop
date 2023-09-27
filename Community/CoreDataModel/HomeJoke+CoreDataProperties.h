//
//  HomeJoke+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/20.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "HomeJoke+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface HomeJoke (CoreDataProperties)

+ (NSFetchRequest<HomeJoke *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *avatar;
@property (nonatomic) float cellHeight;
@property (nullable, nonatomic, copy) NSString *content;
@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *image;
@property (nullable, nonatomic, copy) NSString *images;
@property (nonatomic) int32_t is_favorite;
@property (nonatomic) int32_t is_follow;
@property (nonatomic) int32_t is_like;
@property (nullable, nonatomic, copy) NSString *nickname;
@property (nullable, nonatomic, copy) NSString *quotes;
@property (nonatomic) int32_t topic_id;
@property (nullable, nonatomic, copy) NSString *topic_name;
@property (nonatomic) int32_t type;
@property (nonatomic) int32_t user_id;
@property (nullable, nonatomic, copy) NSString *video;

@property (nonatomic) int32_t order;

@end

NS_ASSUME_NONNULL_END
