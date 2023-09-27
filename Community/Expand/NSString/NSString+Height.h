//
//  NSString+Height.h
//  消汇邦
//
//  Created by 谭显敬 on 2017/7/19.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Height)

+ (CGFloat)heightForString:(NSString*)string fontSize:(NSInteger)fontSize width:(CGFloat)width headerIndent:(CGFloat)headerIndent;
+ (CGFloat)heightForString:(NSString*)string fontSize:(NSInteger)fontSize width:(CGFloat)width headerIndent:(CGFloat)headerIndent lineHeight:(CGFloat)lineHeight;
- (NSAttributedString *)stringWithHeightForFontSize:(NSInteger)fontSize;

/**
  返回文字 该有的 宽度 高度

 @param text 文字
 @param awidth 希望加上的额外宽度
 @param aHegiht 希望加上的额外高度
 @param font 文字大小
 @param maxSize 文字的 宽度 高度 或不传
 @return  Label大小
 */
+(CGSize)sizeWithText:(NSString *)text additionalWidth:(CGFloat)awidth additionalHeight:(CGFloat)aHegiht font:(UIFont *)font maxSize:(CGSize)maxSize;
@end
