import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SnackBarScreen extends StatelessWidget {
  static const name = 'snack_screen';
  const SnackBarScreen({super.key});

  void showCustomSnackbar (BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(label: 'ok', onPressed: (){}),
        duration: const Duration(seconds: 2),
      ),
    );
  } 

  void openDialog (BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Ut dolor et nulla dolor aliqua ad adipisicing irure. Enim pariatur irure dolor excepteur cillum incididunt amet et laborum dolor qui aliqua. Voluptate dolor occaecat et mollit. Est velit dolor ut anim laboris exercitation. Aute ea quis aute proident est exercitation exercitation sit sunt nulla id fugiat nisi elit. Laborum velit adipisicing ad amet labore.'),
        actions: [
          TextButton(
            onPressed: ()=>context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: ()=> context.pop(),
            child: const Text('Aceptar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Non elit exercitation ullamco officia sunt pariatur dolore laborum et laboris eu nostrud qui.')
                  ]
                );
              },  
              child: const Text('licencias usadas')
            ),
            FilledButton(
              onPressed: ()=> openDialog(context),
              child: const Text('mostrar dialogo')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar SnackBar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context)
      ),
    );
  }
}