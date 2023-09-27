//
//  GSLike+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSLike+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GSLike (CoreDataProperties)

+ (NSFetchRequest<GSLike *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nonatomic) float cellHeight;
@property (nullable, nonatomic, copy) NSString *content;
@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *image;
@property (nullable, nonatomic, copy) NSString *images;
@property (nonatomic) int32_t joke_id;
@property (nonatomic) int32_t order;
@property (nonatomic) int32_t topic_id;
@property (nonatomic) int32_t type;
@property (nonatomic) int32_t user_id;
@property (nullable, nonatomic, copy) NSString *video;

@end

NS_ASSUME_NONNULL_END
