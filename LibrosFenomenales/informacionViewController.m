//
//  informacionViewController.m
//  LibrosFenomenales
//
//  Created by Roger Reyes on 16-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import "informacionViewController.h"
#import "LibroFenomenal.h"
#import "pictureViewController.h"

@interface informacionViewController ()

@end

@implementation informacionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Informacion que tendrá este método al cargar
    _nombreLabel.text = _libroSeleccionado.nombre;
    _autorLabel.text = _libroSeleccionado.autor;
    _fechaLabel.text = _libroSeleccionado.publicado;
    _generoLabel.text = _libroSeleccionado.genero;
    _portadaImageView.image = _libroSeleccionado.portada;
    _argumentoTextView.text = _libroSeleccionado.descripcion;
    _argumentoTextView.textAlignment = NSTextAlignmentJustified;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"dio touch"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"Visto"
                                          otherButtonTitles: nil];
    [alerta show];*/
    

    pictureViewController *pictureSelectedViewControler = [self.storyboard instantiateViewControllerWithIdentifier:@"pictureViewController"];
    
    pictureSelectedViewControler.url_portada_seleccionada = _libroSeleccionado.url_portada;
    
    [self presentViewController:pictureSelectedViewControler animated:YES completion:nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)atrasButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)compartirButton:(id)sender {
}
@end
