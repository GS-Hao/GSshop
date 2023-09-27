//
//  NSString+MUCommon.h
//  BigCalculate
//
//  Created by wonhigh on 16/10/27.
//  Copyright © 2016年 wonhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MUCommon)

/**
 计算文本需要的size

 @param text    文本
 @param font    文本font
 @param maxSize 限制size

 @return size
 */
+ (CGSize)mu_calculateSizeWithStr:(NSString *)text textFont:(UIFont *)font withMaxSize:(CGSize)maxSize;

/**
 字符串为nil时返回@""
 */
+ (NSString *)nilToString:(NSString *)str;
/** 判断字符串是否为空 */
+ (BOOL)isEmptyString:(NSString *)string;
+ (BOOL)isContainsString:(NSString *)strtitle substr:(NSString *)subStr;
/**
 是否包含某一字符串
 */
- (BOOL)containsString:(NSString *)str;

/**
 MD5
 */
+ (NSString *)mu_md5:(NSString *)str;

+ (NSString *)lc_logDic:(NSDictionary *)dic;
/**
 image转Base64
 */
+ (NSString*)encodeToBase64String:(UIImage*)image ;

@end
