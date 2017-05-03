//
//  ALSpaceZoneArticleTableViewCell.h
//
//  Created by xujing on 16/8/8.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ALInfoSummaryDto.h"
//#import "ALArticleDto.h"   //他的作品－文章
//#import "ALThumbsDto.h"   //有用
//#import "ALPagingSearchListDto.h"//搜索文章
//#import "ALResultSummaryDto.h"
@interface ALSpaceZoneArticleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *autherNameL;

//@property (weak, nonatomic) IBOutlet UIImageView *ailiOfficialImg;
//@property (weak, nonatomic) IBOutlet UIImageView *elite;//加精
@property (weak, nonatomic) IBOutlet UIImageView *thumbPathImg;

@property (weak, nonatomic) IBOutlet UILabel *titleL;
//@property (strong, nonatomic) ALInfoSummaryDto *wikeSumaryDto;   //文章
//@property (strong, nonatomic) ALArticleDto *articleDto;  //我的－有用
//@property (strong, nonatomic) ALThumbsDto *thumbDto;
@property (weak, nonatomic) IBOutlet UILabel *commentCountL;
@property (weak, nonatomic) IBOutlet UILabel *upCountL;
//@property (strong, nonatomic) ALResultSummaryDto *resultSummaryDto;  //搜索－文章

@end
