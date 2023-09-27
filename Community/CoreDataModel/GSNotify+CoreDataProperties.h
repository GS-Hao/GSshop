//
//  GSNotify+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSNotify+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GSNotify (CoreDataProperties)

+ (NSFetchRequest<GSNotify *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSString *create_time;
@property (nonatomic) int32_t id;
@property (nonatomic) int32_t order;
@property (nullable, nonatomic, copy) NSString *url;
@property (nonatomic) int32_t user_id;

@end

NS_ASSUME_NONNULL_END
