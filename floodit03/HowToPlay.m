//
//  HowToPlay.m
//  floodit03
//
//  Created by ToshiyA on 2013/11/16.
//  Copyright (c) 2013年 ToshiyA. All rights reserved.
//

#import "HowToPlay.h"

@interface HowToPlay ()

@end

@implementation HowToPlay

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        _height_barance = 1;
    }
    else {
        //difference of 3.5inch and 4inch
        _height_barance = 0.84507042;
    }
    
    japaneseLabel.hidden = YES;
    
    japaneseButton.frame = CGRectMake(20, 350 * _height_barance, 100, 40);
    englishButton.frame = CGRectMake(20, 400 * _height_barance, 100, 40);
    
    back.frame = CGRectMake(20, 498 * _height_barance, 110, 50);
    [[back layer]setCornerRadius:10.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushback:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)pushEnglish:(id)sender {
    japaneseLabel.hidden = YES;
    englishLabel.hidden = NO;
}

- (IBAction)pushJapanese:(id)sender {
    japaneseLabel.hidden = NO;
    englishLabel.hidden = YES;
}

@end
