//
//  ViewController.m
//  TSearch
//
//  Created by Pavlo Dumyak on 9/10/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "ViewController.h"
#import "BaseClass.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Sorry for my "dirty" code, i was in a hurry
    //Yes, i know about MVC and code quality
    
    BaseClass *BCObject = [BaseClass sharedInstance];
    [BCObject connectToDataBase:@"http://food2fork.com/api/search?key=3e9166ad629eca6587a5e501e4e30961&q=shredded%20chicken"];
    [BCObject setTitleOfTheDishes:[NSMutableArray arrayWithArray:[BCObject parser:@"\"title\": \"" :@"\", \"source_url"]]];
    [BCObject setPostersOfTheDishes:[NSMutableArray arrayWithArray:[BCObject parser:@"\"image_url\": \"": @"\", \"social_rank\"" ]]];
    [BCObject downloadAllImage];
    [BCObject setUrlWithDetail:[NSMutableArray arrayWithArray:[BCObject parser:@"recipe_id\": \"": @"\", \"" ]]];
    [BCObject setDescriptionOfTheDishes:[NSMutableArray arrayWithArray:[BCObject parser:@"overview\":\"": @"\",\"release_date" ]]];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BaseClass *BCObject = [BaseClass sharedInstance];
    return [[BCObject titleOfTheDishes] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        //Sorry for my "dirty" code, i was in a hurry
       //Yes, i know about MVC and code quality
    
    BaseClass *BCObject = [BaseClass sharedInstance];
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    NSInteger index = [indexPath row];
    UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    cell.textLabel.font  = myFont;
    cell.textLabel.text = [[BCObject titleOfTheDishes] objectAtIndex:index];
    cell.imageView.image = [UIImage imageWithData:[[BCObject allImages] objectAtIndex:index]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Sorry for my "dirty" code, i was in a hurry
    //Yes, i know about MVC and code quality
    
    BaseClass * BCObject = [BaseClass sharedInstance];
    BCObject.numberValue = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    NSMutableString *tmp = [NSMutableString stringWithFormat:@"http://food2fork.com/api/get?key=3e9166ad629eca6587a5e501e4e30961&rId="];
    [tmp appendString:[BCObject.urlWithDetail objectAtIndex:BCObject.numberValue]];
    NSURL *referenceToDataBase = [NSURL URLWithString:tmp];
    BCObject.onlyOneDetail = [[NSString alloc]initWithContentsOfURL:referenceToDataBase encoding:NSUTF8StringEncoding error:nil];
    [BCObject parseForDetail];
    [self performSegueWithIdentifier:@"mySegue" sender:nil];
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}



-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mySegue"])
    {
        BaseClass * BCObject = [BaseClass sharedInstance];
        DetailViewController *DVCObject = (DetailViewController*)segue.destinationViewController;
        [DVCObject  setName:[[BCObject titleOfTheDishes] objectAtIndex:BCObject.numberValue]];
        [DVCObject  setData:[[BCObject allImages] objectAtIndex:BCObject.numberValue]];
        [DVCObject  setDetailAboutDish:[BCObject detailedDescription]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
