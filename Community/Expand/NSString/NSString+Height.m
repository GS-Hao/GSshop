//
//  NSString+Height.m
//  消汇邦
//
//  Created by 谭显敬 on 2017/7/19.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "NSString+Height.h"

@implementation NSString (Height)

+ (CGFloat)heightForString:(NSString*)string fontSize:(NSInteger)fontSize width:(CGFloat)width headerIndent:(CGFloat)headerIndent{
    return [self heightForString:string fontSize:fontSize width:width headerIndent:0 lineHeight:fontSize + 5];
}

+ (CGFloat)heightForString:(NSString*)string fontSize:(NSInteger)fontSize width:(CGFloat)width headerIndent:(CGFloat)headerIndent lineHeight:(CGFloat)lineHeight{
    NSMutableParagraphStyle *style =[[NSMutableParagraphStyle alloc]init];
    style.minimumLineHeight = lineHeight;
    if (headerIndent > 0) {
        style.firstLineHeadIndent = headerIndent;
    }
    if (string.length == 0) {
        return 0;
    }
    NSAttributedString *temp = [[NSAttributedString alloc]initWithString:string attributes:@{
                                                                                             NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                                                                             NSParagraphStyleAttributeName:style}];
    
    return [temp boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size.height;
    
}

- (NSAttributedString *)stringWithHeightForFontSize:(NSInteger)fontSize{
    if (self.length == 0) {
        return nil;
    }
    NSMutableParagraphStyle *style =[[NSMutableParagraphStyle alloc]init];
    style.minimumLineHeight = fontSize + 5;
    NSAttributedString *temp = [[NSAttributedString alloc]initWithString:self attributes:@{
                                                                                           NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                                                                           NSParagraphStyleAttributeName:style}];
    
    return temp;
    
}
+(CGSize)sizeWithText:(NSString *)text additionalWidth:(CGFloat)awidth additionalHeight:(CGFloat)aHegiht font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName : font};
        CGSize size =[text boundingRectWithSize:CGSizeMake(maxSize.width, maxSize.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
        return CGSizeMake(size.width + awidth, size.height + aHegiht);

}
@end
