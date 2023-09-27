//
//  GSUser+CoreDataProperties.h
//  xiangle
//
//  Created by xianyikang on 2023/6/21.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "GSUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GSUser (CoreDataProperties)

+ (NSFetchRequest<GSUser *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *avatar;
@property (nullable, nonatomic, copy) NSString *birthday;
@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *email;
@property (nonatomic) int32_t followers;
@property (nonatomic) int32_t following;
@property (nonatomic) int32_t gender;
@property (nonatomic) int32_t id;
@property (nonatomic) int32_t like;
@property (nullable, nonatomic, copy) NSString *nickname;
@property (nonatomic) int32_t order;
@property (nonatomic) int32_t posts;
@property (nullable, nonatomic, copy) NSString *province;
@property (nullable, nonatomic, copy) NSString *quotes;
@property (nonatomic) int32_t status;
@property (nullable, nonatomic, copy) NSString *token;
@property (nullable, nonatomic, copy) NSString *uname;
@property (nullable, nonatomic, copy) NSString *welcome;

@property (nullable, nonatomic, copy) NSString *mobile;
@property (nullable, nonatomic, copy) NSString *passwd;

@end

NS_ASSUME_NONNULL_END
