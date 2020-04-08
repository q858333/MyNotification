//
//  MessageBusManager.m
//  CustomNotification
//
//  Created by dengbinOld on 2020/4/8.
//  Copyright © 2020 DengBin. All rights reserved.
//

#import "MessageBusManager.h"
#import "DBObserver.h"
#define CP_DISPATCH_MAIN_ASYNC(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
@interface MessageBusManager ()
@property (nonatomic, strong) NSMutableDictionary *messageDic;
@end

@implementation MessageBusManager
+(id)shareMessageManager{

    static MessageBusManager *messageBus = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        messageBus = [[MessageBusManager alloc]init];
    });
    return messageBus;
}

- (void)addObserver:(NSObject *)observer messageName:(NSString *)messageName selector:(SEL)selector priority:(NSInteger)priority excuteThreadMode:(NSInteger)excuteThreadMode{
    
    @synchronized (self) {
        if(![self.messageDic objectForKey:messageName]){
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            [self.messageDic setObject:arr forKey:messageName];
        }
            
        DBObserver *object = [[DBObserver alloc] init];
        object.observer = observer;
        object.messageName = messageName;
        object.selector = selector;
        object.priority = priority;
        object.excuteThreadMode = excuteThreadMode;
        
        NSMutableArray *observerList = [self.messageDic objectForKey:messageName];
        [observerList addObject:object];
    }
    
    
}
@end
