//
//  DetailViewController.m
//  TSearch
//
//  Created by Pavlo Dumyak on 9/10/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameOfDish.text = self.name;
    self.imageView.image = [UIImage imageWithData:self.data];
    self.detail.text = self.detailAboutDish;
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



@end
