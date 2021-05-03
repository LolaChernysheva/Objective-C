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
#import "PhotosView.h"

#define API_URL @"https://www.flickr.com/services/rest/"
#define API_KEY @"45420ba866f533cd68d2d8efe7b4645e"


@interface PhotosVC ()

@property (nonatomic, strong) PhotosView *photosCollectionView;
@property (nonatomic, strong) DetailPhotoVC *detailPhotoVC;
@property (nonatomic, strong) NSMutableArray<PhotoCellModel *> *photoCellModelList;

@end

@implementation PhotosVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _photosCollectionView = [[PhotosView alloc]initWith:self.view];
    _photosCollectionView.delegate = self;
    _photosCollectionView.dataSource = self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.photosCollectionView collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return [self.photosCollectionView collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:section];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return [self.photosCollectionView collectionView:collectionView layout:collectionViewLayout minimumLineSpacingForSectionAtIndex:section];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return [self.photosCollectionView collectionView:collectionView layout:collectionViewLayout minimumInteritemSpacingForSectionAtIndex:section];
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
        if (!self.detailPhotoVC) {
            self.detailPhotoVC = [[DetailPhotoVC alloc] init];
        }
        [self.detailPhotoVC resetImage];
        [self.detailPhotoVC loadImage:imageUrl];
        [self.navigationController pushViewController: self.detailPhotoVC animated: YES];
    }
}

- (void)loadPhotos :(PhotoListResponse *) result {
    _photoCellModelList = [[NSMutableArray alloc]init];
    
    NSArray<Photo *> *photoList = result.photos.photo;
    
    for (Photo *photo in photoList) {
        PhotoCellModel *photoCellModel = [[PhotoCellModel alloc]init];
        photoCellModel.identifier = photo.identifier;
        [self.photoCellModelList addObject:photoCellModel];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.photosCollectionView reloadData];
    });
    
    PhotosLoadImage *photoLoadImage = [[PhotosLoadImage alloc]init];
    // передаем на загрузку несколько фото, но функция обратного вызова будет вызвана по одному разу для каждой
    // полученной из сети фотографии
    [photoLoadImage loadImages: self.photoCellModelList :^(PhotoResponse *result, PhotoCellModel *photoCellModel)
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
            [self.photosCollectionView reloadItemsAtIndexPaths:list];
        });
        
    }];
}

@end


