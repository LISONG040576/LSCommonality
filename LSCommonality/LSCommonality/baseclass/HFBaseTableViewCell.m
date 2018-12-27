//
//  HFBaseTableViewCell.m
//  Test
//
//  Created by WhenWe on 2018/12/27.
//  Copyright © 2018 Haier. All rights reserved.
//

#import "HFBaseTableViewCell.h"

@interface HFBaseTableViewCell ()



@end

@implementation HFBaseTableViewCell

+ (instancetype)cellInTableView:(UITableView *)tableView
{
    //    NSString *cellID = NSStringFromClass(self);
    HFBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self)];
    }
    return cell;
}

+ (instancetype)cellInTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style
{
    HFBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:NSStringFromClass(self)];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self layoutCellUI];
    }
    return self;
}

- (void)layoutCellUI
{
    
}

- (UILabel *)baseLabel
{
    if (!_baseLabel) {
        _baseLabel = [[UILabel alloc] init];
        _baseLabel.textColor = [UIColor blackColor];
        _baseLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_baseLabel];
    }
    return _baseLabel;
}

- (UILabel *)baseMainLabel
{
    if (!_baseMainLabel) {
        _baseMainLabel = [[UILabel alloc] init];
        _baseMainLabel.textColor = [UIColor lightGrayColor];
        _baseMainLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_baseMainLabel];
    }
    return _baseMainLabel;
}

- (UILabel *)baseSubMainLabel
{
    if (!_baseSubMainLabel) {
        _baseSubMainLabel = [[UILabel alloc] init];
        _baseSubMainLabel.textColor = [UIColor lightGrayColor];
        _baseSubMainLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_baseSubMainLabel];
    }
    return _baseSubMainLabel;
}

- (UILabel *)baseDetailLabel
{
    if (!_baseDetailLabel) {
        _baseDetailLabel = [[UILabel alloc] init];
        _baseDetailLabel.textColor = [UIColor lightGrayColor];
        _baseDetailLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_baseDetailLabel];
    }
    return _baseDetailLabel;
}

- (UILabel *)baseSubDetailLabel
{
    if (!_baseSubDetailLabel) {
        _baseSubDetailLabel = [[UILabel alloc] init];
        _baseSubDetailLabel.textColor = [UIColor lightGrayColor];
        _baseSubDetailLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_baseSubDetailLabel];
    }
    return _baseSubDetailLabel;
}

- (UIImageView *)baseIV
{
    if (!_baseIV) {
        _baseIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_baseIV];
    }
    return _baseIV;
}

- (UIImageView *)baseMainIV
{
    if (!_baseMainIV) {
        _baseMainIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_baseMainIV];
    }
    return _baseMainIV;
}

- (UIView *)baseHorizonLine
{
    if (!_baseHorizonLine) {
        _baseHorizonLine = [[UIView alloc] init];
        _baseHorizonLine.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_baseHorizonLine];
    }
    return _baseHorizonLine;
}


@end





@interface HFTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSInteger (^sectionCountBlock)(UITableView *tableView);//
@property (nonatomic, copy) NSInteger (^rowCountBlock)(NSInteger sectionIndex, UITableView *tableView);//
@property (nonatomic, copy) HFBaseTableViewCell * (^cellBlock)(NSIndexPath *indexPath, UITableView *tableView);//
@property (nonatomic, copy) CGFloat (^cellHeightBlock)(NSIndexPath *indexPath, UITableView *tableView);//
@property (nonatomic, copy) void (^selectCellBlock)(NSIndexPath *indexPath, UITableView *tableView);//

@end

@implementation HFTableView

+ (instancetype)tableViewWithFrame:(CGRect)frame sectionCount:(NSInteger (^)(UITableView *tableView))sectionCount rowCount:(NSInteger (^)(NSInteger sectionIndex, UITableView *tableView))rowCount cell:(HFBaseTableViewCell *(^)(NSIndexPath *indexPath, UITableView *tableView))cell cellHeight:(CGFloat (^)(NSIndexPath *indexPath, UITableView *tableView))cellHeight selectCell:(void(^)(NSIndexPath *indexPath, UITableView *tableView))selectCell
{
    HFTableView *tableView = [[self alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.sectionCountBlock = sectionCount;
    tableView.rowCountBlock = rowCount;
    tableView.cellBlock = cell;
    tableView.cellHeightBlock = cellHeight;
    tableView.selectCellBlock = selectCell;
    return tableView;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        if (@available(iOS 11.0, *)) {
            self.estimatedRowHeight = 0;
            self.estimatedSectionFooterHeight = 0;
            self.estimatedSectionHeaderHeight = 0;
        }
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.sectionCountBlock) {
        return self.sectionCountBlock(tableView);
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.rowCountBlock) {
        return self.rowCountBlock(section, tableView);
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellBlock) {
        id cell = self.cellBlock(indexPath, tableView);
        if (cell) {
            return cell;
        }
    }
    HFBaseTableViewCell *cell = [HFBaseTableViewCell cellInTableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeightBlock) {
        return self.cellHeightBlock(indexPath, tableView);
    }
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectCellBlock) {
        self.selectCellBlock(indexPath, tableView);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.headerHeight) {
        return self.headerHeight(section, tableView);
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.headerInSection) {
        return self.headerInSection(section, tableView);
    }
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.footerHeight) {
        return self.footerHeight(section, tableView);
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.footerInSection) {
        return self.footerInSection(section, tableView);
    }
    return [[UIView alloc] initWithFrame:CGRectZero];
}

@end
