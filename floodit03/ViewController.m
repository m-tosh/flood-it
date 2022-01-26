//
//  ViewController.m
//  floodit03
//
//  Created by ToshiyA on 2013/11/15.
//  Copyright (c) 2013年 ToshiyA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //画面サイズの条件分岐
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        _height_barance = 1;
    }
    else {
        //difference of 3.5inch and 4inch
        _height_barance = 0.84507042;
        NSLog(@"got 3.5");
    }
    
            //ボタンの加工
            rookie.frame = CGRectMake(30, 80 * _height_barance, 260, 80 * _height_barance);
            [[rookie layer]setCornerRadius:12.0];
    
            easy.frame = CGRectMake(30, 175 * _height_barance, 260, 80 * _height_barance);
            [[easy layer]setCornerRadius:12.0];
    
            regular.frame = CGRectMake(30, 273 * _height_barance, 260, 80 * _height_barance);
            [[regular layer]setCornerRadius:12.0];
    
            hard.frame = CGRectMake(30, 370 * _height_barance, 260, 80 * _height_barance);
            [[hard layer]setCornerRadius:12.0];
    
            htp.frame = CGRectMake(20, 473 * _height_barance, 180, 75 * _height_barance);
            [[htp layer]setCornerRadius:12.0];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushrookie:(id)sender {
    [self performSegueWithIdentifier:@"torookie" sender:self];
}

- (IBAction)pusheasy:(id)sender {
    [self performSegueWithIdentifier:@"toeasy" sender:self];
}

- (IBAction)pushregular:(id)sender {
    [self performSegueWithIdentifier:@"toregular" sender:self];
}

- (IBAction)pushhard:(id)sender {
    [self performSegueWithIdentifier:@"tohard" sender:self];
}

@end
