#import "SecondTestViewController.h"
#import "CustomNavigationAnimator.h"
#import "ThirdTestViewController.h"

@interface SecondTestViewController () <UINavigationControllerDelegate>

@end

@implementation SecondTestViewController {
  UIView *_topSubview;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  _topSubview = [UIView new];
  _topSubview.backgroundColor = [UIColor blueColor];
  _topSubview.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:_topSubview];

  [[_topSubview.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
  [[_topSubview.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
  [[_topSubview.widthAnchor constraintEqualToConstant:20] setActive:YES];
  [[_topSubview.heightAnchor constraintEqualToConstant:20] setActive:YES];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Show Modal" style:UIBarButtonItemStylePlain target:self action:@selector(showModal:)];
}

- (void)viewWillAppear:(BOOL)animated
{
  self.navigationController.navigationBar.hidden = NO;
  self.navigationController.delegate = self;
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

- (void)showModal:(id)sender
{
  [self.navigationController presentViewController:[[ThirdTestViewController alloc] initWithNibName:nil bundle:nil] animated:YES completion:nil];
}

@end
