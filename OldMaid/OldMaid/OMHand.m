//
//  OMHand.m
//  OldMaid
//
//  Created by Nicolas on 06/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import "OMHand.h"
#import "OMCard.h"

#define NB_CARDS_DEFAULT_VALUE 999

@interface OMHand () {
    
    NSInteger _nbCards;
}

@end

@implementation OMHand

-(id)init {
    
    if (self = [super init]) {
        self.cards = [[NSMutableArray alloc] init];
        _name = @"name";
        _nbCards = NB_CARDS_DEFAULT_VALUE;
    }
    
    return self;
}
-(id)initWithName:(NSString*)name {
    if (self = [super init]) {
        self.cards = [[NSMutableArray alloc] init];
        _name = name;
        _nbCards = NB_CARDS_DEFAULT_VALUE;
    }
    return self;
}

-(id)initWithName:(NSString*)name andCards:(NSInteger)nbCards {
    
    if (self = [super init]) {
        self.cards = [[NSMutableArray alloc] init];
        _name = name;
        if (nbCards > 0)
            _nbCards = nbCards;
        else
            _nbCards = NB_CARDS_DEFAULT_VALUE;
    }
    return self;
}

-(BOOL)addCard:(OMCard *)card {
    BOOL hr = NO;
    if (nil != card) {
        [self.cards addObject:card];
        hr = YES;
    }
    return hr;
}

-(NSString*)description {
    NSMutableString *desc = [[NSMutableString alloc] initWithFormat:@"Hand %@ ", _name];
    if ([self isEmpty]) {
        [desc appendString:@"is empty"];
    }else
        [desc appendString:[NSString stringWithFormat:@"contains:%@", [super description]]];
    return desc;
}


@end
