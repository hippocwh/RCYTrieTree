//
//  RCYTrieTree.h
//  RCYTrieTree
//
//  Created by hcwh on 2018/10/8.
//  Copyright © 2018年 huchengwenhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCYTrieTreeNode;

@interface RCYTrieTree : NSObject

@property (nonatomic, strong) RCYTrieTreeNode *rootNode;

- (RCYTrieTreeNode *)searchTreeWithWord:(NSString *)word;

@end
