//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Dennis Nguyen on 5/20/15.
//  Copyright (c) 2015 dnwin. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
@interface BNRItemStore()

@property (nonatomic) NSMutableArray *privateItems;

@end



@implementation BNRItemStore




// SINGLETON - lazy instantiation
+ (instancetype)sharedStore
{
    // check to see if a instance exists, then returnl
    static BNRItemStore *sharedStore = nil; // not destroyed when done executing
    
    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// if init is called, throw exception
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    // initialize array
    if (self)
    {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

//
- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    // make random item add it to private items array
    [self.privateItems addObject:item];
    
    return item;
}




@end