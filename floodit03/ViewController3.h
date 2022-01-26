//
//  ViewController3.h
//  floodit03
//
//  Created by ToshiyA on 2013/11/16.
//  Copyright (c) 2013年 ToshiyA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

#define MY_BANNER_UNIT_ID   @"ca-app-pub-9150436864073478/2344859346"


@interface ViewController3 : UIViewController {
    IBOutlet UIButton *red;
    IBOutlet UIButton *yellow;
    IBOutlet UIButton *blue;
    IBOutlet UIButton *green;
    IBOutlet UIButton *gray;
    IBOutlet UIButton *magenta;
    
    GADBannerView *bannerView_;

}

@property(nonatomic, retain) NSMutableArray *tileArray;

- (IBAction)pushedRed:(id)sender;
- (IBAction)pushedYellow:(id)sender;
- (IBAction)pushedBlue:(id)sender;
- (IBAction)pushedGreen:(id)sender;
- (IBAction)pushedGray:(id)sender;
- (IBAction)pushedMagenta:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *limitNum;


- (IBAction)pushedPause:(id)sender;

@property double height_barance;
@property int limit;
@property int result;


@end
