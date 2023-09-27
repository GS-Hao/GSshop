//
//  GSShortcut+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSShortcut+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GSShortcut (CoreDataProperties)

+ (NSFetchRequest<GSShortcut *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nonatomic) int32_t count;
@property (nullable, nonatomic, copy) NSString *icon;
@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *link;
@property (nonatomic) int32_t order;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *type;

@end

NS_ASSUME_NONNULL_END
