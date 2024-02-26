Documentación avanzada de flutter: 

# BLoC (Bussines logic component) - flutter_Bloc y Cubits

Técnicamente es uno solo, pero tiene esas dos ramificaciones. Normalmente flutter_Bloc es más usado pero se suele usar los cubits cuando queremos tener un estado más pequeño y queremos mantenerlo más simple. 

La idea de usar este provider es separar la data, el state de los widgets y cuando un widget necesite información de algún formulario que vaya y la tome y haga lo que tenga que hacer.

Hay muchas similitudes con Provider, uno va al blog y disparar eventos y demás. 


## Objetivo de la sección

Aprender lo siguiente: 

1. BLoC
2. Flutter Bloc
3. Cubits
4. Equatable
5. Eventos
6. Estado

### Iniciando el proyecto:

Como siempre ctrl+shift+p, nuevo proyecto, seleccionamos el lugar de arribo de los archivos. Agregamos el dispositivo con el que vamos a trabajar e inicializamos el proyecto con F5. Happy coding!

Mucha gente le corre a flutter Bloc que es la implementación de Bloc en flutter porque tiene como mucho código intermedio para hacer algo funcional se necesitan varios pasos. En cambio los cubits es mucho más sencilla.

Link a documentación oficial de BLoC: https://pub.dev/packages/flutter_bloc. Tiene muchas referencias a provider y tiene sus similitudes con riverpod.

Recordando que es importante siempre quitar la opción de debugg en nuestro main
```dart 
 return const MaterialApp(
      debugShowCheckedModeBanner: false,
      ...  
    );
```

## Estructura Inicial del proyecto:


### Estructura de carpetas: 

* Inicialmente creamos los directorios: config > router & theme > app_theme.dart

* Creamos el directorio presentation > screens > home_screen.dart 



![Ejemplo-Estructuración-Directorios]()


### Configuración del app_theme

* En el app_theme estamos realizando la configuración de todos los estilos de la aplicación, entonces inicialmente tenemos esta configuración: 

```dart
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme(){
    const seedColor = Colors.deepPurpleAccent;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      listTileTheme: const ListTileThemeData(
        iconColor: seedColor
      )
    );
  }
}
```

Que es una clase que indica que va a utilizar el widget de material ThemeData, usando material 3, que el la paleta de colores inicial va a ser la que definimos y que las listas van a tener unos colores diferentes. Estas configuraciones son muy generales pero a la larga muy personalizables e importantes en el aplicativo.

Seguido de esto es importante que tengamos en cuenta poner esta aplicación en nuestro main, por lo que justo debajo de nuestro debugBanner vamos a instanciar la clase y llamar el método getTheme(), importante tener en cuenta que ya no va a ser una constante por lo que hay que quitarla de forma global: 

```dart 
 return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      ...
    );
```

### Configuración de la home_screen

En esta vista se encuentra todo lo que el usuario ve apenas ingresa a la aplicación. Inicialmente en el modelo de la aplicación se quiere que lo primero que vea el usuario sea una interfaz sencilla con una especie de botones largos de navegación para poder dirigirse a diferentes partes de la aplicación. 

La configuración general se encuentra en el archivo home_screen.dart, pero la configuración de estos botones con ícono es la siguiente: 

```dart
 ListTile(
    title: const Text('cubits'),
    subtitle: const Text('Gestor de estado simple'),
    trailing: const Icon(Icons.arrow_forward_ios_rounded),
    onTap: () => {},
),
```
---------
![ListTileView](./uml/listtile.png)

-----------
Luego de la creación de este archivo es una buena práctica crear un archivo de exportaciones para evitar tener muchas imports en algunas partes de código. Lo único que se hace es exportar todo lo que contiene este archivo.

Luego en el main se incluye en este widget para home.

### Configuración de las rutas:

Dentro de la carpeta de router vamos a crear el app_router.dart, y además vamos a instalar la dependencia de go_router:

```bash
flutter pub add go_router
```




