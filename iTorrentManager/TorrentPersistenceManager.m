//
//  TorrentPersistenceManager.m
//  iTorrentManager
//
//  Created by USERCCI on 01/03/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import "TorrentPersistenceManager.h"
#import "SBJson.h"
#import "TorrentParser.h"
@implementation TorrentPersistenceManager
+(void) writeJSONFile : (NSMutableString*) stringToWrite{
    NSString *error;
    stringToWrite = [stringToWrite stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"torrents" ofType:@"json"];
    NSLog(stringToWrite);
    [stringToWrite writeToFile:path atomically:NO  encoding:NSUTF8StringEncoding error:&error];
  
        NSLog(@"%@",error);
    
    
}
+(NSMutableArray*) getTorrentsFromJSON{
    
    NSString *error;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"torrents" ofType:@"json"];
    NSMutableString *responseString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"%@",error);

    
    responseString = [responseString stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
   
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSMutableDictionary *jsonObjects = [parser objectWithString:responseString error:&error];
    NSMutableDictionary *torrents = [jsonObjects objectForKey:@"torrents"];
    TorrentParser *torrentParser = [[TorrentParser alloc] init:torrents];
    NSMutableArray *torrentsToReturn = [torrentParser getTorrents];
    return torrentsToReturn;
}
@end
