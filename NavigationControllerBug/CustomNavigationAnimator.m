#import "CustomNavigationAnimator.h"

@implementation CustomNavigationAnimator
{
  UINavigationControllerOperation _operation;
}

- (instancetype)initWithOperation:(UINavigationControllerOperation)operation
{
  if (self = [super init]) {
    _operation = operation;
  }
  return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
  return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
  UIViewController *const toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIViewController *const fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

  [transitionContext.containerView addSubview:fromViewController.view];
  [transitionContext.containerView addSubview:toViewController.view];

  const CGRect offScreenTrailingFrame = CGRectMake(CGRectGetMaxX(transitionContext.containerView.frame), 0, transitionContext.containerView.frame.size.width, transitionContext.containerView.frame.size.height);
  const CGRect offScreenLeadingFrame = CGRectMake(-(transitionContext.containerView.frame.size.width), 0, transitionContext.containerView.frame.size.width, transitionContext.containerView.frame.size.height);

  toViewController.view.frame = _operation == UINavigationControllerOperationPush
  ? offScreenTrailingFrame
  : offScreenLeadingFrame;

  [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    toViewController.view.frame = CGRectMake(0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
    fromViewController.view.frame = self->_operation == UINavigationControllerOperationPush
    ? offScreenLeadingFrame
    : offScreenTrailingFrame;
  } completion:^(BOOL finished) {
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
  }];
}

@end
