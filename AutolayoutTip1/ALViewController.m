//  Copyright (c) 2013年 Tomohiko Himura. All rights reserved.

#import "ALViewController.h"

@interface ALViewController ()

@property (strong,nonatomic) UIView* leftView;
@property (strong,nonatomic) UIView* rightView;

@end

@implementation ALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self createView];
    [self createLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

- (void)createView
{
    _leftView = [UIView new];
    _leftView.translatesAutoresizingMaskIntoConstraints = NO;
    _leftView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_leftView];

    _rightView = [UIView new];
    _rightView.translatesAutoresizingMaskIntoConstraints = NO;
    _rightView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_rightView];
}

- (NSArray*)visualFormats
{
    return @[
             @"|-[_leftView]-40-[_rightView]-|",
             @"[_leftView(==_rightView)]",
             @"V:|-[_leftView]-|",
             @"V:|-[_rightView]-|",
             ];
}

- (void)createLayout
{
    NSDictionary* views = NSDictionaryOfVariableBindings(_leftView, _rightView);

    for (NSString* format in [self visualFormats]) {
        NSArray* constraints;
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:format
                                                             options:NSLayoutFormatDirectionLeadingToTrailing
                                                             metrics:nil
                                                               views:views];
        [self.view addConstraints:constraints];
    }
}

@end
