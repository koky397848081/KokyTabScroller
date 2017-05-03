//
//  ALSpaceZoneArticleTableViewCell.m
//
//  Created by xujing on 16/8/8.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import "ALSpaceZoneArticleTableViewCell.h"
//#import "ALStringTools.h"

@interface ALSpaceZoneArticleTableViewCell()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *autherLayoutX;


@end

@implementation ALSpaceZoneArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

//- (void)layoutSubviews{
//    //首页精选cell;   专题详情第二屏cell
//    if (self.wikeSumaryDto) {
//        _autherNameL.text = _wikeSumaryDto.authorNickname;
//        if ([self.wikeSumaryDto.source integerValue] == 0 ||  [self.wikeSumaryDto.source integerValue] == 1) {
//
//            _autherNameL.text = @"爱礼官方";
//        }
//
//        BOOL isShowElite = [_wikeSumaryDto.elite integerValue];
//
//        NSString *titleShowElite = isShowElite == 1?@"精选":@"";
//        
//        _titleL.text =[NSString stringWithFormat:@"%@%@%@",titleShowElite,isShowElite == 1?@" | ":@"",_wikeSumaryDto.title] ;
//
//        
//        [ALStringTools fuwenbenLabel:_titleL FontNumber:FONT(17) AndRange:NSMakeRange(0, titleShowElite.length) AndColor:ColorWithRGB(209, 59, 59)];
//        
//        _upCountL.text = [NSString stringWithFormat:@"%d",_wikeSumaryDto.infoUpCount.intValue] ;
//        _commentCountL.text = [NSString stringWithFormat:@"｜ %d阅读",_wikeSumaryDto.infoCommentCount.intValue] ;
//        
//        [_thumbPathImg yy_setImageWithURL:IMAGEPATH(wikisUrl,_wikeSumaryDto._id,_wikeSumaryDto.thumbPath)
//                              placeholder:DEFAULTTOPICIMG
//                                  options:YYWebImageOptionSetImageWithFadeAnimation
//                               completion:NULL];
//    }
//    
//    if (self.articleDto) {
//        //作品－文章   我的－关注
//    //    _ailiOfficialImg.hidden = YES;
//        _autherLayoutX.constant = 15.0;
//        //   _elite.hidden = YES;
//        _autherNameL.text = _articleDto.author.nickname;
//        _titleL.text = _articleDto.title;
////        [_titleL setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
//        _upCountL.text = [NSString stringWithFormat:@"%d",_articleDto.thumbsUpCount.intValue] ;
//        _commentCountL.text = [NSString stringWithFormat:@"| %d阅读",_articleDto.commentCount.intValue] ;
//        
//        [_thumbPathImg yy_setImageWithURL:IMAGEPATH(wikisUrl,_articleDto._id,_articleDto.thumbPath)
//                              placeholder:DEFAULTTOPICIMG
//                                  options:YYWebImageOptionSetImageWithFadeAnimation
//                               completion:NULL];
//        
//    }
//    if (self.thumbDto) {
//        _autherNameL.text = _thumbDto.author.nickname;
//        if ([self.thumbDto.source integerValue] == 0 ||  [self.thumbDto.source integerValue] == 1) {
////            _ailiOfficialImg.hidden = NO;
//            _autherNameL.text = @"爱礼官方";
//        }
////        else{
////            _ailiOfficialImg.hidden = YES;
////            _autherLayoutX.constant = 15.0;
////        }
//        BOOL isShowElite = [_thumbDto.elite integerValue];
//        //    _elite.hidden = isShowElite== 1? NO:YES;
//        NSString *titleShowElite = isShowElite == 1?@"精选":@"";
//        _titleL.text =[NSString stringWithFormat:@"%@%@%@",titleShowElite,isShowElite == 1?@" | ":@"",_thumbDto.title] ;
////        [_titleL setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
//        [ALStringTools fuwenbenLabel:_titleL FontNumber:FONT(17) AndRange:NSMakeRange(0, titleShowElite.length) AndColor:ColorWithRGB(209, 59, 59)];
//        [_thumbPathImg yy_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_thumbDto.thumb]] placeholder:DEFAULTTOPICIMG options:YYWebImageOptionSetImageWithFadeAnimation completion:NULL];
//        
//    }
//    if (self.resultSummaryDto) {
//        //搜索－文章
//        _autherNameL.text = _resultSummaryDto.authorNickname;
//        if ([_resultSummaryDto.source integerValue] == 0 ||  [_resultSummaryDto.source integerValue] == 1) {
//            _autherNameL.text = @"爱礼官方";
//        }
//        BOOL isShowElite = [_resultSummaryDto.elite integerValue];
//        NSString *titleShowElite = isShowElite == 1?@"精选":@"";
//        _titleL.text =[NSString stringWithFormat:@"%@%@%@",titleShowElite,isShowElite == 1?@" | ":@"",_resultSummaryDto.title] ;
//        [ALStringTools fuwenbenLabel:_titleL FontNumber:FONT(17) AndRange:NSMakeRange(0, titleShowElite.length) AndColor:ColorWithRGB(209, 59, 59)];
//        _upCountL.text = [NSString stringWithFormat:@"%d",_resultSummaryDto.upCount.intValue] ;
//        _commentCountL.text = [NSString stringWithFormat:@"| %d阅读",_resultSummaryDto.commentCount.intValue];
//        [_thumbPathImg yy_setImageWithURL:[NSURL URLWithString:_resultSummaryDto.thumbPath] placeholder:DEFAULTTOPICIMG options:YYWebImageOptionSetImageWithFadeAnimation completion:NULL];
//    }
//}
@end
