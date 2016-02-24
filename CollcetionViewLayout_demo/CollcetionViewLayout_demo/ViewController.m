//
//  ViewController.m
//  CollcetionViewLayout_demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "ViewController.h"
#import "BQWaterLayout.h"
#import "BQCollectionViewCell.h"

static NSString * const kIdentifierCell = @"BQCollectionViewCell";

@interface ViewController () <UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) BQWaterLayout *waterLayout;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

#pragma mark - 类方法

#pragma mark - 创建方法

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}
#pragma mark - 实例方法
- (void)initData{
    self.dataArray = [NSMutableArray array];
    //添加照片名字
    for (int i = 1; i <= 20; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i];
        [self.dataArray addObject:imageName];
    }
}

- (void)initUI{
    [self.view addSubview:self.collectionView];
}

#pragma mark - 事件响应方法

#pragma mark - UICollectionViewDataSource Method
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BQCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentifierCell forIndexPath:indexPath];
    cell.imageName = self.dataArray[indexPath.row];
    return cell;
}
#pragma mark - set方法

#pragma mark - get方法
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:self.waterLayout];
        _collectionView.backgroundColor = [UIColor cyanColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"BQCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kIdentifierCell];
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
- (BQWaterLayout *)waterLayout {
    if (_waterLayout == nil) {
        //layout内部有设置默认属性
        _waterLayout = [[BQWaterLayout alloc] init];
        //计算每个item高度方法，必须实现（也可以设计为代理实现）
        __weak typeof(self) weakSelf = self;
        [_waterLayout computeIndexCellHeightWithWidthBlock:^CGFloat(NSIndexPath *indexPath, CGFloat width) {
            NSString *imageName = weakSelf.dataArray[indexPath.row];
            UIImage *image = [UIImage imageNamed:imageName];
            CGFloat itemH = image.size.height / image.size.width * width;
            return itemH;
        }];
        //内间距
        _waterLayout.sectionInset = UIEdgeInsetsMake(20, 10, 10, 10);
    }
    return _waterLayout;
}
@end
