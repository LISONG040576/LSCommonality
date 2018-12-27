/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import "UIViewExt.h"
#import "Masonry.h"
#import "LSCommon.h"

CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center)
{
    CGRect newrect = CGRectZero;
    newrect.origin.x = center.x-CGRectGetMidX(rect);
    newrect.origin.y = center.y-CGRectGetMidY(rect);
    newrect.size = rect.size;
    return newrect;
}

@implementation UIView (ViewGeometry)

// Retrieve and set the origin
- (CGPoint) origin
{
	return self.frame.origin;
}

- (void) setOrigin: (CGPoint) aPoint
{
	CGRect newframe = self.frame;
	newframe.origin = aPoint;
	self.frame = newframe;
}


// Retrieve and set the size
- (CGSize) size
{
	return self.frame.size;
}

- (void) setSize: (CGSize) aSize
{
	CGRect newframe = self.frame;
	newframe.size = aSize;
	self.frame = newframe;
}

// Query other frame locations
- (CGPoint) bottomRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) bottomLeft
{
	CGFloat x = self.frame.origin.x;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) topRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y;
	return CGPointMake(x, y);
}


// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) height
{
	return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
	CGRect newframe = self.frame;
	newframe.size.height = newheight;
	self.frame = newframe;
}

- (CGFloat) width
{
	return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
	CGRect newframe = self.frame;
	newframe.size.width = newwidth;
	self.frame = newframe;
}

- (CGFloat) top
{
	return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
	CGRect newframe = self.frame;
	newframe.origin.y = newtop;
	self.frame = newframe;
}

- (CGFloat) left
{
	return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
	CGRect newframe = self.frame;
	newframe.origin.x = newleft;
	self.frame = newframe;
}

- (CGFloat) bottom
{
	return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
	CGRect newframe = self.frame;
	newframe.origin.y = newbottom - self.frame.size.height;
	self.frame = newframe;
}

- (CGFloat) right
{
	return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
	CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
	CGRect newframe = self.frame;
	newframe.origin.x += delta ;
	self.frame = newframe;
}

// Move via offset
- (void) moveBy: (CGPoint) delta
{
	CGPoint newcenter = self.center;
	newcenter.x += delta.x;
	newcenter.y += delta.y;
	self.center = newcenter;
}

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor
{
	CGRect newframe = self.frame;
	newframe.size.width *= scaleFactor;
	newframe.size.height *= scaleFactor;
	self.frame = newframe;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void) fitInSize: (CGSize) aSize
{
	CGFloat scale;
	CGRect newframe = self.frame;
	
	if (newframe.size.height && (newframe.size.height > aSize.height))
	{
		scale = aSize.height / newframe.size.height;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	if (newframe.size.width && (newframe.size.width >= aSize.width))
	{
		scale = aSize.width / newframe.size.width;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	self.frame = newframe;	
}
@end



@implementation UIView (HFHelper)

- (void)loadData:(id)data
{
}

@end


@implementation UIView (HFErrorPlaceHolder)

- (void)showNodataWithImage:(NSString *)imageName noDataInfo:(NSString *)noDataInfo top:(CGFloat)top imageWith:(CGFloat)imageWidth
{
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[HENoDataView class]]) {
            [obj removeFromSuperview];
        }
    }
    
    CGRect nodataVFrame = self.bounds;
    nodataVFrame = CGRectMake(0, 0, self.bounds.size.width, nodataVFrame.size.height);
    HENoDataView *nodataView = [[HENoDataView alloc] initWithFrame:nodataVFrame imageTopHeight:top imageWith:imageWidth showImage:imageName noDataTip:noDataInfo];
    nodataView.backgroundColor = self.backgroundColor;
    [self addSubview:nodataView];
}

- (void)dismissNoDataView
{
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:[HENoDataView class]]) {
            [obj removeFromSuperview];
        }
    }
}

@end




@interface HENoDataView ()

@property (nonatomic, strong) UIImageView *mainIV;//
@property (nonatomic, strong) UILabel *remarkLabel;//提示信息

@end
@implementation HENoDataView
{
    NSString *_imageName;
    NSString *_noDataInfo;
}

- (instancetype)initWithFrame:(CGRect)frame showImage:(NSString *)imageName noDataTip:(NSString *)noDataInfo
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageName = imageName;
        _noDataInfo = noDataInfo;
        [self configViewUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame imageTopHeight:(CGFloat)topHeight imageWith:(CGFloat)imageWidth showImage:(NSString *)imageName noDataTip:(NSString *)noDataInfo
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageName = imageName;
        _noDataInfo = noDataInfo;
        [self configViewUIWithTopHeight:topHeight width:imageWidth];
    }
    return self;
}

- (void)configViewUI
{
    UIImage *image = [UIImage imageNamed:_imageName];
    CGFloat ratio = self.bounds.size.width / 375;
    CGFloat width = image.size.width * ratio;
    CGFloat height = width;
    if (image.size.width != image.size.height) {
        height = image.size.height * ratio;
    }
    //    self.mainIV.image = [UIImage imageNamed:image];
    self.mainIV.image = image;
    self.remarkLabel.text = _noDataInfo;
    
    [self.mainIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-77 * self.bounds.size.height / 603);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
    
    [self.remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.mainIV.mas_bottom).offset(self.bounds.size.height * 27 / 603);
        make.height.mas_lessThanOrEqualTo(100);
    }];
}

- (void)configViewUIWithTopHeight:(CGFloat)topHeight width:(CGFloat)imageWith
{
    UIImage *image = [UIImage imageNamed:_imageName];
    CGFloat ratio = imageWith / image.size.width;
    CGFloat height = imageWith;
    if (image.size.width != image.size.height) {
        height = image.size.height * ratio;
    }
    //    self.mainIV.image = [UIImage imageNamed:image];
    self.mainIV.image = image;
    self.remarkLabel.text = _noDataInfo;
    
    [self.mainIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(topHeight);
        make.width.mas_equalTo(imageWith);
        make.height.mas_equalTo(height);
    }];
    
    [self.remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.mainIV.mas_bottom).offset(self.bounds.size.height * 27 / 603);
        make.height.mas_lessThanOrEqualTo(100);
    }];
}


- (UIImageView *)mainIV
{
    if (!_mainIV) {
        _mainIV = [[UIImageView alloc] init];
        [self addSubview:_mainIV];
    }
    return _mainIV;
}

- (UILabel *)remarkLabel
{
    if (!_remarkLabel) {
        _remarkLabel  = [[UILabel alloc] init];
        _remarkLabel.textColor = UIColorWithHexString(@"999999");
        _remarkLabel.textAlignment = NSTextAlignmentCenter;
        _remarkLabel.font = [UIFont systemFontOfSize:12];
        _remarkLabel.numberOfLines = 0;
        [self addSubview:_remarkLabel];
    }
    return _remarkLabel;
}

@end

