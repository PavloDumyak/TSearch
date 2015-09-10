//
//  DetailViewController.h
//  TSearch
//
//  Created by Pavlo Dumyak on 9/10/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseClass.h"
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameOfDish;
@property (nonatomic, assign) NSMutableString* name;
@property (nonatomic, assign) NSData* data;
@property (nonatomic,assign)NSString* detailAboutDish;
@property (weak, nonatomic) IBOutlet UITextView *detail;
@end
