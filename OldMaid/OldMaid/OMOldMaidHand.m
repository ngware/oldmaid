//
//  OMOldMaidHand.m
//  OldMaid
//
//  Created by Nicolas on 12/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import "OMOldMaidHand.h"
#import "OMCard.h"


@implementation OMOldMaidHand

-(NSInteger)removeMatches {
    
    NSInteger count = 0;
    
    NSArray *originalCards = [[NSArray alloc] initWithArray:[self cards]];
    
    for (OMCard *card in originalCards) {
        OMCard *match = [[OMCard alloc] initWithSuit:(3 - [card suit]) andRank:[card rank]];
        
        if ([[self cards] containsObject:match]) {
            [[self cards] removeObject:card];
            [[self cards] removeObject:match];
            NSLog(@"Hand %@: %@ matches %@", [self name], card, match);
            count +=1;
        }
    }    
    return count;
}
@end
