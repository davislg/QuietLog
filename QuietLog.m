//
//  QuietLog.m
//  NSLog alternative method
//
//  Created by Davis on 2/5/13.
//  Copyright (c) 2013 Liquid Thoughts. All rights reserved.
//

#import "QuietLog.h"

void QuietLog (NSString *format, ...) {
    if (format == nil) {
        printf("");
        return;
    }
    
    // Get a reference to the arguments that follow the format parameter
    va_list argList;
    va_start(argList, format);
    
    // Perform format string argument substitution, reinstate %% escapes, then print
    NSString *s = [[NSString alloc] initWithFormat:format arguments:argList];
    
    printf("%s\n", [[s stringByReplacingOccurrencesOfString:@"%%" withString:@"%%%%"] UTF8String]);
    
    [s release];
    
    va_end(argList);
    
}
