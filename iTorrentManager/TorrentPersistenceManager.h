//
//  TorrentPersistenceManager.h
//  iTorrentManager
//
//  Created by USERCCI on 01/03/13.
//  Copyright (c) 2013 yroul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TorrentPersistenceManager : NSObject

+(void) writeJSONFile : (NSMutableString*) stringToWrite;
+(NSMutableArray*) getTorrentsFromJSON;

@end
