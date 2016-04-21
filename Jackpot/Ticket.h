//
//  Ticket.h
//  Jackpot
//
//  Created by Oliver Short on 4/20/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property(assign) BOOL winner; //BOOL is a value type, so we are "assign" a value. self.winner would return our BOOL property.
@property(copy, nonatomic) NSString * payout; //anytime we work with strings we want to comment. always add nonatomic. parenthesis are descriptors the compiler should know.
@property(assign) int ticketPrice;

+(instancetype) ticketUsingQuickPick; //instance type tells the compiler what class, or subclass we're working in
+(instancetype) ticketUsingArray: (NSArray*)picks; //class is the blueprint, car itself is the instance. basically the plus is telling the tickets class to bring us a new instance of the ticket

- (void)compareWithTicket:(Ticket*)anotherTicket;

-(NSArray*)picks; //this isn't mutable bc we don't want other people to change our ticket numbers.

@end
