//
//  ViewController.m
//  GooglePlusTimeline
//
//  Created by y42sora on 2013/06/09.
//  Copyright (c) 2013 y42sora. All rights reserved.
//

#import "TimelineViewController.h"
#import "TimelineCell.h"

@interface TimelineViewController ()
@property (strong) UITableView *tableView;
@property (strong) NSMutableArray *cellFlags;
@end

@implementation TimelineViewController

// test data

-(id)init{
    self = [super init];
    if (self != nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 100;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
        
        // init flag
        self.cellFlags = [[NSMutableArray alloc] init];
        for (int i=0; i<20; i++)
            [self.cellFlags addObject:[NSNumber numberWithBool:false]];

    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_cellFlags count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TimelineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil)
        cell = [[TimelineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];

    cell.testTextLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // When a cell will appear, this method was called.
    
    // if already appeared, isn't animaiton.
    if ([[_cellFlags objectAtIndex:indexPath.row] boolValue])
        return;
    
    // set flag.
    [_cellFlags replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:true]];
    cell.backgroundColor = [UIColor clearColor];

    // save correct cell point.
    CGRect nowFrame = cell.frame;
    
    // make animaiton.
    cell.alpha = 0.0f;
    cell.transform = CGAffineTransformMakeRotation(-2*M_PI*5/360.0);
        
    cell.frame = CGRectMake(nowFrame.origin.x - 20, nowFrame.origin.y + 40, nowFrame.size.width, nowFrame.size.height);
        
    [UIView animateWithDuration:0.7
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.transform = CGAffineTransformMakeRotation(0.0);
                         cell.alpha = 1.0f;
                         cell.frame = nowFrame;
                         } completion:nil];
}

@end
