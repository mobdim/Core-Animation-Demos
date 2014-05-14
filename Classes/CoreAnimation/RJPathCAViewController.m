//
//  RJPathCAViewController.m
//  CoreAnimation
//
//  Created by jun on 14-1-7.
//
//

#import "RJPathCAViewController.h"

@interface RJPathCAViewController ()
@property(nonatomic,strong) CALayer *pathCALayer;
@property(nonatomic,strong) CAKeyframeAnimation *pathAnimation;
@end

@implementation RJPathCAViewController

+ (NSString *)displayName {
	return @"Path Core Animation";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.pathCALayer = [CALayer layer];
	self.pathCALayer.bounds = CGRectMake(0, 0, 68, 49);
	self.pathCALayer.contents = (id)[UIImage imageNamed:@"pin"].CGImage;
	self.pathCALayer.position = CGPointMake(152, 148);
	self.pathCALayer.anchorPoint = CGPointMake(1.0, 1.0);
    [self.view.layer addSublayer:self.pathCALayer];
    
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [startButton setBackgroundColor:[UIColor blueColor]];
    [startButton setTitle:@"start path animation" forState:UIControlStateNormal];
    [startButton setFrame:CGRectMake(80, 400, 200, 44)];
    [startButton addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
}
- (void)startAnimation:(id)sender
{
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: self.pathCALayer.position];
    [bezierPath addLineToPoint:CGPointMake(152, 300)];
    [bezierPath addLineToPoint:CGPointMake(300, 300)];
    [bezierPath addLineToPoint:CGPointMake(300, 148)];
    
    self.pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    self.pathAnimation.path = bezierPath.CGPath;
    self.pathAnimation.duration = 5.0;
    
    [self.pathCALayer addAnimation:self.pathAnimation forKey:@"pathAnimation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated. 
}

@end
