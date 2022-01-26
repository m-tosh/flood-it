//
//  HowToPlay.h
//  floodit03
//
//  Created by ToshiyA on 2013/11/16.
//  Copyright (c) 2013年 ToshiyA. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MY_BANNER_UNIT_ID   @"ca-app-pub-9150436864073478/2344859346"


@interface HowToPlay : UIViewController {
    IBOutlet UIButton *back;
    IBOutlet UIButton *englishButton;
    IBOutlet UIButton *japaneseButton;
    IBOutlet UILabel *englishLabel;
    IBOutlet UILabel *japaneseLabel;    
}
- (IBAction)pushback:(id)sender;
- (IBAction)pushEnglish:(id)sender;
- (IBAction)pushJapanese:(id)sender;

@property double height_barance;


@end
