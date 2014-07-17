//
//  nuevoLibroViewController.h
//  LibrosFenomenales
//
//  Created by Roger Reyes on 16-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"

//Parte del delegate
@class nuevoLibroViewController;
@protocol nuevoLibroViewControllerDelegate <NSObject>

- (void)nuevoLibroViewController:(nuevoLibroViewController *)controller haCreadoLibro:(LibroFenomenal *)nuevoLibro;
@end
//End parte del delegate



@interface nuevoLibroViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nombreTextField;
@property (weak, nonatomic) IBOutlet UITextField *autorTextField;
@property (weak, nonatomic) IBOutlet UITextField *publicacionTextField;
@property (weak, nonatomic) IBOutlet UITextField *generoTextField;
@property (weak, nonatomic) IBOutlet UITextView *descripcionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *portadaImageView;

//propiedades del delegate
@property (weak, nonatomic) id<nuevoLibroViewControllerDelegate> delegate;
@property NSMutableArray *libros;


- (IBAction)cancelarButton:(id)sender;
- (IBAction)anadirButton:(id)sender;
- (IBAction)anadirImagenButton:(id)sender;


@end
