//
//  RootViewController.m
//  MINI
//
//  Created by dianji on 13-4-15.
//  Copyright (c) 2013年 dianji. All rights reserved.
//

#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ZCWScrollNumView.h"
@interface RootViewController ()

@end

@implementation RootViewController
@synthesize progressView;
@synthesize scrollNumber;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)yesButtonClicked:(id)sender
{
    
    isGoing = NO;
    tag=0;
    secondView.hidden=YES;
    endView.hidden=YES;
    yesView.hidden=YES;
    noView.hidden=YES;
    backGroundView.hidden = YES;
    firtView.hidden=NO;
    pageScrollView.hidden=NO;
    pageScrollView.contentOffset=CGPointMake(0, 0);
    NSLog(@"%f",firtView.frame.origin.x);
    
}
-(void)noButtonClicked:(id)sender
{
    isGoing = NO;
    tag=1;
    secondView.hidden=YES;
    endView.hidden=YES;
    yesView.hidden=YES;
    noView.hidden=YES;
    backGroundView.hidden = YES;
    firtView.hidden=NO;
    pageScrollView.hidden=NO;
    pageScrollView.contentOffset=CGPointMake(0, 0);
}
-(void)sureButtonClicked:(id)sender
{
    for (UIView *view in endView.subviews) {
        if ([view isKindOfClass:[ZCWScrollNumView class]] || [view isKindOfClass:[UILabel class]]) {
            [view removeFromSuperview];
        }
    }
    
    
    //高分和低分得两个图片名字数组
       endView.hidden = YES;
       
        yesView.hidden = NO;

    if (tag==0) {//如果是高分，选择得加载图片是yes系列得
        
        if (yesView == nil) {
            yesView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yes.png"]];
            [self.view addSubview:yesView];
            [yesView release];
            yesView.userInteractionEnabled=YES;
            //在两个view上面都加上按钮
            UIButton*yesButton=[UIButton buttonWithType:UIButtonTypeCustom];
            yesButton.frame=CGRectMake(540, 850, 150, 60);
            yesButton.backgroundColor=[UIColor clearColor];
            [yesButton addTarget:self action:@selector(yesButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//            [noView addSubview:yesButton];
            [yesView addSubview:yesButton];
            
            UIButton*noButton=[UIButton buttonWithType:UIButtonTypeCustom];
            noButton.frame=CGRectMake(320, 850, 150, 60);
            [noButton addTarget:self action:@selector(noButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            noButton.backgroundColor=[UIColor clearColor];
//            [noView addSubview:noButton];
            [yesView addSubview:noButton];

        }
    }
    else {
        noView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"NO.png"]];
        [self.view addSubview:noView];
        [noView release];
        noView.userInteractionEnabled=YES;
        //在两个view上面都加上按钮
        UIButton*yesButton=[UIButton buttonWithType:UIButtonTypeCustom];
        yesButton.frame=CGRectMake(540, 850, 150, 60);
        yesButton.backgroundColor=[UIColor clearColor];
        [yesButton addTarget:self action:@selector(yesButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [noView addSubview:yesButton];
//        [yesView addSubview:yesButton];
        
        UIButton*noButton=[UIButton buttonWithType:UIButtonTypeCustom];
        noButton.frame=CGRectMake(320, 850, 150, 60);
        [noButton addTarget:self action:@selector(noButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        noButton.backgroundColor=[UIColor clearColor];
        [noView addSubview:noButton];
//        [yesView addSubview:noButton];
        
        
          }
   
    
    }
-(void)addEndDigital
{
    for (int i=0; i<6; i++) {
        scrollNumber=[[ZCWScrollNumView alloc]initWithFrame:CGRectMake(410, 300+i*68, 200, 35)];
        self.scrollNumber.numberSize = 7;
        self.scrollNumber.digitColor = [UIColor redColor];
        scrollNumber.backgroundColor=[UIColor clearColor];
        self.scrollNumber.digitFont = [UIFont fontWithName:@"Courier" size:28.0];
        [self.scrollNumber didConfigFinish];
        [endView addSubview:scrollNumber];
        [scrollNumber release];
         if (tag==0) {//是点击确定按钮，一定是yes得情况下        
        [self.scrollNumber setLargeNumber:rand() withAnimationType:ZCWScrollNumAnimationTypeNormal animationTime:0.3];
        
         
         }
        else
        {
        
        [self.scrollNumber setLittleNumber:rand() withAnimationType:ZCWScrollNumAnimationTypeFromLast animationTime:0.3];
        }
    
    
    }

  }
-(void)creatAnimation
{
   
    //三个imageview和数字label
    for (UIView *view in endView.subviews) {
        if ([view isKindOfClass:[UIImageView class]] || [view isKindOfClass:[UILabel class]]) {
            [view removeFromSuperview];
        }
    }
 //两条线打开动画
    UIImageView*lineImage1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line.png"]];
    lineImage1.frame=CGRectMake(128, 595, 507, 50);
    [UIView animateWithDuration:1 animations:^{
        CGRect rect = lineImage1.frame;
        rect.origin.y =196;
        lineImage1.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
    [endView addSubview:lineImage1];
    [lineImage1 release];
    
    UIImageView*lineImage2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"line.png"]];
    lineImage2.frame=CGRectMake(128, 630, 507, 50);
    [UIView animateWithDuration:1 animations:^{
        CGRect rect = lineImage2.frame;
        rect.origin.y =740;
        lineImage2.frame = rect;
    } completion:^(BOOL finished) {
       //完成打开动画
        
        [self addEndDigital];
    }];
    [endView addSubview:lineImage2];
    [lineImage2 release];
    
    [scrollNumber removeFromSuperview];
    scrollNumber=nil;
    //创建imageview
    if (tag==0) {
        UIImageView*passImageView=[[UIImageView alloc]initWithFrame:CGRectMake(520, 70, 230, 230)];
        passImageView.image=[UIImage imageNamed:@"pass.png"];
        [endView addSubview:passImageView];
        [passImageView release];
    }
    else{
    
    
    }
    //创建确定按钮
    UIButton*sureButton=[UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame=CGRectMake(300, 810, 230, 100);
    [sureButton addTarget:self action:@selector(sureButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    sureButton.backgroundColor=[UIColor clearColor];
    [endView addSubview:sureButton];

}

/*
- (void)progressChange
{
    
    if (progressView.progress > 1.0f)
    {
        [progressView removeFromSuperview];
        [tishiLabel removeFromSuperview];
        tishiLabel = nil;
        progressView = nil;
        if ([_timer isValid]) {
            [_timer invalidate];
            _timer = nil;
        }
        [self creatAnimation];
    }
    else
    {
        progressView.progress += 0.01;
    
    }
}
 */
-(void)creatEndView
{
    if (endView == nil) {
        endView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        endView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"endView.png"]];
        [self.view addSubview:endView];
        [endView release];
    }
    
    
    //三个imageview和数字label
    for (UIView *view in endView.subviews) {
        if ([view isKindOfClass:[UIImageView class]] || [view isKindOfClass:[UILabel class]]) {
            [view removeFromSuperview];
        }
    }
    endView.hidden=NO;
    [self creatAnimation];
    
}
-(void)beganAnimation1:(id)sender
{
    if (isGoing) {
        isGoing = NO;
        return;
    }
    else{
        isGoing = NO;
    UIAlertView*alter=[[UIAlertView alloc]initWithTitle:nil message:@"请把手掌放在可监测区域" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        [alter release];
    }

}

-(void)beganAnimation:(UIGestureRecognizer*)gestruer
{
    if (gestruer.state==UIGestureRecognizerStateBegan) {
           isGoing=YES;//记录是否执行
        pageScrollView.hidden=YES;
            firtView.hidden=YES;
            secondView.hidden=NO;
            backGroundView.hidden = NO;
            //扫瞄动画
            CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:@"position"];
            translation.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetWidth(self.view.frame) / 2,60 )];
            translation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetWidth(self.view.frame) / 2, CGRectGetHeight(self.view.frame)-60)];
            translation.delegate = self;
            translation.duration = 3;
            translation.repeatCount = HUGE_VALF;
            translation.autoreverses = YES;
            
           [secondView.layer addAnimation:translation forKey:@"translation"];
        NSLog(@"%f",translation.repeatCount);
    }
    if (gestruer.state==UIGestureRecognizerStateEnded) {
        pageScrollView.hidden=YES;
        firtView.hidden=YES;
        backGroundView.hidden = YES;
        secondView.hidden=YES;
        [secondView.layer removeAnimationForKey:@"translation"];
    }
    if (gestruer.state==UIGestureRecognizerStateCancelled|gestruer.state==UIGestureRecognizerStateFailed) {
        NSLog(@"12345678");
        [secondView.layer removeAnimationForKey:@"translation"];
        secondView.hidden=YES;
        backGroundView.hidden=YES;
        firtView.hidden=NO;
        pageScrollView.hidden=NO;
        UIAlertView*alter=[[UIAlertView alloc]initWithTitle:nil message:@"请把手掌放在可监测区域" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        [alter release];
    }

}
-(void)stopAnimation
{

    firtView.hidden=YES;
    backGroundView.hidden = YES;
    secondView.hidden=YES;
//    [self creatEndView];


}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
   
}
-(void)firstDone:(id)sender
{
pageScrollView.contentOffset=CGPointMake(self.view.bounds.size.width, 0);

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    tag=0;
    NSUInteger numberOfPages1 = 2;
    
    //加载scrollview,首页是说明，第二页是firstview
    pageScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width, self.view.bounds.size.height)];
    [pageScrollView setPagingEnabled: YES] ;
    //滚动到达边界会立刻停止，以免看到下面的东西
    pageScrollView.bounces=NO;

	[pageScrollView setContentSize: CGSizeMake(pageScrollView.bounds.size.width * numberOfPages1, pageScrollView.bounds.size.height)] ;
    [self.view addSubview:pageScrollView];
//第一页：说明页面

    UIImageView*imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0.0f, pageScrollView.bounds.size.width, pageScrollView.bounds.size.height)];
    imageview.image=[UIImage imageNamed:[NSString stringWithFormat:@"1.png"]];
    imageview.userInteractionEnabled=YES;
    UIButton*done=[UIButton buttonWithType:UIButtonTypeCustom];
    done.frame=CGRectMake(320, 920, 150, 80);
    done.backgroundColor=[UIColor clearColor];
    [done addTarget:self action:@selector(firstDone:) forControlEvents:UIControlEventTouchUpInside];
    [imageview addSubview:done];
    [pageScrollView addSubview:imageview];
    [imageview release];

    //第二页面监测页面
    firtView=[[UIView alloc]initWithFrame:CGRectMake(pageScrollView.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    firtView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"firstBackground.png"]];
    firtView.userInteractionEnabled = YES;
    [pageScrollView addSubview:firtView];
    firtView.hidden=NO;
    [firtView release];
    
    //加一个透明按钮
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor=[UIColor clearColor];
    button.frame=CGRectMake(0, 0, firtView.bounds.size.width, firtView.bounds.size.width);
    [button addTarget:self action:@selector(beganAnimation1:) forControlEvents:UIControlEventTouchUpInside];
    [firtView addSubview:button];
    
    //button长按事件
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(beganAnimation:)];
    longPress.minimumPressDuration = 0.1; //定义按的时间
    [button addGestureRecognizer:longPress];
    [longPress release];

    backGroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    backGroundView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"secondBackground.png"]];
    [self.view addSubview:backGroundView];
    backGroundView.hidden = YES;
    [backGroundView release];
    
    secondView=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 273)];
    secondView.image = [UIImage imageNamed:@"line.png"];

    [self.view addSubview:secondView];
    secondView.hidden=YES;
    [secondView release];
    
    

}
# pragma -animationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"结束动画");
    firtView.hidden=YES;
    pageScrollView.hidden=YES;
    backGroundView.hidden = YES;
    secondView.hidden=YES;
    [self creatEndView];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
