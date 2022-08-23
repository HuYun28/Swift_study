//
//  UIView+HYTools.m
//  Swift_Study
//
//  Created by Atlantis on 2022/8/23.
//

#import "UIView+HYTools.h"
#import <objc/runtime.h>
@implementation UIView (HYTools)
- (CGFloat)left{
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)left{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}
- (CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setRight:(CGFloat)right{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)top{
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)height{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setOffsetX:(CGFloat)offsetX{
    self.frame = CGRectOffset(self.frame, offsetX, 0);
}
- (CGFloat)offsetX{
    return 0;
}
- (void)setOffsetY:(CGFloat)offsetY{
    self.frame = CGRectOffset(self.frame, 0, offsetY);
}
- (CGFloat)offsetY{
    return 0;
}
- (void)setSize:(CGSize)size{
    self.frame = CGRectMake(self.left, self.top, size.width, size.height);
}
- (CGSize)size{
    return self.frame.size;
}
- (CGPoint)origin{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin{
    self.frame = CGRectMake(origin.x, origin.y, self.width, self.height);
}
-(CGFloat) centerX{
    return self.center.x;
}
-(void)setCenterX:(CGFloat)centerX{
    self.center=CGPointMake(centerX, self.centerY);
}
-(CGFloat) centerY{
    return self.center.y;
}
-(void)setCenterY:(CGFloat)centerY{
    self.center=CGPointMake(self.centerX,centerY);
}

#pragma mark --- xib中显示的属性 ---
@dynamic borderColor,borderWidth,cornerRadius;
@dynamic shadowColor,shadowRadius,shadowOffset,shadowOpacity;

- (void)setBorderWidth:(CGFloat)borderWidth{
    if (borderWidth <= 0) return;
    [self.layer setBorderWidth:borderWidth];
}
- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}
- (void)setCornerRadius:(CGFloat)cornerRadius{
    [self.layer setCornerRadius:cornerRadius];
    self.layer.masksToBounds = cornerRadius > 0;
}
- (void)setShadowColor:(UIColor *)shadowColor{
    [self.layer setShadowColor:shadowColor.CGColor];
}
- (void)setShadowRadius:(CGFloat)shadowRadius{
    [self.layer setShadowRadius:shadowRadius];
}
- (void)setShadowOpacity:(CGFloat)shadowOpacity{
    [self.layer setShadowOpacity:shadowOpacity];
}
- (void)setShadowOffset:(CGSize)shadowOffset{
    [self.layer setShadowOffset:shadowOffset];
}
// 画直线
- (void)xl_DrawLineWithPoint:(CGPoint)fPoint toPoint:(CGPoint)tPoint lineColor:(UIColor *)color lineWidth:(CGFloat)width{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    if (color) shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = ({
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:fPoint];
        [path addLineToPoint:tPoint];
        path.CGPath;
    });
    shapeLayer.lineWidth = width;
    [self.layer addSublayer:shapeLayer];
}
// 画虚线
- (void)xl_DrawDashLineWithPoint:(CGPoint)fPoint toPoint:(CGPoint)tPoint lineColor:(UIColor *)color lineWidth:(CGFloat)width lineSpace:(CGFloat)space lineType:(NSInteger)type{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    if (color) shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = ({
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:fPoint];
        [path addLineToPoint:tPoint];
        path.CGPath;
    });
    //第一格虚线缩进多少 - the degree of indent of the first cell
    //shapeLayer.lineDashPhase = 4;
    shapeLayer.lineWidth = width;
    shapeLayer.lineCap = kCALineCapButt;
    shapeLayer.lineDashPattern = @[@(width),@(space)];
    if (type == 1) {
        shapeLayer.lineCap = kCALineCapRound;
        shapeLayer.lineDashPattern = @[@(width),@(space+width)];
    }
    [self.layer addSublayer:shapeLayer];
}
- (void)xl_DrawPentagramWithCenter:(CGPoint)center radius:(CGFloat)radius color:(UIColor *)color rate:(CGFloat)rate{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor clearColor].CGColor;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    if (color) {
        shapeLayer.fillColor = color.CGColor;
    }
    shapeLayer.path = ({
        UIBezierPath *path = [UIBezierPath bezierPath];
        //五角星最上面的点
        CGPoint first  = CGPointMake(center.x, center.y-radius);
        [path moveToPoint:first];
        //点与点之间点夹角为2*M_PI/5.0,要隔一个点才连线
        CGFloat angle = 4 * M_PI / 5.0;
        if (rate > 1.5) rate = 1.5;
        for (int i= 1; i <= 5; i++) {
            CGFloat x = center.x - sinf(i*angle)*radius;
            CGFloat y = center.y - cosf(i*angle)*radius;
            CGFloat midx = center.x - sinf(i*angle-2*M_PI/5.0)*radius*rate;
            CGFloat midy = center.y - cosf(i*angle-2*M_PI/5.0)*radius*rate;
            [path addQuadCurveToPoint:CGPointMake(x, y) controlPoint:CGPointMake(midx, midy)];
        }
        path.CGPath;
    });
    shapeLayer.lineWidth = 1.0f;
    shapeLayer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:shapeLayer];
}
// 画正六边形
- (void)xl_DrawSexangleWithWidth:(CGFloat)width LineWidth:(CGFloat)lineWidth StrokeColor:(UIColor *)color FillColor:(UIColor *)fcolor{
    //在绘制layer之前先把之前添加的layer移除掉，如果不这么做，你就会发现设置多次image 之后，本view的layer上就会有多个子layer，
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperlayer];
    }];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [self getSexangleCGPath:width];
    shapeLayer.strokeColor = color == nil ? [UIColor lightGrayColor].CGColor : color.CGColor;
    shapeLayer.fillColor =  fcolor == nil ? [UIColor clearColor].CGColor : fcolor.CGColor;
    shapeLayer.lineWidth = lineWidth;
    //    view.layer.mask = shapeLayer;
    /** 将shapeLayer添加到shapLayer上方*/
    //    [view.layer insertSublayer:shapeLayer above:shapeLayer];
    
    [self.layer addSublayer:shapeLayer];
}
// 根据宽高画八边形
- (void)xl_DrawOctagonWithWidth:(CGFloat)width Height:(CGFloat)height LineWidth:(CGFloat)lineWidth StrokeColor:(UIColor *)color FillColor:(UIColor *)fcolor Px:(CGFloat)px Py:(CGFloat)py{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [self getOctagonCGPath:width Height:height Px:px Py:py];
    shapeLayer.strokeColor = color == nil ? [UIColor lightGrayColor].CGColor : color.CGColor;
    shapeLayer.fillColor = fcolor == nil ? [UIColor clearColor].CGColor : fcolor.CGColor;
    shapeLayer.lineWidth = lineWidth;
    [self.layer addSublayer:shapeLayer];
}
#pragma mark - 贝塞尔曲线算出路径坐标
/** 计算菱形的UIBezierPath*/
- (CGPathRef)getSexangleCGPath:(CGFloat)w {
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake((sin(M_1_PI/180*60))*(w/2), (w/4))];
    [path addLineToPoint:CGPointMake((w/2), 0)];
    [path addLineToPoint:CGPointMake(w-((sin(M_1_PI/180*60))*(w/2)), (w/4))];
    [path addLineToPoint:CGPointMake(w-((sin(M_1_PI/180*60))*(w/2)), (w/2)+(w/4))];
    [path addLineToPoint:CGPointMake((w/2), w)];
    [path addLineToPoint:CGPointMake((sin(M_1_PI/180*60))*(w/2), (w/2)+(w/4))];
    [path closePath];
    return path.CGPath;
}
// 八边形坐标
- (CGPathRef)getOctagonCGPath:(CGFloat)w Height:(CGFloat)h Px:(CGFloat)px Py:(CGFloat)py{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat t = h/(2+sqrt(2));
    CGFloat m = w - 2*t;
    CGFloat r = sqrt(2)*t;
    // 未完成算偏移的坐标
    [path moveToPoint:CGPointMake(t-px,0-py)];
    [path addLineToPoint:CGPointMake(t+m+px,0-py)];
    [path addLineToPoint:CGPointMake(w+px,t)];
    [path addLineToPoint:CGPointMake(w+px,t+r)];
    [path addLineToPoint:CGPointMake(m+t+px,h+py)];
    [path addLineToPoint:CGPointMake(t-px,h+py)];
    [path addLineToPoint:CGPointMake(0-px,t+r)];
    [path addLineToPoint:CGPointMake(0-px,t)];
    
    [path closePath];  // 闭合
    return path.CGPath;
}
#pragma mark --- gestureBlock ---
static const char *HYGestureBlockKey;
/// 单击手势
- (UIGestureRecognizer*)xl_AddTapGestureRecognizerBlock:(HYGestureRecognizerBlock)block{
    return [self xl_AddGestureRecognizer:HYGestureTypeTap block:block];
}

- (UIGestureRecognizer*)xl_AddGestureRecognizer:(HYGestureType)type block:(HYGestureRecognizerBlock)block{
    self.userInteractionEnabled = YES; /// 开启可交互
    if (block) {
        NSString *string = HYGestureTypeStringMap[type];
        UIGestureRecognizer *gesture = [[NSClassFromString(string) alloc] initWithTarget:self action:@selector(xlGestureAction:)];
        [gesture setDelaysTouchesBegan:YES];// 解决点击当前view时候响应其他控件事件
        /// 单指双击
        if (type == HYGestureTypeDouble) {
            for (UIGestureRecognizer *recognizer in self.gestureRecognizers) {
                if ([recognizer isKindOfClass:[UITapGestureRecognizer class]] &&
                    ((UITapGestureRecognizer*)recognizer).numberOfTapsRequired == 1) {
                    [recognizer requireGestureRecognizerToFail:gesture];//如果双击成立，则取消单击手势（双击的时候不回走单击事件）
                }
            }
            ((UITapGestureRecognizer*)gesture).numberOfTouchesRequired = 1;//手指数
            ((UITapGestureRecognizer*)gesture).numberOfTapsRequired = 2;
        }
        [self addGestureRecognizer:gesture];
        NSMutableDictionary *dict = objc_getAssociatedObject(self, HYGestureBlockKey);
        if (dict == nil) {
            dict = [NSMutableDictionary dictionary];
            objc_setAssociatedObject(self, HYGestureBlockKey, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        [dict setObject:block forKey:string];
        return gesture;
    }
    return nil;
}
- (void)xlGestureAction:(UIGestureRecognizer*)gesture{
    NSMutableDictionary *dict = objc_getAssociatedObject(gesture.view, HYGestureBlockKey);
    HYGestureRecognizerBlock block = dict[NSStringFromClass([gesture class])];
    !block?:block(gesture.view, gesture);
}
/** 判断一个控件是否真正显示在主窗口 */
- (BOOL)xl_isShowingOnKeyWindow{
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    // 主窗口的bounds 和 self的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}
/** xib创建的view */
+ (instancetype)xl_viewFromXib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
+ (instancetype)xl_viewFromXibWithFrame:(CGRect)frame {
    UIView *view = [self xl_viewFromXib];
    view.frame = frame;
    return view;
}
/** 寻找子视图 */
- (UIView*)xl_FindSubviewRecursively:(BOOL(^)(UIView *subview, BOOL *stop))recurse{
    for (UIView *view in self.subviews) {
        BOOL stop = NO;
        if(recurse(view, &stop)) {
            return [view xl_FindSubviewRecursively:recurse];/// 递归查找
        }else if(stop) {
            return view;
        }
    }
    return nil;
}
@end
