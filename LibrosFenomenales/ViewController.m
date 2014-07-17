//
//  ViewController.m
//  LibrosFenomenales
//
//  Created by Roger Reyes on 15-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import "ViewController.h"
#import "informacionViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _libros = [[NSMutableArray alloc] init];
    
    LibroFenomenal *libro = [[LibroFenomenal  alloc] init];
    
    //propiedades del objeto
    libro.nombre = @"Don quijote de la mancha";
    libro.autor = @"Miguel de Cervantes";
    libro.publicado = @"2005";
    libro.genero = @"Parodia";
    libro.portada = [UIImage imageNamed:@"portadaQuijote.jpg"];
    libro.descripcion = @"Un hidalgo ya viejo y venido a menos en la region de La Mancha es fanatico de las novelas de caballeria y pierde la razon creyendose parte de ese mundo de caballeros andantes. Asi que ensilla un viejo rocin que apenas puede andar, busca a un campesino simplote al que toma por escudero, se arma con una oxidada armadura, una espada casi inutil yuna lanza que apenas sirve de vieja. Imagina que una fea campesina a la que casi no conoce es la bella dama de sueños y por cuyo honor luchara para deshacer entuertos e imponer la verdad y la justicia, monta en su desastrado rocin y se lanza a la aventura. Y en verdad tiene varias aventuras, pero que no son lo que el cree. Asi, imagina luchar contra gigantes que en realidad solo son molinos de viento y, enganchado por sus aspas, terminada derrengado contra el suelo. Otras aventuras son no menos divertidas. Y por ultimo consiguen lllevarlo de vuelta a casa donde fallece casi feliz. Cordialmente. Faluk. ";
    libro.url_portada =@"http://0.0.0.0:7771/assets/libros/1/original/objective_c.jpg?1405480391";
    
    [_libros addObject:libro];
    
    libro = [[LibroFenomenal alloc] init];
    libro.nombre = @"Javi López y la cocinera fenomenal";
    libro.autor = @"Juan K. Hatin";
    libro.publicado = @"2013";
    libro.genero = @"Fantasía";
    libro.portada = [UIImage imageNamed:@"portadaJavi.png"];
    libro.descripcion =@"Este libro nace como portavoz del grito a la vida y a la dignidad de millones de seres vivos que no pueden gritar”. Con esta contundente declaración de intenciones se abre Mi libro de cocina vegana (2Âª ed., BCN, 2003), un libro que presenta en sus páginas la variedad y riqueza en posibilidades de la cocina elaborada con ingredientes de origen exclusivamente vegetal, más allá del tofu y las ensaladas de hoja verde - como marca la creencia popular - pero sin adentrarse en terrenos de excesiva sofisticación gastronómica.";
    libro.url_portada =@"0.0.0.0:7771/assets/libros/2/original/es_264_ios5_dev.jpg?1405544765";
    

    
    [_libros addObject:libro];
    
    
    
    /*NSURL * url = [NSURL URLWithString:@"http://localhost:3000/courses.json"];
    
    
    NSData * jsonData = [NSData dataWithContentsOfURL:url
                                              options:NSUTF8StringEncoding
                                                error:nil];
    
    NSError * error;
    
    NSArray * cursos = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    
    if (!cursos) {
        NSLog(@"Error al cargar los datos %@", [error localizedDescription]);
        return;
    }
    
    self.cursosXcode = cursos;
    [self.tableView reloadData];*/


	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Asignacion de valores al table view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:@"Celda"];
    
    
    
    LibroFenomenal *libro = [_libros objectAtIndex: indexPath.row];
    
    UILabel *etiqueta = (UILabel *)[celda viewWithTag:42];
    
    NSLog(@"El nombre del libro es %@:",libro.nombre);
    
    //etiqueta.text = [NSString stringWithFormat:@"Fila numero: %i", _cont];

    etiqueta.text = [NSString stringWithFormat:@"%@ ,   con indice:%i", libro.nombre,_cont ];
    
    self.incremento;
    
    NSLog(@"numero: %i", _cont);
    
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
