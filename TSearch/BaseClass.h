//
//  BaseClass.h
//  TSearch
//
//  Created by Pavlo Dumyak on 9/10/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseClass : NSObject

@property (nonatomic, retain)  NSData* imagesForPosters;
@property (nonatomic, retain)  NSString * generalInformation;
@property (nonatomic, retain)  NSMutableArray *titleOfTheDishes;
@property (nonatomic, retain)  NSMutableArray *postersOfTheDishes;
@property (nonatomic, retain)  NSMutableArray *descriptionOfTheDishes;
@property (nonatomic, retain)  NSMutableArray *allImages;
@property (nonatomic, assign)  int numberValue;
@property (nonatomic, retain)  NSMutableArray* urlWithDetail;
@property (nonatomic, retain)  NSString* detailedDescription;
@property (nonatomic, retain)  NSString* onlyOneDetail;

//singleton
+(BaseClass*)sharedInstance;
//for first general information
-(NSString*)connectToDataBase:(NSString*)type;
//base parser
-(NSMutableArray*)parser:(NSString*)start :(NSString*)end;
//parser for recipe detail
-(void)parseForDetail;
//for image convertation
-(NSData*)getImageForPosters:(BaseClass*)ob;
//for asynchronic download
-(void)downloadAllImage;

@end
