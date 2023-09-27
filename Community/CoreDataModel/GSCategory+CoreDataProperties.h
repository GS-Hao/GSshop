//
//  GSCategory+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/26.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSCategory+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GSCategory (CoreDataProperties)

+ (NSFetchRequest<GSCategory *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int32_t order;

@end

NS_ASSUME_NONNULL_END
