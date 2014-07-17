//
//  informacionViewController.h
//  LibrosFenomenales
//
//  Created by Roger Reyes on 16-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"

@interface informacionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *autorLabel;
@property (weak, nonatomic) IBOutlet UILabel *fechaLabel;
@property (weak, nonatomic) IBOutlet UILabel *generoLabel;
@property (weak, nonatomic) IBOutlet UITextView *argumentoTextView;
@property (weak, nonatomic) IBOutlet UIImageView *portadaImageView;
@property LibroFenomenal *libroSeleccionado;
- (IBAction)atrasButton:(id)sender;
- (IBAction)compartirButton:(id)sender;
@end
