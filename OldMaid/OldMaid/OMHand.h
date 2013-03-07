//
//  OMHand.h
//  OldMaid
//
//  Created by Nicolas on 06/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OMDeck.h"

@interface OMHand : OMDeck

@property(strong, nonatomic) NSMutableArray *cards;
@property(strong, nonatomic) NSString *name;

-(id)initWithName:(NSString*)name;

-(id)initWithName:(NSString*)name andCards:(NSInteger)nbCards;

-(BOOL)addCard:(OMCard*)card;

@end
