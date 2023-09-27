//
//  CLAlertView.h
//  AlertView
//
//  Created by hezhijingwei on 16/6/15.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^defaultBtnClicked)(UIButton *defaultBtn);

typedef void(^cancelBtnClicked)(UIButton *cancelBtn);


@interface CLAlertView : UIView


@property (nonatomic ,copy) defaultBtnClicked defaultBtnBlock;
@property (nonatomic ,copy) cancelBtnClicked cancelBtnBlock;
- (instancetype)initWithAlertViewWithTitle:(NSString *)title text:(NSString *)text DefauleBtn:(NSString *)defaultBtn cancelBtn:(NSString *)cancelBtn defaultBtnBlock:(defaultBtnClicked)defaultBlock cancelBtnBlock:(cancelBtnClicked)cancelBlock;



- (void)show;


@end
