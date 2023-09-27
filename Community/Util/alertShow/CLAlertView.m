//
//  CLAlertView.m
//  AlertView
//
//  Created by hezhijingwei on 16/6/15.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "CLAlertView.h"

#define CLCUSTOMSCREEN_FRAME [UIScreen mainScreen].bounds
#define CLCUSTOMSCREEN_SIZE [UIScreen mainScreen].bounds.size

#define CLCUSTOMSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define CLCUSTOMSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height



@interface CLAlertView ()

@property (nonatomic ,strong) UIView *contentView;

@property (nonatomic ,strong) NSString *defaultBtn;

@property (nonatomic ,strong) NSString *cancelBtn;


@property (nonatomic ,strong) NSString *text;


@property (nonatomic ,strong) NSString *title;

@property (nonatomic ,strong) UIButton *cancelButton;


@end



@implementation CLAlertView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CLCUSTOMSCREEN_FRAME];
    if (self) {
        
        
        [self setupUI];

    }
    return self;
}

- (instancetype)initWithAlertViewWithTitle:(NSString *)title text:(NSString *)text DefauleBtn:(NSString *)defaultBtn cancelBtn:(NSString *)cancelBtn defaultBtnBlock:(defaultBtnClicked)defaultBlock cancelBtnBlock:(cancelBtnClicked)cancelBlock
{
    self = [super init];
    if (self) {
        
        self.title = title;
        self.text = text;
        self.defaultBtn = defaultBtn;
        self.cancelBtn = cancelBtn;
        self.cancelBtnBlock = cancelBlock;
        self.defaultBtnBlock = defaultBlock;
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
    self.backgroundColor = [UIColor clearColor];
    self.frame = CLCUSTOMSCREEN_FRAME;
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.frame];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.3;
    [self addSubview:bgView];
    
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:view];
    view.center = self.center;
    view.backgroundColor = [UIColor whiteColor]; 
    view.frame = CGRectMake(self.frame.size.width/2.0 , -10, 240.0/320*CLCUSTOMSCREEN_WIDTH, 10);
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 11;
    self.contentView = view;
}

- (void)alertViewWithTitle:(NSString *)title text:(NSString *)text DefauleBtn:(NSString *)defaultBtn cancelBtn:(NSString *)cancelBtn {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.contentView.frame.size.width - 20, 25)];
    label.font = [UIFont systemFontOfSize:15];
	
    [self.contentView addSubview:label];
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
	UIView *linview = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(label.frame), self.contentView.frame.size.width - 20, 0.6)];
	linview.backgroundColor = [UIColor colorWithString:@"#cccccc"];
	[self.contentView addSubview:linview];
    UITextView *textLabel = [[UITextView alloc] init];
	textLabel.textAlignment = NSTextAlignmentLeft;
    textLabel.text = text;
	textLabel.editable = NO;
	textLabel.selectable = NO;
    textLabel.textColor = [UIColor grayColor];
    textLabel.font = [UIFont systemFontOfSize:14];
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	paragraphStyle.lineSpacing = 2;// 字体的行间距
	NSDictionary *attributes = @{ NSFontAttributeName:textLabel.font , NSParagraphStyleAttributeName:paragraphStyle  ,NSForegroundColorAttributeName:textLabel.textColor};
	textLabel.attributedText = [[NSAttributedString alloc]initWithString: textLabel.text attributes:attributes];
	 textLabel.typingAttributes = attributes;
	CGFloat maxW  = self.contentView.width - 20 ;
	CGFloat maxH = MAXFLOAT ;
	CGSize maxsize = CGSizeMake(maxW, maxH);
	CGSize size  = [text boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:textLabel.typingAttributes context:nil].size;
	textLabel.frame = (CGRect){{10, CGRectGetMaxY(label.frame) + 6},size};
    if (size.height <= 55){
		textLabel.height = 55;
	}else if (size.height >= 150){
		textLabel.height = 150;
	}
    [self.contentView addSubview:textLabel];
    UIView *Hview = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(textLabel.frame), self.contentView.frame.size.width-20, 0.6)];
    Hview.backgroundColor = [UIColor colorWithString:@"#cccccc"];
    [self.contentView addSubview:Hview];
    
    UIButton *defaultButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:defaultButton];
    defaultButton.frame = CGRectMake((self.contentView.width - 90)/2, CGRectGetMaxY(textLabel.frame)+7, 90, 30);
	defaultButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [defaultButton setTitle:cancelBtn forState:UIControlStateNormal];
	[defaultButton setTitleColor:[UIColor colorWithString:@"#31C27C"] forState:(UIControlStateNormal)];
	
    [defaultButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	defaultButton.layer.cornerRadius = 6;
	defaultButton.layer.borderColor = [UIColor colorWithString:@"#31C27C"].CGColor;
	defaultButton.layer.borderWidth = 0.6;
	defaultButton.layer.masksToBounds = YES;
	 self.contentView.frame = CGRectMake(self.center.x - 120.0/320*CLCUSTOMSCREEN_WIDTH , (CLCUSTOMSCREEN_HEIGHT - CGRectGetMaxY(defaultButton.frame)-7)/2, 240.0/320*CLCUSTOMSCREEN_WIDTH, CGRectGetMaxY(defaultButton.frame)+7);
	
}

- (void)cancelButtonClicked:(UIButton *)sender {

    if (_cancelBtnBlock) {
        _cancelBtnBlock(sender);
    }
    
     [self remove];
    
}


- (void)defaultBtnClicked:(UIButton *)sender {

    if (_defaultBtnBlock) {
        _defaultBtnBlock(sender);
    }
    
    [self remove];
}


- (void)remove {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    
   
    
}

- (void)show {
    
    [self alertViewWithTitle:self.title text:self.text DefauleBtn:self.defaultBtn cancelBtn:self.cancelBtn];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
//    [self.superview addSubview:self];
    
}




@end
