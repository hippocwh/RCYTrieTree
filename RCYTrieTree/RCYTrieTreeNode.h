//
//  RCYTrieTreeNode.h
//  RCYTrieTree
//
//  Created by hcwh on 2018/10/8.
//  Copyright © 2018年 huchengwenhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCYTrieTreeNode : NSObject

//是否可以成为结束的节点
@property (nonatomic, assign) BOOL canBeEnd;

//子节点
@property (nonatomic, strong) NSMutableDictionary *children;

@end
