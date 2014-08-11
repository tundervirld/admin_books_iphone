//
//  ViewController.m
//  LibrosFenomenales
//
//  Created by Roger Reyes on 15-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import "ViewController.h"
#import "informacionViewController.h"
#import "celdaFenomenal.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _libros = [[NSMutableArray alloc] init];
    
    _libros = [LibroFenomenal initialBooks];
    
//    for(LibroFenomenal *subArray in _libros) {
//        
//        //LibroFenomenal *libro  = [subArray objectAtIndex:0];;
//        NSLog(@"Array in myArray: %@", subArray);
//    }
    
    
    

    
    
    [self.tableView reloadData];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Asignacion de valores al table view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

   /*^ UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:@"Celda"];
    
    
    
    LibroFenomenal *libro = [_libros objectAtIndex: indexPath.row];
    
    UILabel *etiqueta = (UILabel *)[celda viewWithTag:42];
    
    NSLog(@"El nombre del libro es %@:",libro.nombre);
    
    //etiqueta.text = [NSString stringWithFormat:@"Fila numero: %i", _cont];

    etiqueta.text = [NSString stringWithFormat:@"%@ ,   con indice:%i", libro.nombre,_cont ];
    
    self.incremento;
    
    NSLog(@"numero: %i", _cont);*/
    celdaFenomenal *celda = [tableView dequeueReusableCellWithIdentifier:@"Celda"];
    LibroFenomenal *libro = [_libros objectAtIndex:indexPath.row];
    celda.nombreLabel.text = libro.nombre;
    celda.autorLabel.text = libro.autor;
    celda.thumbnailImageView.image = libro.portada;
    
    return celda;
}
//asignar nnumero de columnas en la tabla
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_libros count];
}

//touch en las celdas
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    informacionViewController *informacionLibroViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"informacionViewController"];
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:informacionLibroViewController];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
    informacionLibroViewController.libroSeleccionado = [_libros objectAtIndex:indexPath.row];
}

//Metodo para eliminar
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        _deleteIndexPath = indexPath;
        
        LibroFenomenal *libro = [_libros objectAtIndex:indexPath.row];
        
        UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"El libro será eliminado está seguro?"
                                                        message:[NSString stringWithFormat:@"Libro: %@",libro.nombre]
                                                       delegate:self
                                              cancelButtonTitle:@"Cancelar"
                                              otherButtonTitles: @"Borrar",
                                                nil];
        [alerta show];
    }
}
//Detect button in alerts
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //u need to change 0 to other value(,1,2,3) if u have more buttons.then u can check which button was pressed.
   
    //Ok Button
    if (buttonIndex == 1) {

        [_libros removeObjectAtIndex:_deleteIndexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:_deleteIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

//capturar el segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueNuevoLibro"]){
        
        UINavigationController *navigationController = (UINavigationController *) segue.destinationViewController;
        nuevoLibroViewController *guardarNuevoLibroViewController = (nuevoLibroViewController *) navigationController.topViewController;
        guardarNuevoLibroViewController.libros = _libros;
        guardarNuevoLibroViewController.delegate = self;
        
    }
}

//implementacion del metodo de guardado
-(void)nuevoLibroViewController:(nuevoLibroViewController *)controller haCreadoLibro:(LibroFenomenal *)nuevoLibro{
    
    int nuevoRegistro = [_libros count];
    
    [_libros addObject:nuevoLibro];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:nuevoRegistro inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
    [self.tableView insertRowsAtIndexPaths:indexPaths
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

-(void) incremento{
    _cont +=1;
}
@end
