//
//  OMCard.m
//  OldMaid
//
//  Created by Nicolas on 06/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import "OMCard.h"

@interface OMCard (){
    
    
}

@end

@implementation OMCard

-(void)initLists {
    
    if (!_suitList && !_rankList) {
        _suitList = [[NSArray alloc] initWithObjects:@"Clubs", @"Diamonds", @"Hearts", @"Spades", nil];
        _rankList = [[NSArray alloc] initWithObjects:@"narf", @"Ace", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"Jack", @"Queen", @"King", nil];
    }
}

-(id)init {
    if (self = [super init]) {
        _suit = 0;
        _rank = 0;
        [self initLists];
    }
    return self;
}

-(id)initWithSuit:(NSInteger)suit{
    if (self = [super init]) {
        [self initLists];
        self.suit = suit;
        _rank = 0;
    }
    return self;
}

-(id)initWithRank:(NSInteger)rank{
    if (self = [super init]) {
        [self initLists];
        _suit = 0;
        self.rank = rank;
    }
    return self;
}

-(id)initWithSuit:(NSInteger)suit andRank:(NSInteger)rank {
    
    if (self = [super init]) {
        [self initLists];
        self.suit = suit;
        self.rank = rank;
    }
    return self;
}

-(NSString*)description {
    return [NSString stringWithFormat:@"%@ of %@", [_rankList objectAtIndex:_rank], [_suitList objectAtIndex:_suit]];
}

-(void)setRank:(NSInteger)rank{
    
    if (0 <= rank && rank <= ([_rankList count] - 1))
        _rank = rank;
    else
        _rank = 0;
}

-(void)setSuit:(NSInteger)suit {
    
    if (0 <= suit && suit <= ([_suitList count] -1))
        _suit = suit;
    else
        _suit = 0;
}

-(BOOL)isEqual:(id)object {
    
    if (object == self)
        return YES;
    if (!object || ![object isKindOfClass:[self class]])
        return NO;
    if (_suit != [object suit] || _rank != [object rank])
        return NO;
    else
        return YES;
}

-(NSUInteger)hash {
    
    NSUInteger prime = 31, result = 1;
    result = prime * result + _suit;
    result = prime * result + _rank;
    return result;
}

-(NSInteger)compare:(OMCard*)otherCard {
    
    if (otherCard == self)
        return 0;
    if (_suit > [otherCard suit])
        return 1;
    if (_suit < [otherCard suit])
        return -1;
    if (_rank > [otherCard rank])
        return 1;
    if (_rank < [otherCard rank])
        return -1;
    return 0;
}



@end
