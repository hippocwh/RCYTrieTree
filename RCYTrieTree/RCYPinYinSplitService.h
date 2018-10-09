//
//  RCYPinYinSplitService.h
//  RCYTrieTree
//
//  Created by hcwh on 2018/10/8.
//  Copyright © 2018年 huchengwenhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCYPinYinSplitService : NSObject

//头部不加空格
+ (void)splitPinYinWithString:(NSString *)string successBlock:(void (^)(NSArray *successArray))successBlock;

//头部加空格(可以防止搜索heng会出现cheng,zheng,sheng的情况，同样的数据库存入的拼音也需要在头部添加空格)
+ (void)splitPinYinFrontAddSpaceWithString:(NSString *)string successBlock:(void (^)(NSArray *successArray))successBlock;

@end
