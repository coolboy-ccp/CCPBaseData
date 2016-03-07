//
//  MyFMDB.m
//  MyOwnStudy
//
//  Created by liqunfei on 16/2/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "MyFMDB.h"
#import "FMDatabase.h"
@implementation MyFMDB
{
    FMDatabase *db;
}

//+ (MyFMDB *)shareMyFMDB {
//    static MyFMDB *mydb;
//    static dispatch_once_t once = 0;
//    dispatch_once(&once, ^{
//        mydb = [[MyFMDB alloc] init];
//    });
//    return mydb;
//}

- (void)createFMDB {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"myFMDB.sqlite"];
    db = [FMDatabase databaseWithPath:filePath];
    if ([db open]) {
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_myFMDB (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,age integer NOT NULL)"];
        if (result) {
            NSLog(@"success to create a table");
            [self insetData];
            [self queryTable];
        }
        else {
            NSLog(@"faile to create a table");
        }
    }
    else {
        NSLog(@"faile to create a FMDB");
    }
}

- (void)insetData {
    for (int i = 0; i < 10; i++) {
        NSString *name = [NSString stringWithFormat:@"jack_%d",arc4random_uniform(10)];
        [db executeUpdate:@"INSERT INTO t_myFMDB (name,age) VALUES (?,?);",name,@(arc4random_uniform(40))];
        //不确定的用？占位
    }
//    for (int i = 0; i < 10; i++) {
//        NSString *name = [NSString stringWithFormat:@"janney_%d",arc4random_uniform(10)];
//        [db executeUpdateWithFormat:@"INSERT INTO t_myFMDB (name,age) VALUES (%@,%d);",name,arc4random_uniform(40)];
//    }
}

- (void)deleteData {
    [db executeUpdate:@"DROP TABLE IF EXISTS t_myFMDB"];
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,age integer NOT NULL)"];
}

- (void)queryTable {
    FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM t_myFMDB"];
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"id:%d name:%@ age:%d",ID,name,age);
    }
}

@end
