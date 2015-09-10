//
//  BaseClass.h
//  TSearch
//
//  Created by Pavlo Dumyak on 9/10/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseClass : NSObject
{
    NSMutableArray *titleOfTheDishes;
    NSMutableArray *postersOfTheDishes;
    NSMutableArray *descriptionOfTheDishes;
    NSMutableArray *allImages;
     NSString* detailedDescription;

    NSString * generalInformation;
   
  
    NSData* imagesForPosters;
}
@property NSMutableArray *titleOfTheDishes;
@property NSMutableArray *postersOfTheDishes;
@property  NSMutableArray *descriptionOfTheDishes;
@property NSMutableArray *allImages;
@property int numberValue;
@property NSMutableArray* urlWithDetail;
@property NSString* detailedDescription;
@property NSString* blabla;
+(BaseClass*)sharedInstance;
-(NSString*)connectToDataBase:(NSString*)type;
-(NSMutableArray*)parser:(NSString*)start :(NSString*)end;
-(void)parseForDetail;
-(NSData*)getImageForPosters:(BaseClass*)ob;
-(void)downloadAllImage;

@end
