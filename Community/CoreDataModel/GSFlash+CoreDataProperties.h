//
//  GSFlash+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSFlash+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GSFlash (CoreDataProperties)

+ (NSFetchRequest<GSFlash *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *image;
@property (nonatomic) int32_t order;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
