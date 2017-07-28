# CarTextField
一款购物车加减按钮,附变态辣的分类供鈤 常使用
#### 此时此刻我想吃武汉周黑鸭一斤呐
##### 没图我说个瘠薄
![微辣鸭脖](https://ww3.sinaimg.cn/large/006tNbRwgy1fd51yp1sumj30d211saec.jpg)
#### 关于CarTextField
![变态辣鸭脖](https://ww2.sinaimg.cn/large/006tNbRwgy1fd5257vgs7j30ku12ajs4.jpg)
### 说明:
最近有需求添加购物车中的物品,不再是一个一个的添加&起售数量也不一定就是一个,而是不确定的数量毕竟此时此刻想吃周黑鸭
    
    - (TQAmountTextField *)amountTextField
    {
    if (_amountTextField == nil) {
        _amountTextField = [TQAmountTextField defaultView];
        _amountTextField.stepLength = 2;//每次加减多少
        _amountTextField.buyMinNumber = 4;//起售价格
        _amountTextField.TQTextFiled.text =[NSString stringWithFormat:@"%d",4];
        _amountTextField.center = CGPointMake(self.view.bounds.size.width/2 - 10 - self.amountTextField.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
        [self.view addSubview:_amountTextField];
    }
    return _amountTextField;
    }
### 突然间的自我,突然间才发现我要吃鸭脖 - /-行了,我会精神病院吃鸭脖了有空见
