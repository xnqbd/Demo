//
//  CKJOneBtnCell.m
//  MobileHospital_Renji
//
//  Created by admin2 on 2020/1/14.
//  Copyright © 2020 Lyc. All rights reserved.
//

#import "CKJOneBtnCell.h"

@implementation CKJOneBtnCellModel

- (void)updateBtnData:(void(^)(CKJBtnItemData *btnData))block {
    if (block) {
        block(_btnData);
    }
}

+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight detail:(nullable CKJOneBtnCellRowBlock)detail clickBtn:(CKJOneBtnCellClickBtn)clickBtn updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint {
    CKJOneBtnCellModel *m = [self commonWithCellHeight:cellHeight cellModel_id:nil detailSettingBlock:detail didSelectRowBlock:nil];
    m.updateConstraint = updateConstraint;
    m.clickBtn = clickBtn;
    return m;
}
+ (instancetype)oneBtnWithCellHeight:(nullable NSNumber *)cellHeight title:(id)title detail:(nullable CKJOneBtnCellRowBlock)detail clickBtn:(CKJOneBtnCellClickBtn)clickBtn updateConstraint:(void(^)(MASConstraintMaker *make, UIView *superview))updateConstraint {
    CKJOneBtnCellModel *m = [self oneBtnWithCellHeight:cellHeight detail:nil clickBtn:clickBtn updateConstraint:updateConstraint];
    [m updateBtnData:^(CKJBtnItemData * _Nonnull btnData) {
        btnData.cornerRadius = 5;
        if ([title isKindOfClass:[NSString class]]) {
            btnData.normalAttTitle = WDCKJAttributed2(title, [UIColor whiteColor], @16);
        } else if ([title isKindOfClass:[NSAttributedString class]]) {
            btnData.normalAttTitle = title;
        }
    }];
    if (detail) {
        detail(m);
    }
    return m;
}


- (instancetype)init {
    if (self = [super init]) {
        self.btnData = [[CKJBtnItemData alloc] init];
    }
    return self;
}

@end

@interface CKJOneBtnCell ()

@property (strong, nonatomic) UIButton *oneBtn;

@end

@implementation CKJOneBtnCell


- (void)setupSubViews {
     __weak typeof(self) weakSelf = self;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn kjwd_addTouchUpInsideForCallBack:^(UIButton * _Nonnull _sender) {
        CKJOneBtnCellModel *cellModel = weakSelf.cellModel;
        if (cellModel.clickBtn) {
            cellModel.clickBtn(cellModel, _sender);
        }
    }];
    [btn kjwd_masWithSuperView:self.subviews_SuperView makeConstraints:^(MASConstraintMaker * _Nonnull make, UIView * _Nonnull superview) {
        make.edges.equalTo(superview).insets(UIEdgeInsetsZero);
    }];
    self.oneBtn = btn;
}

- (void)setupData:(__kindof CKJOneBtnCellModel *)model section:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath tableView:(CKJSimpleTableView *)tableView {
    [CKJWorker reloadBtn:_oneBtn btnData:model.btnData];
    [self.oneBtn kjwd_mas_remakeConstraints:model.updateConstraint];
}



@end
