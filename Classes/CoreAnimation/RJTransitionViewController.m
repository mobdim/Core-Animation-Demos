//
//  RJTransitionViewController.m
//  CoreAnimation
//
//  Created by jun on 14-1-8.
//
//

#import "RJTransitionViewController.h"

@interface RJTransitionViewController ()
@property(nonatomic,strong) UIView *firstView;
@property(nonatomic,strong) UIView *secondView;
@end

@implementation RJTransitionViewController

+ (NSString *)displayName {
	return @"Transiton_CA";
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
    self.firstView = [[UIView alloc]initWithFrame:self.view.frame];
    [self.firstView setBackgroundColor:[UIColor blueColor]];
    [self.firstView setHidden:NO];
    [self.view addSubview:self.firstView];
    
    self.secondView = [[UIView alloc]initWithFrame:self.view.frame];
    [self.secondView setBackgroundColor:[UIColor redColor]];
    [self.secondView setHidden:YES];
    [self.view addSubview:self.secondView];
    
    UIButton *animationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [animationButton addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [animationButton setBackgroundColor:[UIColor blackColor]];
    [animationButton setTitle:@"start" forState:UIControlStateNormal];
    [animationButton setFrame:CGRectMake(100, 400, 100, 44)];
    [self.view addSubview:animationButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startAnimation:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.startProgress = 0.0;
    transition.endProgress = 1.0;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    transition.duration = 0.5;
    
    //add animation to the two views's layers
    [self.firstView.layer addAnimation:transition forKey:@"transition"];
    [self.secondView.layer addAnimation:transition forKey:@"transition"];
    
    //finally,change status
    [self.firstView setHidden:!self.firstView.hidden];
    [self.secondView setHidden:!self.secondView.hidden];
}
@end
