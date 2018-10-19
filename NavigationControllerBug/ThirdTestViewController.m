#import "ThirdTestViewController.h"

@interface ThirdTestViewController ()

@end

@implementation ThirdTestViewController {
  UIButton *_dismissButton;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor yellowColor];
  _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [_dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
  [_dismissButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [_dismissButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_dismissButton];
}

- (void)viewWillLayoutSubviews
{
  [super viewWillLayoutSubviews];
  [_dismissButton sizeToFit];
  _dismissButton.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
}

- (void)dismiss:(id)sender
{
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
