//
//  GraphicVC.m
//  Demo
//
//  Created by admin2 on 2020/3/17.
//  Copyright © 2020 admin2. All rights reserved.
//

#import "GraphicVC.h"
#import "GraphicCell.h"
#import <MJRefresh/MJRefresh.h>
#import "NetWorkResponse.h"


@interface GraphicVC ()

@end

@implementation GraphicVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
    
    __weak typeof(self) weakSelf = self;
    
    MJRefreshNormalHeader *headerRefresh =  [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf firstNetwork];
    }];
    headerRefresh.lastUpdatedTimeLabel.hidden = YES;
    self.simpleTableView.mj_header = headerRefresh;
    [self.simpleTableView.mj_header beginRefreshing];
}



#pragma mark - CKJSimpleTableViewDataSource
- (nonnull NSDictionary <NSString *, NSDictionary <NSString *, id>*> *)returnCell_Model_keyValues:(CKJSimpleTableView *_Nonnull)s {
    return @{
        NSStringFromClass([GraphicCellModel class]) : @{KJPrefix_cellKEY : NSStringFromClass([GraphicCell class]), KJPrefix_isRegisterNibKEY : @YES}
    };
}


#pragma mark - JXCategoryListContentViewDelegate
- (UIView *)listView {
    return self.view;
}

#pragma mark - 网络
- (void)firstNetwork {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.simpleTableView.mj_header endRefreshing];
        

        NSMutableArray *result = [NSMutableArray array];
        
        for (int i = 0; i < 10; i++) {
            CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
                GraphicNetData *data = [GraphicNetData modelWithDic:@{}];
                data.content = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
                data.personName = @"李四";
                data.date = @"20120-03-17";
                data.answerNum = @"10";
                data.adoptionStatus = @"尚已采纳";
                data.answerStatus = @"已经回答";
                
                GraphicCellModel *model1 = [GraphicCellModel commonWithCellHeight:@100 cellModel_id:nil detailSettingBlock:^(GraphicCellModel * _Nonnull m) {
                    m.networkData = data;
                } didSelectRowBlock:nil];
                _sec.modelArray = @[model1];
            }];
            [result addObject:section1];
        }
        
        self.simpleTableView.dataArr = result;
        [self.simpleTableView reloadData];
    });
}

@end