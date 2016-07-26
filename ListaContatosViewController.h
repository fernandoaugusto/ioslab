//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios6233 on 19/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FormularioContatoViewController.h"
#import "ContatoDAO.h"
#import "GerenciadorDeAcoes.h"

@interface ListaContatosViewController : UITableViewController<FormularioContatoViewControllerDelegate>

@property ContatoDAO* dao;

@property Contato* contatoSelecionado;

@property NSInteger linhaDestaque;

@property (readonly) GerenciadorDeAcoes* gerenciador;

@end