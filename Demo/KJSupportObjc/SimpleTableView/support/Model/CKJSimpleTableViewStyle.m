//
//  CKJSimpleTableViewStyle.m
//  MobileHospital_Renji
//
//  Created by xnqbd on 2019/12/6.
//  Copyright © 2019 Lyc. All rights reserved.
//

#import "CKJSimpleTableViewStyle.h"
#import "CKJInputCell.h"

//@implementation CKJShareStyle
//
//- (instancetype)init {
//    if (self = [super init]) {
//        self.title_MarginTo_SuperViewLeft = 15;
//        self.rightLabel_MarginTo_SuperViewRight = self.title_MarginTo_SuperViewLeft;
//    }
//    return self;
//}
//
//@end


@implementation CKJSectionCornerStyle

- (instancetype)init {
    if (self = [super init]) {
        self.sectionCornerEnable = YES;
        self.corner_Radius = 10;
        self.stroke_Color = [UIColor whiteColor];
    }
    return self;
}

@end


@implementation CKJInputHaveTitleStyle

+ (instancetype)styleWithLeft:(NSNumber *_Nullable)left titleWidth:(NSNumber *_Nullable)titleWidth detail:(void(^_Nullable)(CKJInputHaveTitleStyle *cs))detail {
    CKJInputHaveTitleStyle *style = [[CKJInputHaveTitleStyle alloc] init];
    if (!WDKJ_IsNull_Num(left)) {
        style.left = left.floatValue;
    }
    if (!WDKJ_IsNull_Num(titleWidth)) {
        style.titleWidth = titleWidth;
    }
    if (detail) {
        detail(style);
    }
    return style;
}

- (instancetype)init {
    if (self = [super init]) {
        self.left = 15;
        self.right = 15;
        self.titleAttributes = @{NSForegroundColorAttributeName : [UIColor kjwd_title], NSFontAttributeName : [UIFont systemFontOfSize:kOConst_Input_Tf_FontSize]};
    }
    return self;
}

@end

@implementation CKJSimpleTableViewStyle

- (instancetype)init {
    if (self = [super init]) {
        self.haveTitleStyle = [[CKJInputHaveTitleStyle alloc] init];
        self.sectionFooterHeight = @10;
        self.sectionHeaderHeight = @0;
        self.lineEdge = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        self.tfTextAttributed = @{NSForegroundColorAttributeName : [UIColor kjwd_title], NSFontAttributeName : [UIFont systemFontOfSize:kOConst_Input_Tf_FontSize]};
        self.tfPlaceHolderAttributed = @{NSForegroundColorAttributeName : [UIColor kjwd_r:190 g:190 b:190 alpha:1], NSFontAttributeName : [UIFont systemFontOfSize:kOConst_Input_Tf_FontSize]};
        self.tfAlignment = NSTextAlignmentLeft;
        self.tfStyle_Right = 15;
    }
    return self;
}

- (void)setOnlyViewEdge:(NSValue *)onlyViewEdge {
    if (_onlyViewEdge == onlyViewEdge) return;
    if (!WDKJ_IsNullObj(onlyViewEdge, [NSValue class])) {
        _onlyViewEdge = onlyViewEdge;
        self.needUpdateOnlyViewConstraints = YES;
    }
}


@end
