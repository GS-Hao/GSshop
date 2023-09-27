//
//  GSFollowTopic+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSFollowTopic+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GSFollowTopic (CoreDataProperties)

+ (NSFetchRequest<GSFollowTopic *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *image;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int32_t sum;
@property (nonatomic) int32_t to_user_id;
@property (nonatomic) int32_t topic_id;
@property (nonatomic) int32_t type;
@property (nonatomic) int32_t user_id;

@end

NS_ASSUME_NONNULL_END
