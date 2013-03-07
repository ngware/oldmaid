//
//  OMDeck.m
//  OldMaid
//
//  Created by Nicolas on 06/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import "OMDeck.h"
#import "OMCard.h"
#import "OMHand.h"

// Chooses a random integer below n without bias.
// Computes m, a power of two slightly above n, and takes random() modulo m,
// then throws away the random number if it's between n and m.
// (More naive techniques, like taking random() modulo n, introduce a bias
// towards smaller numbers in the range.)
// src: http://stackoverflow.com/users/41222/brent-royal-gordon
static NSUInteger random_below(NSUInteger n) {
    NSUInteger m = 1;
    
    // Compute smallest power of two greater than n.
    // There's probably a faster solution than this loop, but bit-twiddling
    // isn't my specialty.
    do {
        m <<= 1;
    } while(m < n);
    
    NSUInteger ret;
    
    do {
        ret = arc4random() % m;
    } while(ret >= n);
    
    return ret;
}



@implementation OMDeck

-(id)init {
    if (self = [super init]) {
        _cards = [[NSMutableArray alloc] init];
        [self fill];
        
    }
    return self;
}

-(NSString*)description {
    NSMutableString *desc = [[NSMutableString alloc] init];
    for (OMCard *card in _cards) {
        [desc appendString:[NSString stringWithFormat:@"\n%@", [card description]]];
    }
    return desc;
}

-(void)shuffle {
    if (![self isEmpty]) {
        // http://en.wikipedia.org/wiki/Knuth_shuffle
        for(NSUInteger i = [_cards count]; i > 1; i--) {
            NSUInteger j = random_below(i);
            [_cards exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
        }
    }
}

-(BOOL)removeCard:(OMCard*)card {
    BOOL returnStatus = NO;
    if ([_cards containsObject:card]) {
        [_cards removeObject:card];
        returnStatus = YES;
    }
    return returnStatus;
}

-(OMCard*)popCard {
    OMCard *lastCard = [_cards lastObject];
    if(nil != lastCard)
        [_cards removeLastObject];
    return lastCard;
}

-(BOOL)isEmpty {
    return ([_cards count] == 0);
}

-(void)empty {
    [_cards removeAllObjects];
}

-(void)fill {
    if ([self isEmpty]) {
        for (int i = 0; i < 4; i++) {
            for (int j = 1; j < 14; j++) {
                [_cards addObject:[[OMCard alloc] initWithSuit:i andRank:j]];
            }
        }
    }
}

-(void)dealAllCards:(NSArray*)hands {
    int nHands = [hands count];
    
    for (int i = 0; i < [_cards count]; i++) {
        if ([self isEmpty]) break;
        OMCard *card = [self popCard];
        OMHand *hand = [hands objectAtIndex:(i % nHands)];
        [hand addCard:card];
    }
    
}

-(void)dealNCards:(NSInteger)nbCards toHands:(NSArray*)hands {
    int nHands = [hands count];
    
    for (int i = 0; i < nbCards; i++) {
        if ([self isEmpty]) break;
        OMCard *card = [self popCard];
        OMHand *hand = [hands objectAtIndex:(i % nHands)];
        [hand addCard:card];
    }
}



@end
