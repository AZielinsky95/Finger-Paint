//
//  Canvas.h
//  Finger Paint
//
//  Created by Alejandro Zielinsky on 2018-04-20.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Canvas : UIView
@property BOOL isErasing;
-(void)changeStrokeColor:(UIColor*)color;
@end
