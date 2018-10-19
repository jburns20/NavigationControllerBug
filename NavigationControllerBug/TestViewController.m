#import "TestViewController.h"

#import "SecondTestViewController.h"
#import "CustomNavigationAnimator.h"

@interface TestViewController () <UINavigationControllerDelegate>

@end

@implementation TestViewController {
  UIView *_topSubview;
  UIButton *_nextButton;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.navigationController.navigationBar.translucent = NO;
  self.view.backgroundColor = [UIColor whiteColor];
  _topSubview = [UIView new];
  _topSubview.backgroundColor = [UIColor blueColor];
  _topSubview.translatesAutoresizingMaskIntoConstraints = NO;
  _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [_nextButton setTitle:@"Next" forState:UIControlStateNormal];
  [_nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [_nextButton addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_topSubview];
  [self.view addSubview:_nextButton];

  [[_topSubview.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
  [[_topSubview.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
  [[_topSubview.widthAnchor constraintEqualToConstant:20] setActive:YES];
  [[_topSubview.heightAnchor constraintEqualToConstant:20] setActive:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
  self.navigationController.navigationBar.hidden = YES;
  self.navigationController.delegate = self;
}

- (void)viewWillLayoutSubviews
{
  [super viewWillLayoutSubviews];
  [_nextButton sizeToFit];
  _nextButton.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
  switch (operation) {
    case UINavigationControllerOperationPush:
    case UINavigationControllerOperationPop:
      return [[CustomNavigationAnimator alloc] initWithOperation:operation];
    default:
      return nil;
  }
}

- (void)next:(id)sender
{
  [self.navigationController pushViewController:[[SecondTestViewController alloc] initWithNibName:nil bundle:nil] animated:YES];
}

@end
