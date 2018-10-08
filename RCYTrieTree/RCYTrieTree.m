//
//  RCYTrieTree.m
//  RCYTrieTree
//
//  Created by hcwh on 2018/10/8.
//  Copyright © 2018年 huchengwenhao. All rights reserved.
//

#import "RCYTrieTree.h"
#import "RCYTrieTreeNode.h"

@implementation RCYTrieTree

- (id)init {
    if (self = [super init]) {
        self.rootNode = [[RCYTrieTreeNode alloc] init];
        NSArray *words = @[@"a", @"ai", @"an", @"ang", @"ao", @"ba", @"bai", @"ban", @"bang", @"bao", @"bei", @"ben", @"beng", @"bi", @"bian", @"biao", @"bie", @"bin", @"bing", @"bo", @"bu", @"ca", @"cai", @"can", @"cang", @"cao", @"ce", @"cen", @"ceng", @"cha", @"chai", @"chan", @"chang", @"chao", @"che", @"chen", @"cheng", @"chong", @"chou", @"chi", @"chu", @"chua", @"chuai", @"chuan", @"chuang", @"chui", @"chun", @"chuo", @"ci", @"cong", @"cou", @"cu", @"cuan", @"cui", @"cun", @"cuo", @"da", @"dai", @"dan", @"dang", @"dao", @"de", @"dei", @"den", @"deng", @"di", @"dian", @"diao", @"die", @"ding", @"diu", @"dong", @"dou", @"du", @"duan", @"dui", @"dun", @"duo", @"e", @"ei", @"en", @"eng", @"er", @"fa", @"fan", @"fang", @"fei", @"fen", @"feng", @"fo", @"fou", @"fu", @"ga", @"gai", @"gan", @"gang", @"gao", @"ge", @"gei", @"gen", @"geng", @"gong", @"gou", @"gu", @"gua", @"guai", @"guan", @"guang", @"gui", @"gun", @"guo", @"ha", @"hai", @"han", @"hang", @"hao", @"he", @"hei", @"hen", @"heng", @"hong", @"hou", @"hu", @"hua", @"huai", @"huan", @"huang", @"hui", @"hun", @"huo", @"ji", @"jia", @"jian", @"jiang", @"jiao", @"jie", @"jin", @"jing", @"jiong", @"jiu", @"ju", @"juan", @"jue", @"jun", @"ka", @"kai", @"kan", @"kang", @"kao", @"ke", @"ken", @"keng", @"kong", @"kou", @"ku", @"kua", @"kuai", @"kuan", @"kuang", @"kui", @"kun", @"kuo", @"la", @"lai", @"lan", @"lang", @"lao", @"le", @"lei", @"leng", @"li", @"lia", @"lian", @"liang", @"liao", @"lie", @"lin", @"ling", @"liu", @"long", @"lou", @"lu", @"lv", @"luan", @"lve", @"lun", @"luo", @"ma", @"mai", @"man", @"mang", @"mao", @"me", @"mei", @"men", @"meng", @"mi", @"mian", @"miao", @"mie", @"min", @"ming", @"miu", @"mo", @"mou", @"mu", @"na", @"nai", @"nan", @"nang", @"nao", @"ne", @"nei", @"nen", @"neng", @"ni", @"nian", @"niang", @"niao", @"nie", @"nin", @"ning", @"niu", @"nong", @"nou", @"nu", @"nv", @"nuan", @"nve", @"nuaio", @"o", @"ou", @"pa", @"pai", @"pan", @"pang", @"pao", @"pei", @"pen", @"peng", @"pi", @"pian", @"piao", @"pie", @"pin", @"ping", @"po", @"pou", @"pu", @"qi", @"qia", @"qian", @"qiang", @"qiao", @"qie", @"qin", @"qing", @"qiong", @"qiu", @"qu", @"quan", @"que", @"qun", @"ran", @"rang", @"rao", @"re", @"ren", @"reng", @"ri", @"rong", @"rou", @"ru", @"ruan", @"rui", @"run", @"ruo", @"sa", @"sai", @"san", @"sang", @"sao", @"se", @"sen", @"seng", @"sha", @"shai", @"shan", @"shang", @"shao", @"she", @"shei", @"shen", @"sheng", @"shou", @"shi", @"shu", @"shua", @"shuai", @"shuan", @"shuang", @"shui", @"shun", @"shuo", @"si", @"song", @"sou", @"su", @"suan", @"sui", @"sun", @"suo", @"ta", @"tai", @"tan", @"tang", @"tao", @"te", @"teng", @"ti", @"tian", @"tiao", @"tie", @"ting", @"tong", @"tou", @"tu", @"tuan", @"tui", @"tun", @"tuo", @"wa", @"wai", @"wan", @"wang", @"wei", @"wen", @"weng", @"wo", @"wu", @"xi", @"xia", @"xian", @"xiang", @"xiao", @"xie", @"xin", @"xing", @"xiong", @"xiu", @"xu", @"xuan", @"xue", @"xun", @"ya", @"yan", @"yang", @"yao", @"ye", @"yi", @"yin", @"ying", @"yong", @"you", @"yu", @"yuan", @"yue", @"yun", @"za", @"zai", @"zan", @"zang", @"zao", @"ze", @"zei", @"zen", @"zeng", @"zha", @"zhai", @"zhan", @"zhang", @"zhao", @"zhe", @"zhei", @"zhen", @"zheng", @"zhong", @"zhou", @"zhi", @"zhu", @"zhua", @"zhuai", @"zhuan", @"zhuang", @"zhui", @"zhun", @"zhuo", @"zi", @"zong", @"zou", @"zu", @"zuan", @"zui", @"zun", @"zuo"];
        
        for (NSString *word in words) {
            [self insertNodeWithWord:word];
        }
    }
    return self;
}

- (void)insertNodeWithWord:(NSString *)word {
    
    NSMutableArray *words = [[NSMutableArray alloc] init];
    for (int i = 0; i < word.length; i++) {
        [words addObject:[word substringWithRange:NSMakeRange(i, 1)]];
    }
    __block RCYTrieTreeNode *node = self.rootNode;
    [words enumerateObjectsUsingBlock:^(NSString *ch, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!node.children) {
            node.children = [[NSMutableDictionary alloc] init];
        }
        
        if ([node.children.allKeys containsObject:ch]) {   //key中是否有该字符
            if (idx == words.count - 1) {   //如果是最后一个
                RCYTrieTreeNode *endNode = [node.children valueForKey:ch];
                endNode.canBeEnd = YES;
            }
        }
        
        else {
            RCYTrieTreeNode *newNode = [[RCYTrieTreeNode alloc] init];
            if (idx == words.count - 1) {
                newNode.canBeEnd = YES;
            }
            
            [node.children setValue:newNode forKey:ch];
        }
        
        node = [node.children valueForKey:ch];
    }];
}

- (RCYTrieTreeNode *)searchTreeWithWord:(NSString *)word {
    NSMutableArray *words = [[NSMutableArray alloc] init];
    for (int i = 0; i < word.length; i++) {
        [words addObject:[word substringWithRange:NSMakeRange(i, 1)]];
    }
    
    __block RCYTrieTreeNode *node = self.rootNode;
    [words enumerateObjectsUsingBlock:^(NSString *ch, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([node.children.allKeys containsObject:ch]) {
            node = [node.children valueForKey:ch];
        }
        
        else {
            node = nil;
            *stop = YES;
            return;
        }
    }];
    return node;
}

@end

