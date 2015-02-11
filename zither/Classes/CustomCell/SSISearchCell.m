//
//  SSISearchCell.m
//  WarrantyManager
//
//  Created by MacOs on 6/17/14.
//  Copyright (c) 2014 Reilly. All rights reserved.
//

#import "SSISearchCell.h"

@implementation SSISearchCell

- (void)setProduct:(PFObject *)product
{
    self.backgroundColor = [UIColor whiteColor];
    [self.lblProductName setText:product[@"productName"]];

    UIImage *placeholderImage = [UIImage imageNamed:@"product_placeholder"];

    [self.productImageView cancelImageRequestOperation];
    [self.productImageView setImage:placeholderImage];

    PFFile *productImage = product[@"productImage"];
    NSString *productImageUrl = product[@"productImageUrl"];

    if (productImage.url) {

        [self.productImageView setImageWithURL:[NSURL URLWithString:productImage.url] placeholderImage:placeholderImage];
    }
    else if (productImageUrl) {

        [self.productImageView setImageWithURL:[NSURL URLWithString:productImageUrl] placeholderImage:placeholderImage];
    }
}

@end