//
//  GSFollowUser+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSFollowUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GSFollowUser (CoreDataProperties)

+ (NSFetchRequest<GSFollowUser *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *avatar;
@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *nickname;
@property (nullable, nonatomic, copy) NSString *quotes;
@property (nonatomic) int32_t to_user_id;
@property (nonatomic) int32_t topic_id;
@property (nonatomic) int32_t type;
@property (nonatomic) int32_t user_id;

@end

NS_ASSUME_NONNULL_END
