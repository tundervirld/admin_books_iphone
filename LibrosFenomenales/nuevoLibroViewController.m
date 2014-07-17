//
//  nuevoLibroViewController.m
//  LibrosFenomenales
//
//  Created by Roger Reyes on 16-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import "nuevoLibroViewController.h"

@interface nuevoLibroViewController ()

@end

@implementation nuevoLibroViewController

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
    // Do any additional setup after loading the view.
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

- (IBAction)cancelarButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)anadirButton:(id)sender {
    LibroFenomenal *nuevoLibro = [[LibroFenomenal alloc] init];
    nuevoLibro.nombre = _nombreTextField.text;
    nuevoLibro.autor = _autorTextField.text;
    nuevoLibro.publicado = _publicacionTextField.text;
    nuevoLibro.genero = _generoTextField.text;
    nuevoLibro.descripcion = _descripcionTextView.text;
    nuevoLibro.portada = _portadaImageView.image;
    
    //llamar al delegado
    [self.delegate nuevoLibroViewController:self haCreadoLibro:nuevoLibro];
    
}

- (IBAction)anadirImagenButton:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{ _portadaImageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];}];
}
@end
