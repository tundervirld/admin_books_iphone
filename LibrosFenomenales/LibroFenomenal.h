//
//  LibroFenomenal.h
//  LibrosFenomenales
//
//  Created by Roger Reyes on 15-07-14.
//  Copyright (c) 2014 com.imaginarte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LibroFenomenal : NSObject

//Propiedades //setter getter
@property NSString *nombre;
@property NSString *autor;
@property NSString *publicado;
@property UIImage *portada;
@property NSString *genero;
@property NSString *descripcion;
@property NSString *url_portada;

+(NSArray *)methodToCall;
+(NSMutableArray *)initialBooks;


@end
