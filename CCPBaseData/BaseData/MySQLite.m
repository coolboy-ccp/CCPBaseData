//
//  MySQLite.m
//  MyOwnStudy
//
//  Created by liqunfei on 16/2/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "MySQLite.h"
#import <sqlite3.h>
#define DANAME     @"personInfo.sqlite"
#define NAME       @"name"
#define AGE        @"age"
#define ADDRESS    @"address"
#define TABLENAME  @"PERSONINFO"
@implementation MySQLite
{
    sqlite3 *qb;
}

- (void)createDB {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dataBase_path = [[paths objectAtIndex:0] stringByAppendingPathComponent:DANAME];
    if (sqlite3_open([dataBase_path UTF8String], &qb) != SQLITE_OK) {
        sqlite3_close(qb);
        NSLog(@"db open failed!");
    }
    else {
        NSLog(@"db open successed!");
        NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER,address TEXT)";
        [self execSqlWithString:sqlCreateTable];
        [self addData];
        [self searchValues];
    }
}


- (void)execSqlWithString:(NSString *)str{
    char *err;
    if (sqlite3_exec(qb, [str UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(qb);
        NSLog(@"falied to create table");
    }
    else {
        NSLog(@"successed to create table");
    }
}

- (void)addData {
    NSString *sql1 = [NSString stringWithFormat:@"INSERT INTO '%@' ('%@','%@','%@') VALUES ('%@','%@','%@')",TABLENAME,NAME,AGE,ADDRESS,@"张三",@"15",@"辽宁抚顺市望花区丹东路西段一号"];
    NSString *sql2 = [NSString stringWithFormat:@"INSERT INTO '%@' ('%@','%@','%@') VALUES ('%@','%@','%@')",TABLENAME,NAME,AGE,ADDRESS,@"流川枫",@"1212212",@"中国安徽安庆岳西"];
    [self execSqlWithString:sql1];
    [self execSqlWithString:sql2];
}

- (void)searchValues {
    NSString *sqlQuery = @"SELECT * FROM PERSONINFO";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(qb, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *name = (char *)sqlite3_column_text(statement, 1);
            NSString *nsNameStr = [[NSString alloc] initWithUTF8String:name];
            int age = sqlite3_column_int(statement, 2);
            char *address = (char *)sqlite3_column_text(statement, 3);
            NSString *nsAddress = [[NSString alloc] initWithUTF8String:address];
            NSLog(@"name:%@ age:%d address:%@",nsNameStr,age,nsAddress);
        }
    }
    sqlite3_close(qb);
}
@end
