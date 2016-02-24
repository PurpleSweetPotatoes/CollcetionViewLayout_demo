//
//  BQCollectionViewCell.m
//  CollcetionViewLayout_demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQCollectionViewCell.h"

@interface BQCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;

@end

@implementation BQCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setImageName:(NSString *)imageName {
    if (_imageName != imageName) {
        _imageName = [imageName copy];
        _displayImage.image = [UIImage imageNamed:_imageName];
    }
}
@end
