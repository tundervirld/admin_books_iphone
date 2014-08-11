//
//  LibroFenomenal.m
//  LibrosFenomenales
//
//  Created by Roger Reyes on 15-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import "LibroFenomenal.h"

@implementation LibroFenomenal

+(NSArray *)methodToCall {
    
    NSArray *myArray = @[@"1", @"2", @"3", @"4", @"5"];
    
    //Fill the array with stuff here
    return myArray;
}

+(NSArray *)initialBooks{
    
    NSMutableArray *initialArrayBooks= [[NSMutableArray alloc] init];
   
    
     LibroFenomenal *libro = [LibroFenomenal  new];
    
    //propiedades del objeto
    libro.nombre = @"Don quijote de la mancha";
    libro.autor = @"Miguel de Cervantes";
    libro.publicado = @"2005";
    libro.genero = @"Parodia";
    libro.portada = [UIImage imageNamed:@"portadaQuijote.jpg"];
    libro.descripcion = @"Un hidalgo ya viejo y venido a menos en la region de La Mancha es fanatico de las novelas de caballeria y pierde la razon creyendose parte de ese mundo de caballeros andantes. Asi que ensilla un viejo rocin que apenas puede andar, busca a un campesino simplote al que toma por escudero, se arma con una oxidada armadura, una espada casi inutil yuna lanza que apenas sirve de vieja. Imagina que una fea campesina a la que casi no conoce es la bella dama de sueños y por cuyo honor luchara para deshacer entuertos e imponer la verdad y la justicia, monta en su desastrado rocin y se lanza a la aventura. Y en verdad tiene varias aventuras, pero que no son lo que el cree. Asi, imagina luchar contra gigantes que en realidad solo son molinos de viento y, enganchado por sus aspas, terminada derrengado contra el suelo. Otras aventuras son no menos divertidas. Y por ultimo consiguen lllevarlo de vuelta a casa donde fallece casi feliz. Cordialmente. Faluk. ";
    libro.url_portada =@"http://0.0.0.0:7771/assets/libros/1/original/objective_c.jpg?1405480391";
    
    [initialArrayBooks addObject:libro];
    
    libro = [[LibroFenomenal alloc] init];
    libro.nombre = @"Javi López y la cocinera fenomenal";
    libro.autor = @"Juan K. Hatin";
    libro.publicado = @"2013";
    libro.genero = @"Fantasía";
    libro.portada = [UIImage imageNamed:@"portadaJavi.png"];
    libro.descripcion =@"Este libro nace como portavoz del grito a la vida y a la dignidad de millones de seres vivos que no pueden gritar”. Con esta contundente declaración de intenciones se abre Mi libro de cocina vegana (2Âª ed., BCN, 2003), un libro que presenta en sus páginas la variedad y riqueza en posibilidades de la cocina elaborada con ingredientes de origen exclusivamente vegetal, más allá del tofu y las ensaladas de hoja verde - como marca la creencia popular - pero sin adentrarse en terrenos de excesiva sofisticación gastronómica.";
    libro.url_portada =@"0.0.0.0:7771/assets/libros/2/original/es_264_ios5_dev.jpg?1405544765";
    
    
    [initialArrayBooks addObject:libro];
    
    
    return initialArrayBooks;
}

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
 
self.cursosXcode = cursos;*/

@end
