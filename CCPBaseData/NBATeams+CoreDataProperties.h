//
//  NBATeams+CoreDataProperties.h
//  CCPBaseData
//
//  Created by liqunfei on 16/3/7.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NBATeams.h"

NS_ASSUME_NONNULL_BEGIN

@interface NBATeams (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *number;
@property (nullable, nonatomic, retain) NSManagedObject *teamName;

@end

NS_ASSUME_NONNULL_END
