//
//  NSString+Time.h
//  UNLIFE
//
//  Created by 谭显敬 on 2018/8/1.
//  Copyright © 2018年 wonhigh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TimeString)
/** 获取当前时间戳 毫秒 */
+(NSString *)getNowTimeTimestampSSS;
/**
 格式化时间
 
 @return MM-dd hh:mm
 */
- (NSString *)timeStringWithYYMMDD;
- (NSString *)timeString;
+(NSString *)dateConversionTimeStamp:(NSDate *)date;
/**
 时间戳转yyyy-MM-dd HH:mm:ss

 @return yyyy-MM-dd HH:mm:ss
 */
-(NSString *)timeStampToString;

+ (NSString *)base64EncodeString:(NSString *)string;
- (NSString *)convertToChineseTime;
//获取当前的时间
/** 获取当前的时间  时分秒 */
+(NSString*)getCurrentTimesShiFenMiao;
/** 时间戳转年月日*/
-(NSString *)timeStampToStringYMD;
/**
 MM-DD weak

 @return .
 */
-(NSString *)timeToMMDDweak;

/**
 HHmmss

 @return .
 */
-(NSString *)timeToHHmmss;
- (NSString *)convertToPriceString;

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize textAlignment:(NSTextAlignment)alignment;

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize;

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight;

- (NSString *)stringByTrimmingAllWhiteCharacter;

/**
 得到当前年月 YY-MM

 @return 年月
 */
+(NSString*)getCurrentYearAndMonth;
/**
 得到当前时间 YY-MM-dd

 @return YY-MM-dd
 */
+(NSString*)getCurrentTimes;
//日期字符串转时间戳
+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime Formatter:(NSString *)matter;


/**
传入某天的时间，返回未来几天的时间 正数=未来 负数=之前
 @param daystr 当前时间字符串
 @param daynumber 需要返回未来的几天 正数=未来 负数=之前
 @return 未来几天的日期
 */
+(NSMutableArray *)GetToFutureDay:(NSString *)daystr day:(NSInteger)daynumber;
+(NSString*)Getweek:(NSString *)dayStr;
/*
 
 * 需要传入的时间格式 2017-06-14 14:18:54
 
 */


// 和当前时间进行比较  输出字符串为（刚刚几个小时前 几天前 ）

+(NSString *)inputTimeStr:(NSString *)timeStr;

//把时间字符串转换成NSDate 
+ (NSDate *)becomeDateStr:(NSString *)dateStr;
//把时间转换成星期

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
//判断是否为昨天
+ (BOOL)isYesterdayWithDate:(NSDate *)newDate;
//判断今天是本周的第几天
+ (int)getNowDateWeek;
/** 时间戳转年月日 时分秒 */
+ (NSString *)date_timestampToString:(NSInteger)timestamp;
/** 时间戳转 时分秒 */
+ (NSString *)date_times_HH_mm_sstampToString:(NSInteger)timestamp;
//时间戳转年月日
+ (NSString *)date_timestampToStringYYYYMMDD:(NSInteger)timestamp;
/** 获取当前时间戳 秒 */
+(NSString *)getNowTimeTimestampss;


+ (NSString *)ArrayOrDicZhuanJsonWithData:(id)Data;
//年月日转为时间戳
+ (NSString *)stringToDate:(NSString *)dateStr Format:(NSString *)format;

/**
是否为今天
**/
- (BOOL)isToday;
 

@end
