//
//  THViewController.m
//  THProgressView-Demo
//
//  Created by Tiago Henriques on 10/22/13.
//  Copyright (c) 2013 Tiago Henriques. All rights reserved.
//

#import "THViewController.h"
#import "THProgressView.h"


#define DEFAULT_BLUE [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]


static const CGSize progressViewSize = { 200.0f, 30.0f };


@interface THViewController ()
@property (nonatomic) CGFloat progress;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *progressViews;
@end


@implementation THViewController

- (void)viewDidLoad
{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetMidY(self.view.bounds))];
    topView.backgroundColor = [UIColor blackColor];
    
    THProgressView *topProgressView = [[THProgressView alloc] initWithFrame:CGRectMake(CGRectGetMidX(topView.frame) - progressViewSize.width / 2.0f,
                                                                                       CGRectGetMidY(topView.frame) - progressViewSize.height / 2.0f,
                                                                                       progressViewSize.width,
                                                                                       progressViewSize.height)];
    topProgressView.borderTintColor = [UIColor whiteColor];
    topProgressView.progressTintColor = [UIColor whiteColor];
    [topView addSubview:topProgressView];
    [self.view addSubview:topView];

    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetMidY(self.view.bounds))];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    THProgressView *bottomProgressView = [[THProgressView alloc] initWithFrame:CGRectMake(CGRectGetMidX(bottomView.frame) - progressViewSize.width / 2.0f,
                                                                                          CGRectGetMidY(topView.frame) - progressViewSize.height / 2.0f,
                                                                                          progressViewSize.width,
                                                                                          progressViewSize.height)];
    bottomProgressView.borderTintColor = DEFAULT_BLUE;
    bottomProgressView.progressTintColor = DEFAULT_BLUE;
    [bottomView addSubview:bottomProgressView];
    [self.view addSubview:bottomView];
    
    
    self.progressViews = @[ topProgressView, bottomProgressView ];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}

- (void)updateProgress
{
    self.progress += 0.20f;
    if (self.progress > 1.0f) {
        self.progress = 0;
    }
 
    [self.progressViews enumerateObjectsUsingBlock:^(THProgressView *progressView, NSUInteger idx, BOOL *stop) {
        [progressView setProgress:self.progress animated:YES];
    }];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
