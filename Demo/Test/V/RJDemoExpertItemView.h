//
//  RJExpertItemView.h
//  MobileHospital_Renji
//
//  Created by chenkaijie on 2019/6/13.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKJScrollViewCell.h"

NS_ASSUME_NONNULL_BEGIN


@interface RJDemoExpertItemData : CKJBaseModel

@property (copy, nonatomic) NSString *avatarImageName;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *job;
@property (copy, nonatomic) NSString *department;

@property (copy, nonatomic) CKJBlockType1 tapBlock;

@end

/**
 专家View
 */
@interface RJDemoExpertItemView : CKJScrollViewCellItemView

@property (weak, nonatomic) IBOutlet UIView *wrapper;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *jobLab;
@property (weak, nonatomic) IBOutlet UIButton *departmentLab;


@end

NS_ASSUME_NONNULL_END
