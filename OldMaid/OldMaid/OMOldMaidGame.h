//
//  OMOldMaidGame.h
//  OldMaid
//
//  Created by Nicolas on 12/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import "OMCardGame.h"

@class OMOldMaidHand;

@interface OMOldMaidGame : OMCardGame

@property(nonatomic, strong)NSMutableArray *hands;

-(void)playWithPlayers:(NSArray *)names;

-(NSInteger)removeAllMatches;

-(void)printHands;

-(NSInteger)playOneTurn:(NSInteger)idPlayer;

-(NSInteger)findNeighbor:(NSInteger)idPlayer;

@end
