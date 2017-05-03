//
//  ALNewMyPageZoneViewController.m
//
//  Created by xujing on 16/11/10.
//  Copyright © 2016年 AiLi. All rights reserved.
//
#import <WebKit/WebKit.h>
#import "ALNewMyPageZoneViewController.h"
#import "ALSpaceZoneArticleTableViewCell.h"
#import <SDAutoLayout.h>

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

#define SCREEN_WIDTH_Flexible(X) ( X/375.0*SCREEN_WIDTH)
#define SCREEN_HEIGHT_Flexible(X) ( X/667.0*SCREENH_HEIGHT)
#define ColorWithOne(R) [UIColor colorWithRed:R/255.0 green:R/255.0 blue:R/255.0 alpha:1.0]
#define ColorWithRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

@interface ALNewMyPageZoneViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,WKNavigationDelegate>
{
    WKWebView  *_mainWebView;
    __weak IBOutlet UIButton *infoBtn;
    
    __weak IBOutlet UIButton *moreBtn;
    __weak IBOutlet UIButton *articleBtn;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UIView *slideView;
@property (weak, nonatomic) IBOutlet UIView *followBookBtnView;

@property (weak, nonatomic) IBOutlet UIView *scrollContantView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollVIewWidth;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fitstTableViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fitstTableViewLeading;

@property (weak, nonatomic) IBOutlet UITableView *secondTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondTableViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondTableViewLeading;

@property (weak, nonatomic) IBOutlet UITableView *thirdTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thirdTableViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thirdTableViewLeading;

@property (weak, nonatomic) IBOutlet UIButton *avatarBtn;
@property (weak, nonatomic) IBOutlet UILabel *nickNameL;
@property (weak, nonatomic) IBOutlet UILabel *cityL;
@property (weak, nonatomic) IBOutlet UILabel *categoryL;
@property (weak, nonatomic) IBOutlet UILabel *fansL;
@property (weak, nonatomic) IBOutlet UIButton *perfectInfoBtn;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *followBtnLeading;
@property (weak, nonatomic) IBOutlet UIButton *bookingBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bookingBtnTrailing;
@property (weak, nonatomic) IBOutlet UIView *slideLineView;

@end

@implementation ALNewMyPageZoneViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self interfaceUI];
    [self loadWebViewRequest];
    _perfectInfoBtn.hidden = !_isSelf;
    _followBookBtnView.hidden =  ! _perfectInfoBtn.hidden ;//关注 预约按钮
    [self slideBtnClick:infoBtn];
}

- (void)interfaceUI{
    
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, SCREENH_HEIGHT);
    _scrollVIewWidth.constant = CGRectGetWidth([UIScreen mainScreen].bounds) *3 ;
    
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 345)]; //345 ＝ slide.origin.y +slide.height －64
    
    _secondTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 345)];
    _thirdTableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 345)];
    
    self.scrollVIewWidth.constant = CGRectGetWidth([UIScreen mainScreen].bounds) *3 ;
    self.secondTableViewLeading.constant = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    self.thirdTableViewLeading.constant = CGRectGetWidth([UIScreen mainScreen].bounds)*2;
    self.thirdTableViewWidth.constant= self.fitstTableViewWidth.constant = self.secondTableViewWidth.constant =CGRectGetWidth([UIScreen mainScreen].bounds);
    
    _slideView.layer.borderColor = ColorWithOne(244.0).CGColor;
    
    
    _mainWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT - 64) ];
    _mainWebView.scrollView.scrollEnabled = NO;
    _mainWebView.navigationDelegate = self;
    _tableView.tableFooterView = _mainWebView;
    
    UIView *thirdTableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT - 64-65)];
    
    _thirdTableView.tableFooterView = thirdTableFooterView;
    
    _slideView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(self.view,344).heightIs(65);
    infoBtn.sd_layout.leftEqualToView(_slideView).widthIs(SCREEN_WIDTH/3.0).topEqualToView(_slideView).bottomSpaceToView(_slideView,1);
    articleBtn.sd_layout.leftSpaceToView(infoBtn,0).widthIs(SCREEN_WIDTH/3.0).topEqualToView(_slideView).bottomSpaceToView(_slideView,1);
    moreBtn.sd_layout.leftSpaceToView(articleBtn,0).widthIs(SCREEN_WIDTH/3.0).topEqualToView(_slideView).bottomSpaceToView(_slideView,1);
    
    
    [_avatarBtn setBackgroundImage:[UIImage imageNamed:@"img"] forState:UIControlStateNormal];
    _avatarBtn.layer.cornerRadius = 25;
    _avatarBtn.clipsToBounds = YES;
    _bookingBtn.layer.borderColor= _perfectInfoBtn.layer.borderColor = ColorWithRGB(0, 154, 255).CGColor;
    _followBtn.layer.borderColor = ColorWithRGB(255, 144, 60).CGColor;
    _bookingBtnTrailing.constant = _followBtnLeading.constant = SCREEN_WIDTH_Flexible(85);
    _perfectInfoBtn.layer.cornerRadius = _followBtn.layer.cornerRadius = _bookingBtn.layer.cornerRadius  = 3;
    
}

- (void)loadWebViewRequest{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://tinypng.com"]] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    [_mainWebView loadRequest:request];
    
}

- (IBAction)slideBtnClick:(UIButton *)sender {
    
    _slideLineView.frame = CGRectMake(sender.origin.x +SCREEN_WIDTH/12 , sender.height - 1, SCREEN_WIDTH/6, 1);
    [sender setTitleColor:ColorWithRGB(198, 59, 58) forState:UIControlStateNormal];
    
    if (sender.tag == 70) {
        [articleBtn setTitleColor:ColorWithRGB(143, 143, 146) forState:UIControlStateNormal];
        [moreBtn setTitleColor:ColorWithRGB(143, 143, 146) forState:UIControlStateNormal];
    }else  if (sender.tag == 71) {
        [infoBtn setTitleColor:ColorWithRGB(143, 143, 146) forState:UIControlStateNormal];
        [moreBtn setTitleColor:ColorWithRGB(143, 143, 146) forState:UIControlStateNormal];
    }else{
        [infoBtn setTitleColor:ColorWithRGB(143, 143, 146) forState:UIControlStateNormal];
        [articleBtn setTitleColor:ColorWithRGB(143, 143, 146) forState:UIControlStateNormal];
    }
    
    [_scrollView setContentOffset:CGPointMake((sender.tag - 70)*SCREEN_WIDTH, 0)];
    
}

- (IBAction)perfectInfoBtnClicked:(UIButton *)sender {
    
}

- (IBAction)followBtnClick:(UIButton *)sender {
    
}

- (IBAction)bookBtnClick:(UIButton *)sender {
    
}

- (IBAction)avatarBtnClick:(UIButton *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView != _scrollView) {
        
        if (scrollView.contentOffset.y > _topView.frame.size.height) {
            
            CGRect slideFrame = _slideView.frame;
            slideFrame.origin.y = 64;
            _slideView.frame = slideFrame;
            
            CGRect topViewFrame = _topView.frame;
            topViewFrame.origin.y = - _topView.height;
            _topView.frame = topViewFrame;
            
            if (_tableView.contentOffset.y <  _topView.frame.size.height) {
                _tableView.contentOffset = CGPointMake(0, _topView.frame.size.height);
                _secondTableView.contentOffset = CGPointMake(0, _topView.frame.size.height);
                _thirdTableView.contentOffset =CGPointMake(0, _topView.frame.size.height); ;
                
            }else if (_secondTableView.contentOffset.y <  _topView.frame.size.height) {
                _tableView.contentOffset = CGPointMake(0, _topView.frame.size.height);
                _secondTableView.contentOffset = CGPointMake(0, _topView.frame.size.height);
                _thirdTableView.contentOffset =CGPointMake(0, _topView.frame.size.height); ;
                
            }
            
        }else{
            
            CGFloat offset = scrollView.contentOffset.y;
            CGRect topFrame = _topView.frame;
            topFrame.origin.y = -offset+64;     //64 =topView.origin.y
            _topView.frame = topFrame;
            
            CGRect slideFrame = _slideView.frame;
            slideFrame.origin.y = -offset+344;  //344 =_slideView.origin.y
            _slideView.frame = slideFrame;
            
            if (scrollView ==_tableView) {
                _secondTableView.contentOffset = _thirdTableView.contentOffset=_tableView.contentOffset ;
            }else if (scrollView == _secondTableView) {
                _thirdTableView.contentOffset=_tableView.contentOffset = _secondTableView.contentOffset ;
            }else{
                _tableView.contentOffset = _secondTableView.contentOffset = _thirdTableView.contentOffset;
            }
        }
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _scrollView) {
        UIButton *currentBtn = (UIButton *)[self.view viewWithTag:scrollView.contentOffset.x/SCREEN_WIDTH +70];
        [self slideBtnClick:currentBtn];
    }
}

#pragma mark
#pragma mark tableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView isEqual:_secondTableView]) {
        static NSString *cellId = @"ALSpaceZoneArticleTableViewCell";
        ALSpaceZoneArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            
            [tableView registerNib:[UINib nibWithNibName:@"ALSpaceZoneArticleTableViewCell" bundle:nil] forCellReuseIdentifier:@"ALSpaceZoneArticleTableViewCell"];
            cell = [tableView dequeueReusableCellWithIdentifier:@"ALSpaceZoneArticleTableViewCell"];
        }
        return cell;
        
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _secondTableView) {
        return 25;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark
#pragma mark - UIWebViewDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    CGFloat height = [webView.scrollView contentSize].height;
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    
    CGRect newFrame    = webView.frame;
    newFrame.size.height  = height;
    webView.frame = newFrame;
    [_tableView setTableFooterView:webView];
    
}

@end
