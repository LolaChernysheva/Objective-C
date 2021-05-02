//
//  PhotosVC.m
//  TestProject
//
//  Created by Лолита on 03.04.2021.
//  Copyright © 2021 Lolita Chernysheva. All rights reserved.
//

#import "PhotosVC.h"
#import "DetailPhotoVC.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoResponse.h"
#import "MostFrequentlyUsedTagsVC.h"
#import "PhotoCellModel.h"
#import "TagElement.h"
#import "PhotoListResponse.h"
#import "PhotosFetchData.h"
#import "PhotosLoadImage.h"

#define API_URL @"https://www.flickr.com/services/rest/"
#define API_KEY @"45420ba866f533cd68d2d8efe7b4645e"


@interface PhotosVC ()

@property (nonatomic, strong) UICollectionView *photoCollectionView;
@property (nonatomic, strong) NSMutableArray<PhotoCellModel *> *photoCellModelList;

@end

@implementation PhotosVC

- (void)viewDidLoad {
    _photoCellModelList = [[NSMutableArray alloc]init];
    [super viewDidLoad];
    PhotosFetchData *photosFetchData = [[PhotosFetchData alloc]init];
    // делаес запрос на список фото(списка url) по тегу
    [photosFetchData fetchData: _tagName
                              :^(PhotoListResponse * result) {
        NSArray<Photo *> *photoList = result.photos.photo;
        
        for (Photo *photo in photoList) {
            PhotoCellModel *photoCellModel = [[PhotoCellModel alloc]init];
            photoCellModel.identifier = photo.identifier;
            [self.photoCellModelList addObject:photoCellModel];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
        PhotosLoadImage *photoLoadImage = [[PhotosLoadImage alloc]init];
        // передаем на загрузку несколько фото, но функция обратного вызова будет вызвана по одному разу для каждой
        // полученной из сети фотографии
        [photoLoadImage loadImages: _photoCellModelList :^(PhotoResponse *result, PhotoCellModel *photoCellModel)
        {
            // для запрошеного идентификатора изображений нам вернули список урлов с размерами, от маленького
            // изображения до большого
            NSMutableArray<SizeElement *> *sizesArray = result.sizes.size;
            
            // Выбираем маленькое изображение и получаем по нему данные
            NSURL *smallImageUrl = [[NSURL alloc] initWithString: sizesArray[1].source];
            NSData *urlImageData = [[NSData alloc]initWithContentsOfURL:smallImageUrl];
            UIImage *smallImage = [[UIImage alloc]initWithData:urlImageData];
            
           // получаем индекс по модели, для которой получили фотографию
            NSInteger index =  [self.photoCellModelList indexOfObject:photoCellModel];
            
            // обновляем изображение для модели
            photoCellModel.imaage = smallImage;
            photoCellModel.sizeElementList = sizesArray;
            //self.photoCellModelList[index] = photoCellModel;
            
            // формируем indexPath по которому будем обновлять ячейчку в таблице, т.к мы не используем секции и
            // представление данных у нас линейное, нам достаточно получить индекс элемента
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
            NSMutableArray<NSIndexPath *> *list = [[NSMutableArray alloc]init];
            [list addObject:indexPath];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // обновляем только одну ячейку т.к в функцию передается только одна фотография
                [self.collectionView reloadItemsAtIndexPaths:list];
            });
            
        }];
        
    }];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 1.0;
    layout.minimumInteritemSpacing = 1.0;
    layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width/2)-1, ([UIScreen mainScreen].bounds.size.width/2));
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCellIdentifier"];
    _photoCollectionView = _collectionView;    _collectionView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:_collectionView];
    [_collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = true;
    [_collectionView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = true;
    [_collectionView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = true;
    [_collectionView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = true;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemsPerRow = 2;
    CGFloat paddingWidth = 20 * (itemsPerRow + 1);
    CGFloat availableWidth = collectionView.frame.size.width - paddingWidth;
    CGFloat widthPerItem = availableWidth / itemsPerRow;
    return CGSizeMake(widthPerItem, widthPerItem);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _photoCellModelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"CollectionViewCellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    PhotoCellModel *photoCellModel = _photoCellModelList[indexPath.row];
    cell.photoImageView.image = photoCellModel.imaage;
    return cell;
}
/*
 При клике на ячейку проверяем подгрузилось ли изображение, если да, то переходим на детальный экран иначе - игнорируем
 */
- (void)collectionView:(UITableView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCellModel *photoCellModel = _photoCellModelList[indexPath.row];
    NSString *imageUrl = [photoCellModel.sizeElementList lastObject].source;
    if (imageUrl) {
        DetailPhotoVC *detailPhotoVC = [[DetailPhotoVC alloc] init];
        [detailPhotoVC loadImage:imageUrl];
        [self.navigationController pushViewController: detailPhotoVC animated: YES];
    }
}

@end


