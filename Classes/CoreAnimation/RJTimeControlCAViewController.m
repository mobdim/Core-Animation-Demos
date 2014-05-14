//
//  RJTimeControlCAViewController.m
//  CoreAnimation
//
//  Created by jun on 14-1-7.
//
//


#import "RJTimeControlCAViewController.h"

@interface RJTimeControlCAViewController ()
@property(nonatomic,strong) CALayer *pathCALayer;
@property(nonatomic,strong) CAKeyframeAnimation *pathAnimation;
@end

@implementation RJTimeControlCAViewController

+ (NSString *)displayName {
    
	return @"Control_Animation_Time(控制动画时间)";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //get the layer
    self.pathCALayer = [CALayer layer];
	self.pathCALayer.bounds = CGRectMake(0, 0, 68, 49);
	self.pathCALayer.contents = (id)[UIImage imageNamed:@"pin"].CGImage;
	self.pathCALayer.position = CGPointMake(152, 148);
	self.pathCALayer.anchorPoint = CGPointMake(1.0, 1.0);
    [self.view.layer addSublayer:self.pathCALayer];
    
    //declare a animation path
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: self.pathCALayer.position];
    [bezierPath addLineToPoint:CGPointMake(152, 300)];
    [bezierPath addLineToPoint:CGPointMake(300, 300)];
    [bezierPath addLineToPoint:CGPointMake(300, 148)];
    
    self.pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    self.pathAnimation.path = bezierPath.CGPath;
    self.pathAnimation.duration = 5.0;
    [self.pathCALayer addAnimation:self.pathAnimation forKey:@"pathAnimation"];
    self.pathCALayer.speed = 0.0; //pause the animation
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(80, 450, 100, 44)];
    [slider setMaximumValue:5.0];
    [slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)valueChanged:(id)sender
{
    //control the animation
    UISlider *slide = (UISlider *)sender;
    [self.pathCALayer setTimeOffset:slide.value];
}
@end
