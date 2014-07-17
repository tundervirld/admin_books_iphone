//
//  ViewController.h
//  LibrosFenomenales
//
//  Created by Roger Reyes on 15-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"
#import "nuevoLibroViewController.h"

@interface ViewController : UITableViewController <nuevoLibroViewControllerDelegate>
@property int cont;
@property NSMutableArray *libros;
@property NSIndexPath *deleteIndexPath;
- (void) incremento;
@end
