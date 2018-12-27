//
//  HFBaseTableViewCell.h
//  Test
//
//  Created by WhenWe on 2018/12/27.
//  Copyright © 2018 Haier. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 tableViewCell Base 
 */
@interface HFBaseTableViewCell : UITableViewCell

+ (instancetype)cellInTableView:(UITableView *)tableView;

+ (instancetype)cellInTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style;

/**
 子类 重写此方法 
 */
- (void)layoutCellUI;

@end



/**
 封装tableView
 */
@interface HFTableView : UITableView

@property (nonatomic, copy) CGFloat (^headerHeight)(NSInteger section, UITableView *tableView);//sectionHeader高度
@property (nonatomic, copy) UIView *(^headerInSection)(NSInteger section, UITableView *tableView);//sectionHeaderView

@property (nonatomic, copy) CGFloat (^footerHeight)(NSInteger section, UITableView *tableView);//sectionFooter高度
@property (nonatomic, copy) UIView *(^footerInSection)(NSInteger section, UITableView *tableView);//sectionFooterView

/**
 实例化工厂方法

 @param frame frame
 @param sectionCount section数量block
 @param rowCount 行数block
 @param cell cell加载Block
 @param cellHeight cell高度Block
 @param selectCell 点击事件block
 @return HFTableView
 */
+ (instancetype)tableViewWithFrame:(CGRect)frame sectionCount:(NSInteger (^)(UITableView *tableView))sectionCount rowCount:(NSInteger (^)(NSInteger sectionIndex, UITableView *tableView))rowCount cell:(HFBaseTableViewCell *(^)(NSIndexPath *indexPath, UITableView *tableView))cell cellHeight:(CGFloat (^)(NSIndexPath *indexPath, UITableView *tableView))cellHeight selectCell:(void(^)(NSIndexPath *indexPath, UITableView *tableView))selectCell;

@end

NS_ASSUME_NONNULL_END
