//
//  HomeJoke+CoreDataClass.m
//  xiangle
//
//  Created by xianyikang on 2023/6/20.
//  Copyright © 2023 wei cui. All rights reserved.
//
//

#import "HomeJoke+CoreDataClass.h"

@implementation HomeJoke

+ (NSArray *)getHomeJokeEntitysById:(NSString *)jid{
    NSManagedObjectContext* context = [AppDelegate sharedInstance].managedObjectContext;
    NSEntityDescription *entityDes = [NSEntityDescription entityForName:@"HomeJoke" inManagedObjectContext:context];
    
    NSSortDescriptor *pid = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
    NSArray *sorts = [[NSArray alloc] initWithObjects:pid, nil];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDes];
    [fetchRequest setSortDescriptors:sorts];
//    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"reasonkey == %@", key]];
    NSArray *result = [context executeFetchRequest:fetchRequest error:nil];
    
    return result;
}

@end
