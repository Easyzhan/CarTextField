//
//  TQAmountTextField.h
//  TQMall
//
//  Created by Coco on 15/5/6.
//  Copyright (c) 2015年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TQAmountTextField;
@protocol TQAmoutTextFieldDelegate <NSObject>

- (void)amountTextField:(TQAmountTextField *)textField FinishInputWithInteger:(NSInteger)integer;

@end

@interface TQAmountTextField : UIView<UITextFieldDelegate>

@property (nonatomic ,strong) UIButton *subButton;
@property (nonatomic ,strong) UIButton *addButton;
@property (nonatomic ,strong)UITextField *TQTextFiled;
@property (nonatomic ,weak) id<TQAmoutTextFieldDelegate> amountDelegate;

+ (instancetype)defaultView;
@property (nonatomic, copy) NSString *increaseImageName;//加号按钮图片
@property (nonatomic, copy) NSString *decreaseImageName;//减号按钮图片
@property (nonatomic ,assign)NSInteger stepLength;//一次加减多少
@property (nonatomic, assign) NSInteger buyMinNumber;//起售数量
@property (nonatomic, assign) BOOL couldModifyNumber;//是否可以修改
@property (nonatomic, assign) NSUInteger number;//添加进购物车的数量

@end
