//
//  TeamName+CoreDataProperties.h
//  CCPBaseData
//
//  Created by liqunfei on 16/3/7.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TeamName.h"

NS_ASSUME_NONNULL_BEGIN

@interface TeamName (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *numbers;

@end

NS_ASSUME_NONNULL_END
