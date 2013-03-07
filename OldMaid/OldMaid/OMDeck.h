//
//  OMDeck.h
//  OldMaid
//
//  Created by Nicolas on 06/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OMCard;
@class OMHand;

@interface OMDeck : NSObject

@property(nonatomic, strong)NSMutableArray *cards;

-(void)shuffle;

-(BOOL)removeCard:(OMCard*)card;

-(OMCard*)popCard;

-(BOOL)isEmpty;

-(void)empty;

-(void)fill;

-(void)dealAllCards:(NSArray*)hands;

-(void)dealNCards:(NSInteger)nbCards toHands:(NSArray*)hands;

@end
