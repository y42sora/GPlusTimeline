//
//  TimelineCell.m
//  GooglePlusTimeline
//
//  Created by y42sora on 2013/06/09.
//  Copyright (c) 2013 y42sora. All rights reserved.
//

#import "TimelineCell.h"

@interface TimelineCell()
@end

@implementation TimelineCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *mainContent = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 310, 90)];
        mainContent.backgroundColor = [UIColor whiteColor];
        [self addSubview:mainContent];
        
        self.testTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 25, 50, 25)];
        self.testTextLabel.backgroundColor = [UIColor clearColor];
        self.testTextLabel.font = [UIFont systemFontOfSize:24];
        [mainContent addSubview:self.testTextLabel];
    }
    return self;
}

@end
