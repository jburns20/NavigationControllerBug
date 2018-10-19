#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomNavigationAnimator : NSObject <UIViewControllerAnimatedTransitioning>
- (instancetype)initWithOperation:(UINavigationControllerOperation)operation;
@end

NS_ASSUME_NONNULL_END
