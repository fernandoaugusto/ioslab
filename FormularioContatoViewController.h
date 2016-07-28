//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios6233 on 18/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatoDAO.h"
#import <CoreLocation/CoreLocation.h>


@protocol FormularioContatoViewControllerDelegate <NSObject>

    - (void) contatoAtualizado:(Contato *) contato;

    - (void) contatoAdicionado:(Contato *) contato;

@end


@interface FormularioContatoViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>

    @property IBOutlet UITextField *nome;
    @property IBOutlet UITextField *telefone;
    @property IBOutlet UITextField *endereco;
    @property IBOutlet UITextField *email;
    @property IBOutlet UITextField *site;

    @property ContatoDAO* dao;

    @property Contato* contato;

    @property (weak) id<FormularioContatoViewControllerDelegate> delegate;

    @property IBOutlet UIButton* botaoFoto;

    @property IBOutlet UITextField* latitude;

    @property IBOutlet UITextField* longitude;


    -(IBAction) selecionaFoto:(id) sender;

    -(IBAction) buscarCoordenadas:(id) sender;




@end


