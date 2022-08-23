//
//  UIView+HYTools.h
//  Swift_Study
//
//  Created by Atlantis on 2022/8/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^HYGestureRecognizerBlock)(UIView * _Nullable view, UIGestureRecognizer * _Nullable gesture);

typedef NS_ENUM(NSUInteger, HYGestureType) {
    HYGestureTypeTap,       // 点击
    HYGestureTypeDouble,    // 双击
    HYGestureTypeLongPress, // 长按
    HYGestureTypeSwipe,     // 轻扫
    HYGestureTypePan,       // 移动
    HYGestureTypeRotate,    // 旋转
    HYGestureTypePinch,     // 缩放
};
/// 枚举映射字符串
static NSString * const _Nonnull HYGestureTypeStringMap[] = {
    [HYGestureTypeTap]       = @"UITapGestureRecognizer",
    [HYGestureTypeDouble]    = @"UITapGestureRecognizer",
    [HYGestureTypeLongPress] = @"UILongPressGestureRecognizer",
    [HYGestureTypeSwipe]     = @"UISwipeGestureRecognizer",
    [HYGestureTypePan]       = @"UIPanGestureRecognizer",
    [HYGestureTypeRotate]    = @"UIRotationGestureRecognizer",
    [HYGestureTypePinch]     = @"UIPinchGestureRecognizer",
};
@interface UIView (HYTools)
@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;
@property(nonatomic) CGFloat offsetX;
@property(nonatomic) CGFloat offsetY;
@property(nonatomic) CGSize size;
@property(nonatomic) CGPoint origin;
@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

/** 判断一个控件是否真正显示在主窗口 */
- (BOOL)xl_isShowingOnKeyWindow;

/** xib创建的view */
+ (_Nullable instancetype)xl_viewFromXib;

/** xib创建的view */
+ (_Nullable instancetype)xl_viewFromXibWithFrame:(CGRect)frame;

/** 寻找子视图 */
- (UIView *_Nullable)xl_FindSubviewRecursively:(BOOL(^_Nullable)(UIView* _Nullable subview, BOOL* _Nullable stop))recurse;
/******************  xib中显示的属性 - xib创建的view右上角才有这几个选项 ******************/
// 注意: 加上IBInspectable就可以可视化显示相关的属性
@property(nonatomic, assign) IBInspectable CGFloat borderWidth;
@property(nonatomic, assign) IBInspectable UIColor *_Nullable borderColor;
@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;
/// 阴影 - View默认颜色ClearColor,阴影不会生效
@property (nonatomic,strong)IBInspectable UIColor *_Nullable shadowColor;// 阴影颜色
@property (nonatomic,assign)IBInspectable CGFloat shadowRadius;// 阴影的圆角
@property (nonatomic,assign)IBInspectable CGFloat shadowOpacity;// 阴影透明度，默认0
@property (nonatomic,assign)IBInspectable CGSize shadowOffset;// 阴影偏移量

/// 画直线
- (void)xl_DrawLineWithPoint:(CGPoint)fPoint toPoint:(CGPoint)tPoint lineColor:(UIColor *_Nullable)color lineWidth:(CGFloat)width;

/// 画虚线
- (void)xl_DrawDashLineWithPoint:(CGPoint)fPoint toPoint:(CGPoint)tPoint lineColor:(UIColor *_Nullable)color lineWidth:(CGFloat)width lineSpace:(CGFloat)space lineType:(NSInteger)type;

/// 画五角星
- (void)xl_DrawPentagramWithCenter:(CGPoint)center radius:(CGFloat)radius color:(UIColor *_Nullable)color rate:(CGFloat)rate;

// 根据宽高画六边形
- (void)xl_DrawSexangleWithWidth:(CGFloat)width LineWidth:(CGFloat)lineWidth StrokeColor:(UIColor *_Nullable)color FillColor:(UIColor *_Nullable)fcolor;

// 根据宽高画八边形   px:放大px点个坐标  py:放大py点个坐标
- (void)xl_DrawOctagonWithWidth:(CGFloat)width Height:(CGFloat)height LineWidth:(CGFloat)lineWidth StrokeColor:(UIColor *_Nullable)color FillColor:(UIColor *_Nullable)fcolor Px:(CGFloat)px Py:(CGFloat)py;

#pragma mark --- gestureBlock ---
/*
 [self.view xl_AddGestureRecognizer:KJGestureTypeTap block:^(UIView *view, UIGestureRecognizer *gesture) {
     // example
     [view removeGestureRecognizer:gesture];
 }];
 */
- (UIGestureRecognizer *_Nullable)xl_AddGestureRecognizer:(HYGestureType)type block:(HYGestureRecognizerBlock _Nullable)block;

/// 单击手势
- (UIGestureRecognizer *_Nullable)xl_AddTapGestureRecognizerBlock:(HYGestureRecognizerBlock _Nullable)block;
@end

NS_ASSUME_NONNULL_END
