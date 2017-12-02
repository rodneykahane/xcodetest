//
//  main.m
//  stringTest
//
//  Created by rodney kahane on 11/25/17.
//  Copyright © 2017 rodney kahane. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSString *searchPath = @"/Users";
        NSFileManager *fm;
        
        NSDirectoryEnumerator *dirEnumerator = [fm enumeratorAtURL:searchPath includingPropertiesForKeys:[NSArray arrayWithObjects:NSURLNameKey, NSURLIsDirectoryKey,nil] options:NSDirectoryEnumerationSkipsSubdirectoryDescendants errorHandler:nil];
        NSMutableArray *theArray=[NSMutableArray array];
        
        for (NSURL *theURL in dirEnumerator) {
            
            // Retrieve the file name. From NSURLNameKey, cached during the enumeration.
            NSString *fileName;
            [theURL getResourceValue:&fileName forKey:NSURLNameKey error:NULL];
            
            // Retrieve whether a directory. From NSURLIsDirectoryKey, also
            // cached during the enumeration.
            
            NSNumber *isDirectory;
            [theURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:NULL];
            
            
            if([isDirectory boolValue] == NO)
            {
                [theArray addObject: fileName];
            }
        }
        NSLog(@"meow");
        
        // theArray at this point contains all the filenames
        
        /*
        BOOL isDir = NO;
        NSArray *subpaths;
        NSString *fontPath = @"/Users";
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSString *find = @"filetest";
        NSString *testPath;
        
        if ([fileManager fileExistsAtPath:fontPath isDirectory:&isDir] && isDir)
            subpaths = [fileManager subpathsAtPath:fontPath];
        
       // testPath = [fileManager currentDirectoryPath];
        //NSLog(@"path is %@", testPath);
        
        
        
        //for(fontPath in subpaths)
        //    NSLog(@"%@",fontPath);
        
       
        
         for(fontPath in subpaths){
             testPath = [NSString stringWithFormat:@"%@/%@",subpaths,find];
             NSLog(@"testpath is %@",testPath);
             
            if([testPath isEqualToString:fontPath])
                NSLog(@"success");
            else
                NSLog(@"find is %@ and path is %@",testPath, fontPath);
                
        }//end for
        */
    }//end autoreleasepool
    return 0;
}//end main
