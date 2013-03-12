//
//  OMCardGame.m
//  OldMaid
//
//  Created by Nicolas on 12/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import "OMCardGame.h"
#import "OMDeck.h"

@implementation OMCardGame

-(id)init {
    
    if (self = [super init]) {
        
        _deck = [[OMDeck alloc] init];
        [_deck shuffle];
    }
    return  self;
}

@end
