//
//  NSString+translationArabicNum.h
//  UNLIFE
//
//  Created by 谭显敬 on 2018/8/20.
//  Copyright © 2018年 wonhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (translationArabicNum)

/**
 将阿拉伯数字转换为中文数字

 @param arabicNum arabicNum description
 @return return value description
 */
+(NSString *)translationArabicNum:(NSInteger)arabicNum;
@end
