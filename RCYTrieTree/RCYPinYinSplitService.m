//
//  RCYPinYinSplitService.m
//  RCYTrieTree
//
//  Created by hcwh on 2018/10/8.
//  Copyright © 2018年 huchengwenhao. All rights reserved.
//

#import "RCYPinYinSplitService.h"
#import "RCYTrieTree.h"
#import "RCYTrieTreeNode.h"

@interface RCYPinYinSplitService ()

@end

@implementation RCYPinYinSplitService

+ (void)splitPinYinWithString:(NSString *)string successBlock:(void (^)(NSArray *))successBlock {
    RCYTrieTree *tree = [[RCYTrieTree alloc] init];
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    [self PinYinAddSpaceWithTree:tree string:string index:0 resultArray:resultArray];
    if (resultArray && successBlock) {
        successBlock(resultArray);
    }
}

+ (void)splitPinYinFrontAddSpaceWithString:(NSString *)string successBlock:(void (^)(NSArray *))successBlock {
    RCYTrieTree *tree = [[RCYTrieTree alloc] init];
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    NSString *temp = [NSString stringWithFormat:@" %@", string];
    [self PinYinAddSpaceWithTree:tree string:temp index:1 resultArray:resultArray];
    if (resultArray && successBlock) {
        successBlock(resultArray);
    }
}

//例如:xianguo -> xian guo, xian gu o, xi an guo, xi an gu o
+ (void)PinYinAddSpaceWithTree:(RCYTrieTree *)tree string:(NSString *)string index:(NSInteger)index resultArray:(NSMutableArray *)resultArray {
    NSInteger currentLength = 1;
    BOOL isFind = YES;
    NSMutableString *resultString = [NSMutableString stringWithString:string];
    while (currentLength + index <= string.length) {
        NSString *subString = [string substringWithRange:NSMakeRange(index, currentLength)];
        RCYTrieTreeNode *node = [tree searchTreeWithWord:subString];
        if (!node) {
            isFind = NO;
            break;
        }
        
        if (node.canBeEnd) {
            //递归
            //一旦找到后分为两个方法，一个为加入空格继续查找，一个为不加空格继续查找 如:字符串xian 查到xi 的时候 一个方法的字符串为 xi an 另一个为 xian
            if (index + currentLength != resultString.length) {
                NSMutableString *mutableString = [NSMutableString stringWithString:string];
                [mutableString insertString:@" " atIndex:currentLength + index];
                [self PinYinAddSpaceWithTree:tree string:mutableString index:currentLength + index + 1 resultArray:resultArray];
            }
        }
        currentLength++;
    }
    if (isFind) {
        [resultArray addObject:resultString];
    }
}

@end
