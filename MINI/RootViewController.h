//
//  RootViewController.h
//  MINI
//
//  Created by dianji on 13-4-15.
//  Copyright (c) 2013年 dianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DACircularProgressView.h"
@class ZCWScrollNumView;
@interface RootViewController : UIViewController<UIGestureRecognizerDelegate>
{
    UIView *firtView;
    UIImageView *secondView;
    UIView *endView;
    UIImageView *yesView;
    UIImageView *noView;
    int tag;//纪录选择的ok还是返回按钮
    UIView *backGroundView;
    int tpaCount;
    BOOL isExit;
    BOOL isGoing;
    NSTimer *_timer;
    UILabel*tishiLabel;
    UIScrollView * pageScrollView ;
}
@property (strong, nonatomic) DACircularProgressView *progressView;
@property (retain, nonatomic)  ZCWScrollNumView *scrollNumber;
@end
