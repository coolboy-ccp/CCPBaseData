//
//  BeginView.m
//  MyOwnStudy
//
//  Created by liqunfei on 16/2/23.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "BeginView.h"

@implementation BeginView
{
    UIImageView *imgV;
    UIImageView *imgV1;
    UIImageView *imgV2;
    BOOL isTouched;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:245 green:245 blue:200 alpha:0.74];
        [self firstImgView];
    }
    return self;
}

- (void)firstImgView {
    imgV = [[UIImageView alloc] initWithFrame:self.bounds];
    imgV.image = [UIImage imageNamed:@"1.jpg"];
    [self addSubview:imgV];
}

- (void)createImgWithImageName:(NSString *)name {
    UIImage *img = [UIImage imageNamed:name];
    CGImageRef imageRef = CGImageCreateWithImageInRect(img.CGImage, CGRectMake(0, 0, img.size.width * 0.5, img.size.height));
    imgV1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width * 0.5, self.bounds.size.height)];
    imgV1.image = [UIImage imageWithCGImage:imageRef];
    CGImageRef imageRef1 = CGImageCreateWithImageInRect(img.CGImage, CGRectMake(img.size.width * 0.5,0,img.size.width, img.size.height));
    imgV2  = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width * 0.5, 0, self.bounds.size.width * 0.5, self.bounds.size.height)];
    imgV2.image = [UIImage imageWithCGImage:imageRef1];
    imgV1.contentMode = UIViewContentModeScaleToFill;
    imgV2.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:imgV1];
    [self addSubview:imgV2];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    imgV.image = [UIImage imageNamed:@"2.jpg"];
    if (!isTouched) {
        [self createImgWithImageName:@"1.jpg"];
        [UIView animateWithDuration:1.0 animations:^{
            imgV1.frame = CGRectMake(-0.5*self.bounds.size.width, 0, self.bounds.size.width * 0.5, self.bounds.size.height);
            imgV2.frame = CGRectMake(1.5 * self.bounds.size.width, 0, self.bounds.size.width * 0.5, self.bounds.size.height);
            isTouched = YES;
        } completion:^(BOOL finished) {
            [imgV1 removeFromSuperview];
            [imgV2 removeFromSuperview];
        }
    ];
    }
    else {
        [UIView animateWithDuration:1.0 animations:^{
            imgV.frame = CGRectMake(-self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
        } completion:^(BOOL finished) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(removeSelf)]) {
                [self.delegate removeSelf];
            }
        }];
    }
    
}


@end
