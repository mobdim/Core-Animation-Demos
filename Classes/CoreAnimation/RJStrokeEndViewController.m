//
//  RJStrokeEndViewController.m
//  CoreAnimation
//
//  Created by jun on 14-5-14.
//
//

#import "RJStrokeEndViewController.h"

@interface RJStrokeEndViewController ()
@property(nonatomic,strong) CAShapeLayer *strokeLayer;
@property(nonatomic,strong) CABasicAnimation *strokeAnimation;
@end

@implementation RJStrokeEndViewController

+ (NSString *)displayName {
    
	return @"Stroke End Animation";
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.strokeLayer = [CAShapeLayer layer];
    self.strokeLayer.fillColor = [UIColor clearColor].CGColor;
    self.strokeLayer.strokeColor = [UIColor greenColor].CGColor;
    self.strokeLayer.lineWidth = 10.0f;
    self.strokeLayer.lineCap = kCALineCapRound;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 100, 100, 100) cornerRadius:50];
    self.strokeLayer.path = path.CGPath;
    [self.view.layer addSublayer:self.strokeLayer];
    
    self.strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    self.strokeAnimation.duration = 1.0f;
    self.strokeAnimation.fromValue = @0;
    self.strokeAnimation.toValue = @1;
    [self.strokeLayer addAnimation:self.strokeAnimation forKey:@"strokeEnd"];
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(80, 450, 100, 44)];
    [slider setMaximumValue:1.0];
    [slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}
- (void)valueChanged:(UISlider *)slider
{
    self.strokeLayer.strokeEnd = slider.value;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
