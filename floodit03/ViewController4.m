//
//  ViewController4.m
//  floodit03
//
//  Created by ToshiyA on 2013/11/16.
//  Copyright (c) 2013年 ToshiyA. All rights reserved.
//

#import "ViewController4.h"

#define board_width 300
#define tiles 20
#define board_offset_y 115
#define endNumber 30

@interface ViewController4 ()

@property (strong, nonatomic) UIView *pauseDisplay;
@property (strong, nonatomic) UIView *gameFinDisplay;

@end

@implementation ViewController4

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
    
    //広告をはる
    bannerView_ = [[GADBannerView alloc]initWithFrame:CGRectMake(0, 20, GAD_SIZE_320x50.width, GAD_SIZE_320x50.height)];
    bannerView_.adUnitID = MY_BANNER_UNIT_ID;
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    [bannerView_ loadRequest:[GADRequest request]];
    
            //色ボタンの加工
            white.frame = CGRectMake(10, 508 * _height_barance, 40, 40);
            [[white layer]setCornerRadius:20.0];
            [[white layer]setBorderWidth:2.0];
            [[white layer]setBorderColor:[[UIColor whiteColor]CGColor]];
    
            gray.frame = CGRectMake(62, 508 * _height_barance, 40, 40);
            [[gray layer]setCornerRadius:20.0];
            [[gray layer]setBorderWidth:2.0];
            [[gray layer]setBorderColor:[[UIColor whiteColor]CGColor]];
    
            brown.frame = CGRectMake(114, 508 * _height_barance, 40, 40);
            [[brown layer]setCornerRadius:20.0];
            [[brown layer]setBorderWidth:2.0];
            [[brown layer]setBorderColor:[[UIColor whiteColor]CGColor]];
    
            darkbrown.frame = CGRectMake(166, 508 * _height_barance, 40, 40);
            [[darkbrown layer]setCornerRadius:20.0];
            [[darkbrown layer]setBorderWidth:2.0];
            [[darkbrown layer]setBorderColor:[[UIColor whiteColor]CGColor]];
    
            forest.frame = CGRectMake(218, 508 * _height_barance, 40, 40);
            [[forest layer]setCornerRadius:20.0];
            [[forest layer]setBorderWidth:2.0];
            [[forest layer]setBorderColor:[[UIColor whiteColor]CGColor]];
    
            black.frame = CGRectMake(270, 508 * _height_barance, 40, 40);
            [[black layer]setCornerRadius:20.0];
            [[black layer]setBorderWidth:2.0];
            [[black layer]setBorderColor:[[UIColor whiteColor]CGColor]];
    
    //値の初期化
    _limit = 0;
    _result = 0;
    
    //ボード関連の値宣言
    float offsetX = ([UIScreen mainScreen].bounds.size.width - board_width)/2;
    float offsetY = board_offset_y ;
    float tileSize = (board_width/tiles);
    
    //タイルの管理
    _tileArray = [[NSMutableArray alloc]init];
    
    //初期タイルの配置
    for (int i = 0; i < tiles; i++){
        for (int j = 0; j < tiles; j++){
            int rannum =arc4random() % 6;     // rannum = {0,1,2,3,4,5}
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(offsetX + (tileSize * j), offsetY + (tileSize * i), tileSize, tileSize)];
            label.backgroundColor = [self getColor:rannum];
            
            [_tileArray addObject:label];
            [self.view addSubview:label];
        }
    }
    
    [self setupPauseBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Color
- (UIColor *)getColor:(int)N
{
    switch (N) {
        case 0:
            return [UIColor whiteColor];  // 白
        case 1:
            return [UIColor brownColor];   //茶
        case 2:
            return [UIColor blueColor];    //青
        case 3:
            return [UIColor darkGrayColor];    //ダークグレー
        case 4:
            return [UIColor lightGrayColor];    //ライトグレー
        case 5:
            return [UIColor blackColor]; //黒
        default:
            break;
    }
    return [UIColor clearColor];
}

- (IBAction)pushedWhite:(id)sender {
    _limit++;
    [self checkTileColor:[UIColor whiteColor]];
    _limitNum.text = [NSString stringWithFormat:@"step  %d / %d",_limit,endNumber];
}

- (IBAction)pushedGray:(id)sender {
    _limit++;
    [self checkTileColor:[UIColor lightGrayColor]];
    _limitNum.text = [NSString stringWithFormat:@"step  %d / %d",_limit,endNumber];
}

- (IBAction)pushedBrown:(id)sender {
    _limit++;
    [self checkTileColor:[UIColor brownColor]];
    _limitNum.text = [NSString stringWithFormat:@"step  %d / %d",_limit,endNumber];
}

- (IBAction)pushedDBrown:(id)sender {
    _limit++;
    [self checkTileColor:[UIColor darkGrayColor]];
    _limitNum.text = [NSString stringWithFormat:@"step  %d / %d",_limit,endNumber];
}

- (IBAction)pushedForest:(id)sender {
    _limit++;
    [self checkTileColor:[UIColor blueColor]];
    _limitNum.text = [NSString stringWithFormat:@"step  %d / %d",_limit,endNumber];
}

- (IBAction)pushedBlack:(id)sender {
    _limit++;
    [self checkTileColor:[UIColor blackColor]];
    _limitNum.text = [NSString stringWithFormat:@"step  %d / %d",_limit,endNumber];
}

- (void)checkTileColor:(UIColor *)tappedColor
{
    UILabel *presentLabel_zero = [_tileArray objectAtIndex:0];
    int n[tiles * tiles];
    int c[tiles * tiles];
    
    for (int i = 0; i < (tiles * tiles); i++){
        n[i] = 0;
        c[i] = 0;
        UILabel *presentLabel = [_tileArray objectAtIndex:i];
        if (presentLabel.backgroundColor == presentLabel_zero.backgroundColor){
            n[i] = 1;
        }
        else {
            n[i] = i+1;
        }
    }
    
    c[0] = 1;
    for (int i = 1; i < (tiles * tiles); i++){
        //upside
        if (((i-tiles) >= 0) && (n[i] == n[i-tiles]) && (c[i-tiles] == 1)){
            c[i] = 1;
        }
        //leftside
        if (((i%tiles != 0) && (i-1 >= 0)) && (n[i] == n[i-1]) && (c[i-1] == 1)){
            c[i] = 1;
        }
        //rightside
        if (((i+1)%tiles != 0) && (n[i] == n[i+1]) && (c[i+1] == 1)){
            c[i] = 1;
        }
        //downside
        if ((i+tiles < (tiles * tiles)) && (n[i] == n[i+tiles]) && (c[i+tiles] == 1)){
            c[i] = 1;
        }
    }
    
    for (int i = (tiles * tiles); i>0; i--){
        //upside
        if (((i-tiles) >= 0) && (n[i] == n[i-tiles]) && (c[i-tiles] == 1)){
            c[i] = 1;
        }
        //leftside
        if (((i%tiles != 0) && (i-1 >= 0)) && (n[i] == n[i-1]) && (c[i-1] == 1)){
            c[i] = 1;
        }
        //rightside
        if (((i+1)%tiles != 0) && (n[i] == n[i+1]) && (c[i+1] == 1)){
            c[i] = 1;
        }
        //downside
        if ((i+tiles < (tiles * tiles)) && (n[i] == n[i+tiles]) && (c[i+tiles] == 1)){
            c[i] = 1;
        }
    }
    
    for (int i = 0; i < (tiles * tiles); i++){
        UILabel *changeLabel = [_tileArray objectAtIndex:i];
        //upside
        if (((i-tiles) >= 0) && (n[i] == n[i-tiles]) && (c[i-tiles] == 1)){
            c[i] = 1;
        }
        //leftside
        if (((i%tiles != 0) && (i-1 >= 0)) && (n[i] == n[i-1]) && (c[i-1] == 1)){
            c[i] = 1;
        }
        //rightside
        if (((i+1)%tiles != 0) && (n[i] == n[i+1]) && (c[i+1] == 1)){
            c[i] = 1;
        }
        //downside
        if ((i+tiles < (tiles * tiles)) && (n[i] == n[i+tiles]) && (c[i+tiles] == 1)){
            c[i] = 1;
        }
        if (c[i] == 1){
            changeLabel.backgroundColor = tappedColor;
            [_tileArray replaceObjectAtIndex:i withObject:changeLabel];
            [self.view addSubview:changeLabel];
        }
    }
    presentLabel_zero.backgroundColor = tappedColor;
    [_tileArray replaceObjectAtIndex:0 withObject:presentLabel_zero];
    [self.view addSubview:presentLabel_zero];
    
    int x = 0;
    UILabel *doneLabel_zero = [_tileArray objectAtIndex:0];
    for (int i = 0; i < (tiles * tiles); i++){
        UILabel *doneLabel = [_tileArray objectAtIndex:i];
        if (doneLabel.backgroundColor == doneLabel_zero.backgroundColor){
            x = x + 1;
        }
        
    }
    //succeed
    if (x == (tiles * tiles)){
        
        [self gameFinished];
    }
    //failed
    else if (_limit == endNumber){
        
        _result = 1;
        [self gameFinished];
    }
}

#pragma mark - View
- (void)setupPauseBtn {
    
    //ポーズ画面の設定
    BOOL is4inch = ([[UIScreen mainScreen] bounds].size.height-568) ? NO : YES;
    _pauseDisplay = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, (is4inch)?568:480)];
    _pauseDisplay.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.6 alpha:0.5];
    
    UIButton *resume = [[UIButton alloc]initWithFrame:CGRectMake(60, (is4inch)?150:90, 200, 100)];
    resume.backgroundColor = [UIColor blackColor];
    resume.alpha = 0.7f;
    [resume setTitle:@"resume" forState:UIControlStateNormal];
    [[resume layer]setCornerRadius:10.0];
    [[resume layer]setBorderWidth:1.0];
    [[resume layer]setBorderColor:[[UIColor whiteColor]CGColor]];
    [resume addTarget:self action:@selector(resume:) forControlEvents:UIControlEventTouchUpInside];
    [_pauseDisplay addSubview:resume];
    
    
    UIButton *backToMain = [[UIButton alloc]initWithFrame:CGRectMake(60, (is4inch)?300:240, 200, 100)];
    backToMain.backgroundColor = [UIColor blackColor];
    backToMain.alpha = 0.7f;
    [backToMain setTitle:@"back to main Menu" forState:UIControlStateNormal];
    [backToMain addTarget:self action:@selector(backToMain:) forControlEvents:UIControlEventTouchUpInside];
    [[backToMain layer]setCornerRadius:10.0];
    [[backToMain layer]setBorderWidth:1.0];
    [[backToMain layer]setBorderColor:[[UIColor whiteColor]CGColor]];
    [_pauseDisplay addSubview:backToMain];
    
    //ゲーム終了画面のインスタンス生成
    _gameFinDisplay = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, (is4inch)?568:480)];
    _gameFinDisplay.backgroundColor = [UIColor colorWithRed:0 green:0.08 blue:0.1 alpha:0.8];
    
}

- (void)gameFinished {
    
    if (_result == 1) {
        
        //ゲームオーバー画面
        UILabel *failed = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 300, 140)];
        failed.text = [NSString stringWithFormat:@" FAILED "];
        failed.textColor = [UIColor whiteColor];
        failed.font = [UIFont systemFontOfSize:32];
        [_gameFinDisplay addSubview:failed];
        
        UIButton *backToMain = [[UIButton alloc]initWithFrame:CGRectMake(20, 280, 280, 200 * _height_barance)];
        backToMain.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
        [backToMain setTitle:@"back to main" forState:UIControlStateNormal];
        [backToMain.titleLabel setFont:[UIFont systemFontOfSize:36]];
        [backToMain addTarget:self action:@selector(backToMain:) forControlEvents:UIControlEventTouchUpInside];
        [[backToMain layer]setCornerRadius:10.0];
        [[backToMain layer]setBorderWidth:0.9];
        [[backToMain layer]setBorderColor:[[UIColor whiteColor]CGColor]];
        [_gameFinDisplay addSubview:backToMain];
        
        [self.view addSubview:_gameFinDisplay];
        
    }
    
    else {
        
        //クリア画面
        UILabel *clearLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 300, 140)];
        clearLabel.text = [NSString stringWithFormat:@"congratulations!!"];
        clearLabel.font = [UIFont fontWithName:@"Zapfino" size:30];
        clearLabel.textColor = [UIColor yellowColor];
        [_gameFinDisplay addSubview:clearLabel];
        
        UIButton *backToMain = [[UIButton alloc]initWithFrame:CGRectMake(20, 280, 280, 180)];
        backToMain.backgroundColor = [UIColor blackColor];
        backToMain.alpha = 0.7f;
        [[backToMain layer]setCornerRadius:12.0];
        [[backToMain layer]setBorderColor:[[UIColor whiteColor]CGColor]];
        [[backToMain layer]setBorderWidth:0.8];
        [backToMain setTitle:@"select level  " forState:UIControlStateNormal];
        [backToMain.titleLabel setFont:[UIFont systemFontOfSize:40]];
        [backToMain addTarget:self action:@selector(backToMain:) forControlEvents:UIControlEventTouchUpInside];
        [_gameFinDisplay addSubview:backToMain];
        
        [self.view addSubview:_gameFinDisplay];
        
    }

    
}

#pragma mark - Action
- (IBAction)pushedPause:(id)sender {
    
    [self.view addSubview:_pauseDisplay];
    _pauseDisplay.hidden = NO;
}

- (void)resume:(UIButton *)sender {
    
    _pauseDisplay.hidden = YES;
    
}

- (void)backToMain:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:Nil];
    
}

@end
