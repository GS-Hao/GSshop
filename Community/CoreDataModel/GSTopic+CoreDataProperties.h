//
//  GSTopic+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSTopic+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GSTopic (CoreDataProperties)

+ (NSFetchRequest<GSTopic *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *image;
@property (nonatomic) int32_t is_follow;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int32_t order;
@property (nonatomic) int32_t sum;

@end

NS_ASSUME_NONNULL_END
