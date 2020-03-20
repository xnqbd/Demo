//
//  CKJCellVC.m
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/3/14.
//  Copyright © 2019年 Lyc. All rights reserved.
//

#import "CKJCellVC.h"
#import "UIView+CKJDesingable.h"
#import "WDYHFHospitalItem.h"
#import "CKJToolPickerView.h"
#import "CKJLeftRightTopEqualCell.h"
#import "CKJLeftRightCenterEqualCell.h"
#import "KJSupportObjcListVC.h"

@interface CKJCellVC ()

/** 当前选中的区域 */
@property (strong, nonatomic, nullable) WDYHFAreaItem *selectAreaItem;
/** 当前选中的医院 */
@property (strong, nonatomic, nullable) WDYHFHospitalItem *selectHospitalItem;

/** 默认医院 */
@property (strong, nonatomic, nullable) WDYHFHospitalItem *defaultHospitalItem;
/** 默认区域 */
@property (strong, nonatomic, nullable) WDYHFAreaItem *defaultAreaItem;

@end

@implementation CKJCellVC

#define kkkk_YHFStatusCellID @"kkkk_YHFStatusCellID"

#define kkkk_NotificationCellID @"kkkk_NotificationCellID"

#define kkkk_HospitalCellID @"kkkk_HospitalCellID"

- (void)setSelectHospitalItem:(WDYHFHospitalItem *)selectHospitalItem {
    _selectHospitalItem = selectHospitalItem;
    self.defaultHospitalItem = selectHospitalItem;
}

- (void)setSelectAreaItem:(WDYHFAreaItem *)selectAreaItem {
    _selectAreaItem = selectAreaItem;
    self.defaultAreaItem = selectAreaItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CKJCell示例";
    [self reloadUI];
}

#pragma mark - 父类相关

- (void)reloadUI {
    
    NSDictionary *leftDic = @{NSForegroundColorAttributeName : [UIColor darkGrayColor]};
    NSDictionary *rightDic = @{NSForegroundColorAttributeName : [UIColor darkTextColor], NSFontAttributeName : [UIFont systemFontOfSize:16]};
    
    KJ_typeweakself
    
    CGFloat rowHeight = 55;
    
    CGFloat leftMarign = 15;
    CGFloat rightMarign = 15;
    
    CKJCommonSectionModel *section1 = [CKJCommonSectionModel sectionWithHeaderAttString:WDCKJAttributed2(@"CKJCell的结构", [UIColor grayColor], @15) headerAlignment:NSTextAlignmentLeft detailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        
        NSMutableAttributedString *footer = WDCKJAttributed2(@"默认情况下title3、switch6是不会被拉伸和压缩的，优先级属于最高是1000；\nlikePrice7次之优先级是850； \nsubTitle4次之，会换行、自适应高度； \nTopBottom5优先级最低，容易拉伸和压缩", [UIColor grayColor], @15);
        [footer appendAttributedString:WDCKJAttributed2(@"\n\n因为CKJCell在CellForRow里面做了很多清除约束和添加约束的操作，所以一个CKJSimpleTableView不要使用过多的CKJCell。\n\n", [UIColor redColor], @15)];
        [footer appendAttributedString:WDCKJAttributed2(@"CKJCell.m文件里有BOOL debug = NO;可以将其改为YES调试", [UIColor grayColor], @15)];
        
        //            section.footerModel = [CKJTitleStyleHeaderFooterModel modelWithAttributedString:footer type:CKJCommonHeaderFooterType_FOOTER];;
        _sec.footerHeight = @20;
        
        CKJCellModel *model1 = [CKJCellModel ckjCellWithCellHeight:@84 cellModel_id:kkkk_YHFStatusCellID detailSettingBlock:^(CKJCellModel *m) {
            m.image2Model = [CKJImage2Model image2ModelWithImageString:@"touxiang.jpg" size:CGSizeMake(25, 25) left:0];
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed(@"title3", leftDic) left:0];
            m.subTitle4Model = [CKJSubTitle4Model subTitle4ModelWithAttributedText:WDCKJAttributed2(@"sub4", [UIColor kjwd_subTitle], @14) top:0 left:0 bottom:0 right:0];
            m.btn5Model = [CKJCellBtnModel btnModelWithSize:CGSizeMake(40, 40) normalImage:nil rightMargin:0 detailSettingBlock:^(CKJCellBtnModel * _Nonnull sender) {
                [sender changeNormalText:@"btn5"];
            } didClickBtnHandle:^(CKJCell * _Nonnull cell, CKJCellBtnModel * _Nonnull btn5Model) {
                NSLog(@"当前分区%ld  %ld行,  点击了btn5", (long)cell.section, (long)cell.row);
            }];
            m.view5Model = [CKJView5Model view5ModelWithTopAttributedText:WDCKJAttributed2(@"topText5", [UIColor kjwd_title], @14) bottomAttributedText:WDCKJAttributed2(@"bottomTex5", [UIColor kjwd_subTitle], @14) centerMarign:5 topBottomMargin:3 leftMargin:0 rightMargin:0];
            m.switch6Model = [CKJSwitch6Model switch6ModelWithSwitchOn:YES left:0 top:0 bottom:0 callBack:^(BOOL switchOn, CKJCellModel * _Nonnull cellModel, UISwitch * _Nonnull senderSwitch) {
                NSLog(@"当前分区%ld  %ld行,  点击了UISwitch，当前状态是 %@ ", (long)cellModel.cell.section, (long)cellModel.cell.row, switchOn ? @"开" : @"关");
            }];
            m.likePrice61Model = [CKJLikePriceLabel61Model likePriceModelWithAttText:WDCKJAttributed2(@"price61", [UIColor kjwd_subTitle], @14) left:0 right:0];

            m.btn7Model = [CKJCellBtnModel btnModelWithSize:CGSizeMake(30, 30) normalImage:[UIImage kjwd_imageNamed:@"touxiang.jpg"] rightMargin:0 detailSettingBlock:nil didClickBtnHandle:^(CKJCell * _Nonnull cell, CKJCellBtnModel * _Nonnull btn7Model) {
                NSLog(@"当前分区%ld  %ld行,  点击了btn7", (long)cell.section, (long)cell.row);
            }];
            m.likePrice8Model = [CKJLikePriceLabel8Model likePriceLabel8ModelWithAttText:WDCKJAttributed2(@"price8", [UIColor kjwd_subTitle], @14) left:0 right:0];
            m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
        } didSelectRowBlock:nil];
        
        _sec.modelArray = @[model1];
        
    }];
    
    CKJCommonSectionModel *section2 = [CKJCommonSectionModel sectionWithDetailSetting:^(__kindof CKJCommonSectionModel * _Nonnull _sec) {
        _sec.rowHeight = @(rowHeight);
        
        CKJCellModel *model0 = [CKJCellModel ckjCellWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(CKJCellModel *m) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed(@"头像", leftDic) left:leftMarign];
            m.subTitle4Model = [CKJSubTitle4Model subTitle4ModelWithAttributedText:nil top:0 left:0 bottom:0 right:0];
            m.btn7Model = [CKJCellBtnModel btnModelWithSize:CGSizeMake(30, 30) normalImage:[UIImage kjwd_imageNamed:@"touxiang.jpg"] rightMargin:10 detailSettingBlock:^(CKJCellBtnModel *sender) {
                sender.cornerRadius = 15;
            } didClickBtnHandle:^(CKJCell * _Nonnull cell, CKJCellBtnModel * _Nonnull btn7Model) {
                NSLog(@"%@ ", @"点击头像");
            }];
            m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
        } didSelectRowBlock:nil];
        
        
        CKJCellModel *model1 = [CKJCellModel ckjCellWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(CKJCellModel *m) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed(@"名字", leftDic) left:leftMarign];
            m.subTitle4Model = [CKJSubTitle4Model subTitle4ModelWithAttributedText:WDCKJAttributed2(@"姓名务必和身份证上一致", [UIColor kjwd_subTitle], @15) top:10 left:10 bottom:10 right:10];
            
            m.likePrice8Model = [CKJLikePriceLabel8Model likePriceLabel8ModelWithAttText:WDCKJAttributed(@"吴振强", rightDic) left:0 right:rightMarign];
        } didSelectRowBlock:nil];
        
        UIImage *image = [[UIImage kjwd_imageNamed:@"wdyhfsdk编辑"] kjwd_scaleToSize:CGSizeMake(25, 25)];
        
        CKJCellModel *model14 = [CKJCellModel ckjCellWithCellHeight:@47 cellModel_id:nil detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
            m.selectionStyle = UITableViewCellSelectionStyleNone;
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed2(@"通知手机号", [UIColor kjwd_subTitle], @15) left:leftMarign];
            m.likePrice61Model = [CKJLikePriceLabel61Model likePriceModelWithAttText:WDAtt15_5([@"18377216632" kjwd_PhoneLeftMargin:3 rightMargin:2 starNumber:6]) left:0 right:10];
            
            m.btn7Model = [CKJCellBtnModel btnModelWithSize:image.size normalImage:image rightMargin:rightMarign detailSettingBlock:nil didClickBtnHandle:^(CKJCell * _Nonnull cell, CKJCellBtnModel * _Nonnull btn5Model) {
                NSLog(@"进行编辑%@", cell.cellModel.title3Text);
            }];
        } didSelectRowBlock:nil];
        
        CKJCellModel *model15 = [CKJCellModel ckjCellWithCellHeight:@47 cellModel_id:nil detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
            m.selectionStyle = UITableViewCellSelectionStyleNone;
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed2(@"通知座机", [UIColor kjwd_subTitle], @15) left:leftMarign];
            m.btn7Model = [CKJCellBtnModel btnModelWithSize:image.size normalImage:image rightMargin:10 detailSettingBlock:nil didClickBtnHandle:^(CKJCell * _Nonnull cell, CKJCellBtnModel * _Nonnull btn5Model) {
                NSLog(@"进行编辑%@", cell.cellModel.title3Text);
            }];
            m.likePrice8Model = [CKJLikePriceLabel8Model likePriceLabel8ModelWithAttText:WDCKJAttributed2(@"021-832781", [UIColor kjwd_subTitle], @15) left:6 right:rightMarign];
        } didSelectRowBlock:nil];
        
        CKJCellModel *model10 = [CKJCellModel ckjCellWithCellHeight:@(UITableViewAutomaticDimension) cellModel_id:nil detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
            m.view5Model = [CKJView5Model view5ModelWithTopAttributedText:WDCKJAttributed2(@"开启常用地点入口", [UIColor kjwd_title], @15) bottomAttributedText:WDCKJAttributed2(@"关闭后，将隐藏首页的常用地点入口", [UIColor kjwd_subTitle], @13) centerMarign:5 topBottomMargin:8 leftMargin:leftMarign rightMargin:0];
            m.switch6Model = [CKJSwitch6Model switch6ModelWithSwitchOn:YES left:0 top:0 bottom:0 callBack:^(BOOL switchOn, CKJCellModel *cellModel, UISwitch *senderSwitch) {
                NSLog(@"%@ %@", cellModel.view5Model.topText.string, switchOn ? @"开启" : @"关闭");
            }];
            m.likePrice61Model = [CKJLikePriceLabel61Model likePriceModelWithLeftMargin:15];
        } didSelectRowBlock:nil];
        
        CKJCellModel *model11 = [CKJCellModel ckjCellWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
            m.image2Model = [CKJImage2Model image2ModelWithImageString:@"yhf通知" size:CGSizeMake(30, 30) left:leftMarign];
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed(@"推送通知", leftDic) left:5];
            m.switch6Model = [CKJSwitch6Model switch6ModelWithSwitchOn:YES left:0 top:0 bottom:0 callBack:^(BOOL switchOn, CKJCellModel *cellModel, UISwitch *senderSwitch) {
                NSLog(@"%@ %@", cellModel.title3Model.attributedText.string, switchOn ? @"开启" : @"关闭");
            }];
            m.likePrice61Model = [CKJLikePriceLabel61Model likePriceModelWithLeftMargin:15];
        } didSelectRowBlock:nil];
        
        CKJCellModel *model12 = [CKJCellModel ckjCellWithCellHeight:@44 cellModel_id:kkkk_HospitalCellID detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
            m.image2Model = [CKJImage2Model image2ModelWithImageString:@"wdyhfsdkhospital" size:CGSizeMake(30, 30) left:leftMarign];
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed(@"请选择医院", leftDic) left:5];
            m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
        } didSelectRowBlock:^(__kindof CKJCellModel * _Nonnull m) {
            [weakSelf succShow];
        }];
        
        
        CKJCellModel *model20 = [CKJCellModel ckjCellWithCellHeight:@65 cellModel_id:nil detailSettingBlock:^(CKJCellModel *m) {
            m.showLine = NO;
            m.image2Model = [CKJImage2Model image2ModelWithImageString:@"wdyhfsdkmark" size:CGSizeMake(30, 30) left:leftMarign];
            m.subTitle4Model = [CKJSubTitle4Model subTitle4ModelWithAttributedText:WDCKJAttributed2(@"结算失败。现金支付部分将在30分钟内，原路退回，请留意查看！", [UIColor kjwd_r:24 g:167 b:99 alpha:1], @16) top:10 left:10 bottom:10 right:10];
        } didSelectRowBlock:nil];
        
        CKJCellModel *model3 = [CKJCellModel ckjCellWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed(@"操作1", leftDic) left:25];
            m.btn7Model = [CKJCellBtnModel btnModelWithSize:CGSizeMake(100, 30) normalImage:nil rightMargin:25 detailSettingBlock:^(CKJCellBtnModel *sender) {
                sender.cornerRadius = 15;
                sender.normalBackgroundImage = [UIImage kjwd_imageWithColor:[UIColor redColor] size:CGSizeMake(100, 30)];
                sender.normalAttributedTitle = WDCKJAttributed2(@"删除此行", [UIColor whiteColor], nil);
            } didClickBtnHandle:^(CKJCell *cell, CKJCellBtnModel *btn7Model) {
                [cell.simpleTableView removeCellModelAtSection:cell.section rows:@[@(cell.row)] removeHiddenCellModel:NO withRowAnimation:UITableViewRowAnimationRight animationBlock:^(void (^ _Nonnull animationBlock)(void)) {
                    animationBlock();
                }];
            }];
        } didSelectRowBlock:nil];
        
        
        CKJCellModel *model4 = [CKJCellModel ckjCellWithCellHeight:@44 cellModel_id:nil detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
            m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed(@"操作2", leftDic) left:25];
            m.btn7Model = [CKJCellBtnModel btnModelWithSize:CGSizeMake(100, 30) normalImage:nil rightMargin:25 detailSettingBlock:^(CKJCellBtnModel *sender) {
                sender.cornerRadius = 15;
                sender.normalBackgroundImage = [UIImage kjwd_imageWithColor:[UIColor brownColor] size:CGSizeMake(100, 30)];
                sender.normalAttributedTitle = WDCKJAttributed2(@"增加2行", [UIColor whiteColor], nil);
            } didClickBtnHandle:^(CKJCell *cell, CKJCellBtnModel *btn7Model) {
                CKJCellModel *temp1 = [CKJCellModel ckjCellWithCellHeight:@44 cellModel_id:kkkk_HospitalCellID detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
                    m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed([NSString kjwd_returnArc4randomWithNum:5 type:KJWDArc4randomType_Number_Up_Char], leftDic) left:5];
                    m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
                } didSelectRowBlock:nil];
                CKJCellModel *temp2 = [CKJCellModel ckjCellWithCellHeight:@44 cellModel_id:kkkk_HospitalCellID detailSettingBlock:^(__kindof CKJCellModel * _Nonnull m) {
                    m.title3Model = [CKJTitle3Model title3ModelWithAttributedText:WDCKJAttributed([NSString kjwd_returnArc4randomWithNum:5 type:KJWDArc4randomType_Number_Up_Char], leftDic) left:5];
                    m.arrow9Model = [CKJArrow9Model arrow9SystemModel];
                } didSelectRowBlock:nil];
                
                [cell.simpleTableView appendCellModelArray:@[temp1, temp2] atLastRow_InAllCellModelArrayOfSection:cell.section withRowAnimation:UITableViewRowAnimationRight animationBlock:^(void (^ _Nonnull animationBlock)(void)) {
                    animationBlock();
                }];
                
            }];
        } didSelectRowBlock:nil];
        
        _sec.modelArray = @[model0, model1, model14, model15, model10, model11, model12, model20, model3, model4];
        
    }];
    self.simpleTableView.dataArr = @[section1, section2];
    [self.simpleTableView kjwd_reloadData];
}


- (void)kj_tableView:(CKJSimpleTableView *)tableView didSelectRowAtSection:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath *)indexPath model:(__kindof CKJCommonCellModel *)model cell:(__kindof CKJCommonTableViewCell *)cell {
    NSLog(@"你点击了 %ld分区   %ld行， 一般情况下你可以在 CKJCommonCellModel.didSelectRowBlock这个block里面设置就可以得到回调", (long)section, (long)row);
}


- (void)succShow {
    
    __weak typeof(self) weakSelf = self;
    
    CKJConfirmBlock confirmBlock = ^(NSArray <CKJPickerRowModel *>*data, CKJToolPickerView *currentView) {
        [currentView masonryWithAnimateFromScreenButtom_hiddenBackGroundView];
        
        data = WDKJ_ConfirmArray(data);
        
        weakSelf.selectAreaItem = (WDYHFAreaItem *)[data kjwd_objectAtIndex:0];
        weakSelf.selectHospitalItem = (WDYHFHospitalItem *)[data kjwd_objectAtIndex:1];
        
        CKJCellModel *model = [weakSelf.simpleTableView cellModelOfID:kkkk_HospitalCellID];
        [model.title3Model changeText:weakSelf.selectHospitalItem.org_name];
        [weakSelf.simpleTableView kjwd_reloadData];
    };
    
    
    WDYHFSelectHospitalPickerView *pick = [[WDYHFSelectHospitalPickerView alloc] init];
    
    CKJToolPickerView *selectHospitalV = [[CKJToolPickerView alloc] initWithFrame:CGRectZero pickerView:pick];
    
    selectHospitalV.title = @"选择医院";
    
    selectHospitalV.targetView.dataArr = [self createToolPickerViewDataArray];
    selectHospitalV.cancelBlock = ^(CKJToolPickerView *currentView) {
        [currentView masonryWithAnimateFromScreenButtom_hiddenBackGroundView];
    };
    selectHospitalV.confirmBlock = confirmBlock;
    
    [selectHospitalV masonryWithAnimateFromScreenButtomWithDuration:0.2 superView:nil selfMasonryHeight:300 coverViewColor:nil animationCompletion:nil triggerTapGestureRecognizerBlock:^(void (^ _Nonnull disappearBlock)(void)) {
        disappearBlock();
    }];
}


- (NSArray *)createToolPickerViewDataArray {
    
    NSDictionary *myDic = @{
        @"return_code": @"SUCCESS",
        @"return_msg": @"响应成功",
        @"result_code": @"SUCCESS",
        @"details": @[
                @{
                    @"details": @[
                            @{
                                @"org_code": @"47117170333050211A1001",
                                @"org_name": @"湖州市中心医院"
                            },
                            @{
                                @"org_code": @"47117166633050211A1001",
                                @"org_name": @"湖州市第一人民医院"
                            },
                            @{
                                @"org_code": @"47117169033050211A5201",
                                @"org_name": @"湖州市第三人民医院"
                            },
                            @{
                                @"org_code": @"47117172X33050211G1001",
                                @"org_name": @"湖州市妇幼保健院"
                            },
                            @{
                                @"org_code": @"47117171133050211A2101",
                                @"org_name": @"湖州市中医院"
                            }
                    ],
                    @"area": @"330500",
                    @"area_name": @"湖州市"
                },
                @{
                    @"details": @[
                            @{
                                @"org_code": @"47117183433050311A1001",
                                @"org_name": @"湖州市南浔区人民医院"
                            }
                    ],
                    @"area": @"330503",
                    @"area_name": @"南浔区"
                }
        ]
    };
    
    
    NSArray *(^block)(id data) = ^ NSArray * (id data) {
        
        NSMutableArray <CKJPickerRowModel *>*result = [NSMutableArray array];
        
        NSArray <NSDictionary *>*details = WDKJ_ConfirmArray(data[@"details"]);
        
        [details enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSDictionary *tempDic = WDKJ_ConfirmDic(obj);
            
            WDYHFAreaItem *areaItem = [WDYHFAreaItem modelWithDic:tempDic];
            
            areaItem.hospitals = [NSMutableArray kjwd_arrayWithKeyValuesArray:tempDic[@"details"] modelClass:[WDYHFHospitalItem class] callBack:nil];
            
            [result addObject:areaItem];
        }];
        
        return result;
    };
    
    
    
    NSArray <WDYHFAreaItem *>*areas =  block(myDic);
    
    
    NSInteger areaSelectIndex = 0;
    
    
    NSMutableArray <CKJPickerComponentModel *>*sections = [NSMutableArray array];
    {
        CKJPickerComponentModel *section = [CKJPickerComponentModel new];
        section.widthOf_MultipliedByPickerView = 0.25;
        section.modelArray = areas;
        
        section.selectIndex = ({
            NSInteger index = 0;
            index = [areas kjwd_do_filter_returnConformIndex:^BOOL(WDYHFAreaItem *objc) {
                return [objc.area isEqualToString:WDKJ_ConfirmString(self.defaultAreaItem.area)];
            }].integerValue;
            index;
        });
        areaSelectIndex = section.selectIndex;
        
        [sections addObject:section];
    }
    {
        CKJPickerComponentModel *section = [CKJPickerComponentModel new];
        section.widthOf_MultipliedByPickerView = 0.65;
        
        
        WDYHFAreaItem *currentArea = [areas kjwd_objectAtIndex:areaSelectIndex];
        
        section.modelArray = currentArea.hospitals;
        
        section.selectIndex = ({
            NSInteger index = 0;
            index = [currentArea.hospitals kjwd_do_filter_returnConformIndex:^BOOL(WDYHFHospitalItem *objc) {
                return [objc.org_code isEqualToString:WDKJ_ConfirmString(self.defaultHospitalItem.org_code)];
            }].integerValue;
            index;
        });
        
        [sections addObject:section];
    }
    return sections;
}




@end
