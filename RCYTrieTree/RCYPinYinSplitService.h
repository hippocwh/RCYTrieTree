//
//  RCYPinYinSplitService.h
//  RCYTrieTree
//
//  Created by hcwh on 2018/10/8.
//  Copyright © 2018年 huchengwenhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCYPinYinSplitService : NSObject

+ (void)splitPinYinWithString:(NSString *)string successBlock:(void (^)(NSArray *successArray))successBlock;

@end
