//
//  CUISenderGravityCollisionView.h
//  Pods
//
//  Created by Leon0206 on 2020/5/9.
//

#import <UIKit/UIKit.h>

@protocol CUISenderGravityCollisionViewDelegate <NSObject>

@optional
- (void)numberOfClicked:(NSInteger)count;
- (void)numberOfConcurrentClicked:(NSInteger)count;//实时数据
- (void)senderViewWillBeHidden;

@end


@interface CUISenderGravityCollisionView : UIView
 
@property (nonatomic, weak) id<CUISenderGravityCollisionViewDelegate> delegate;

- (void)setupItemBeginPosition:(CGPoint)point;

- (void)beginClick:(BOOL)shake;

- (void)endClick;

- (void)forceDismissView;

@end
