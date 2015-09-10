//
//  BaseClass.m
//  TSearch
//
//  Created by Pavlo Dumyak on 9/10/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "BaseClass.h"


@implementation BaseClass


+(BaseClass*)sharedInstance{
    static BaseClass* mySingletone = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{mySingletone = [[self alloc]init];});
    return mySingletone;
}


-(NSString*)connectToDataBase:(NSString*)type{
    NSURL *referenceToDataBase = [NSURL URLWithString:type];
    _generalInformation = [[NSString alloc]initWithContentsOfURL:referenceToDataBase encoding:NSUTF8StringEncoding error:nil];
    return _generalInformation;
}

-(NSMutableArray*)parser:(NSString*)start :(NSString*)end{
    NSMutableArray *data = [NSMutableArray arrayWithCapacity:20];
    NSString *tmp = nil;
    NSScanner *textScanner = [[NSScanner alloc]initWithString:_generalInformation];
    while([textScanner isAtEnd]==NO){
        [textScanner setCharactersToBeSkipped:nil];
        [textScanner scanUpToString:start intoString:NULL];
        if([textScanner scanString:start intoString:nil]){
            if([textScanner scanUpToString:end intoString:&tmp]){
                [data addObject:tmp];
            }
        }
    }
    return data;
}

-(void)parseForDetail{
    
   BaseClass *BCObject = [BaseClass sharedInstance];
    NSString *tmp = nil;
    NSScanner *textScanner = [[NSScanner alloc]initWithString:BCObject.onlyOneDetail];
    while([textScanner isAtEnd]==NO){
        [textScanner setCharactersToBeSkipped:nil];
        [textScanner scanUpToString:@"\"ingredients\": [\"" intoString:NULL];
        if([textScanner scanString:@"\"ingredients\": [\"" intoString:nil]){
            if([textScanner scanUpToString:@"\"], \"source_url" intoString:&tmp]){
                [BCObject setDetailedDescription:tmp];
            }
        }
    }
}


-(void)downloadAllImage
{
       BaseClass *BCObject = [BaseClass sharedInstance];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableData* postersArray;
        NSURL* postersUrl;
        NSMutableArray* tmpArr = [[NSMutableArray alloc]initWithCapacity:30];
        for(int i=0;i<[[BCObject titleOfTheDishes] count];i++)
        {
            postersUrl = [[NSURL alloc]initWithString:[[BCObject postersOfTheDishes] objectAtIndex:i]];
            postersArray = [NSMutableData dataWithContentsOfURL:postersUrl];
            [tmpArr addObject:postersArray];
            
        }
          [BCObject setAllImages:tmpArr];

    });
    
}




@end


