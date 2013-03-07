//
//  OMCard.h
//  OldMaid
//
//  Created by Nicolas on 06/03/13.
//  Copyright (c) 2013 NGWare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMCard : NSObject

@property(nonatomic) NSInteger suit;
@property(nonatomic) NSInteger rank;

@property(nonatomic, strong) NSArray *suitList;
@property(nonatomic, strong) NSArray *rankList;

-(id)initWithSuit:(NSInteger)suit;

-(id)initWithRank:(NSInteger)rank;

-(id)initWithSuit:(NSInteger)suit andRank:(NSInteger)rank;

// return 1 if the self object is greater, -1 if the othercard is greater, and 0 if they are equal to each other
-(NSInteger)compare:(OMCard*)otherCard;

@end
