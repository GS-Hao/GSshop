//
//  NSString+MUCommon.m
//  BigCalculate
//
//  Created by wonhigh on 16/10/27.
//  Copyright © 2016年 wonhigh. All rights reserved.
//

#import "NSString+MUCommon.h"
#import "CommonCrypto/CommonDigest.h"

@implementation NSString (MUCommon)

#pragma mark - 计算文本需要的size
+ (CGSize)mu_calculateSizeWithStr:(NSString *)text textFont:(UIFont *)font withMaxSize:(CGSize)maxSize
{
    //高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
    //    CGSize size =CGSizeMake(KSCREENWIDTH ,height);
    //    获取当前文本的属性
    
    //ios7方法，获取文本需要的size，限制宽度
    
    CGSize  actualsize =[text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    actualsize.height = actualsize.height + 0.1;
    actualsize.width = actualsize.width + 2.0f;
    return actualsize;
}

+ (NSString *)nilToString:(NSString *)str
{
    if (str == nil || [str isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return str;
}

- (BOOL)containsString:(NSString *)str
{
	str = [NSString stringWithFormat:@"%@",str];
    if (!str) {
        return NO;
    }
    NSRange range = [self rangeOfString:str];
    if (range.location != NSNotFound)
    {
        return YES;
    }else
    {
        return NO;
    }
}

+ (NSString *)mu_md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    if (cStr == NULL) {
        cStr = "";
    }
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}
+ (BOOL)isEmptyString:(NSString *)string
{
	if (GSisKindOfClass(string, NSString)) {
		if (string == nil ||  [string containsString:@"null"] || [string isEqualToString:@""] ||
			 [string isEqualToString:@" "]) {
			 return YES;
		 }
		 if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] ==
			 0) {
			 return YES;
		 }
		 return NO;
	}else if ([string isKindOfClass:[NSNull class]]){
        return YES;
    }else{
		return YES;
	}
} 

+ (BOOL)isContainsString:(NSString *)strtitle substr:(NSString *)subStr{
	if ([strtitle rangeOfString:subStr].location != NSNotFound) {
		 return YES;
	}else{
		return NO;
	}
}
+ (NSString *)lc_logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}
/**
 image转Base64
 */
+ (NSString*)encodeToBase64String:(UIImage*)image {
    
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
}

@end
