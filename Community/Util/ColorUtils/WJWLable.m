
//
//  WJWLable.m
//  wjwcloudhospital
//
//  Created by ykdzswb on 16/6/15.
//  Copyright © 2016年 WJW. All rights reserved.
//

#import "WJWLable.h"

@implementation WJWLable
-(void)lable:(UILabel*)lab frame:(CGRect )frame font:(UIFont *)font textColor:(UIColor *)textcolor text:(NSString *)text {
    lab.frame = frame;
    lab.font = font;
    lab.textColor = textcolor;
    lab.text = text;
    lab.textAlignment = NSTextAlignmentCenter;
}
@end
