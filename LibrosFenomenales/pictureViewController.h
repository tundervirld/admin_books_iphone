//
//  pictureViewController.h
//  LibrosFenomenales
//
//  Created by Roger Reyes on 16-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"

@interface pictureViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (strong, nonatomic) NSString *url_portada_seleccionada;
@end
