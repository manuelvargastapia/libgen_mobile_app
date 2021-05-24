# LibGen Mobile
[![F-Droid](https://img.shields.io/f-droid/v/com.manuelvargastapia.libgen?color=%231976d2)](https://f-droid.org/packages/com.manuelvargastapia.libgen) [![GitHub](https://img.shields.io/github/license/manuelvargastapia/libgen_mobile_app?color=%2335c202)](https://github.com/manuelvargastapia/libgen_mobile_app/blob/main/LICENSE)

<a href="https://f-droid.org/packages/com.manuelvargastapia.libgen" target="_blank">
<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png" height="75">
</a>

Este es un cliente móvil **no oficial** para el servicio de [Library Genesis](http://gen.lib.rus.ec). Es un proyecto independiente. Y además es Open Source, así que toda colaboración es bienvenida.

La app está desarrollada con Flutter y está disponible en [FDroid](https://f-droid.org).

De momento, el desarrollo está enfocado sólo en Android.

[*English version*](README.md)

## Funcionalidades

- Buscar libros en las secciones **SciTech** o **Fiction** de Library Genesis, ya sea por título, autor, serie, editorial, ISBN o MD5
- En SciTech, ordenar resultados por relevancia, título, año, páginas o tamaño de archivo, y definir criterios de orden según el tipo seleccionado (más nuevos primero, más livianos, etc)
- En Ficción, filtrar por extensión del archivo: Epub, Mobi, AZW, AZW3, FB2, PDF, RTF y TXT; filtrar por lenguage, entre una gran cantidad de opciones; y también es posible usar la opción "Comodín" para buscar usando cada palabra como comodín
- Ver detalles acerca de los libros (dependiendo de la *metadadata* provista, algunos campos pueden no estar presentes): portada, título, autor, descripción, índice, año, volumen, serie, edición, editorial, ciudad, páginas, idioma, ISBN, DOI, tamaño del archivo y extensión del archivo
- Mostrar historial de búsqueda a modo de sugerencias
- Cambiar entre tema claro y oscuro
- Mostrar *pop-up* con información de la app
- La interfaz está disponible en múltiples idiomas: alemán (DE), inglés (US), español (ES), francés (FR), japonés (JP), polaco (PL), portugués (BR) y chino (CN, simplificado)
- Y por supuesto, descargar cualquier libro

## TODO

La siguiente es una lisata con nuevas funcionalidades deseables, dentro de los alcances del proyecto. No obstante, toda idea y feedback es bienvenido.

- [ ] Buscar libros en otras secciones de LibGen (SciTech y Fiction ya están cubiertas)
- [ ] Permitir cambiar de idioma, en lugar de sólo usar el del sistema
- [ ] Traducir a otros idiomas (ver arriba la lista de idiomas ya cubiertos)
- [ ] Mejoras de UI (animaciones más fluidas, colores, estructura, fuentes, etc)
- [ ] Filtrar por tipo de archivo (ya implementado en Fiction, pero puede requerir un esfuerzo adicional hacerlo también en SciTech)

**Se sugiere enviar primero un *issue* para discutir ideas, en lugar de enviar directamente un PR**

## Entorno de ejecución

### Flutter y Dart

- Flutter: versión 2.0.4 (channel stable)
- Dart: versión 2.12.2

### Configuraciones

Los diferentes entornos de desarrollo de la app (basicamente, *development* y *production*) son manejados por medio de las ***compile time variables*** (consultar [artículo](https://binary-studio.com/2020/06/23/flutter-3/)). La única variable a considerar por ahora es LIBGEN_MOBILE_API. Esto nos permite pasar la URL de la API de desarrollo o producción directamente desde la terminal.

Notar también que esta app está usando [multiples *flavors*](https://github.com/Than-DE/libgen_mobile_app/blob/main/android/app/build.gradle#L51), por tanto se debe especificar al ejecutar la app. De lo contrario, ocurrirá el error "Gradle build failed to produce an .apk file".

Para ejecutar la app con la *compile time variable* más el *flavor* correcto se debe usar el siguiente comando:

`flutter run --dart-define=LIBGEN_API_URL=<VALUE> --flavor local`

Finalment, en VSCode, es buena idea definir un archivo `launch.json` para la depuración. Dicho archivo podría contener lo siguiente:

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "emulator",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define=LIBGEN_API_URL=http://10.0.2.2:3000",
                "--flavor",
                "local"
            ]
        },
    ]
}
```

Estas *flags* también funcionan con `flutter build apk` y otros comandos similares.

IMPORTANTE

En caso de ejecutar la aplicación en un dispositivo físico, se requiere usar como valor para LIBGEN_API_URL la IP privada de la máquina en la que se está ejecutando el servidor. "http://10.0.2.2:3000" sólo permitirá la conexión a emuladores, ya que están dentro de la misma red.

## API de LibGen

Library Genesis no dispone de una API pública con la que trabajar, por lo que se decidió crear un *backend* para consumir. Actualmente está alojado en Heroku.

Revisar [repo](https://github.com/manuelvargastapia/libgen_api/tree/master) para ejecutar una instancia propia y poder así pasar a la app la correspondiente URL como *compile time variable*. Es un proyecto ExpressJS; basta con clonar (o _fork_) el repo, instalar dependencias y ejecutar con `npm start`.

Durante el desarrollo, se creó un _fork_ de [esta librería no oficial para Libgen](https://github.com/dunn/libgen.js), a fin de poder acceder a los datos. [Este es el repo](https://github.com/manuelvargastapia/libgen.js/tree/custom_libgen) de la versión modificada.

## Dependencias

La siguiente es una lista de todos los paquetes oficiales y de terceros en uso hasta ahora.

**Traducciones**

  - flutter_localizations:
    - sdk: flutter
  - [intl](https://pub.dev/packages/intl): ^0.17.1

En adición, para generar el *boilerplate* se usó el *plugin* de VScode [*Flutter Intl*](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl). De este modo, se recomienda usar el mismo *plugin* para generar automáticamente el nuevo código para las nuevas traducciones. Por desgracia, la [documentación oficial](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) parece estar desactualizada.

**Peticiones a API**

  - [http](https://pub.dev/packages/http): ^0.13.2

**Manejo del estado**

  - [flutter_bloc](https://pub.dev/packages/flutter_bloc): ^6.0.6
  - [hydrated_bloc](https://pub.dev/packages/hydrated_bloc): ^6.1.0

**Descargas**

Para las descargas, se está usando un [*fork*](https://github.com/manuelvargastapia/flutter_downloader) del paquete *flutter_downloader*. Ver `pubspec.yaml` para más detalles.

  - [flutter_downloader](https://pub.dev/packages/flutter_downloader)
  - [downloads_path_provider](https://pub.dev/packages/downloads_path_provider): ^0.1.0
  - [permission_handler](https://pub.dev/packages/permission_handler): ^5.0.1+1
  
**Descargar desde el navegador**

  - [url_launcher](https://pub.dev/packages/url_launcher): ^5.7.10

**Renderizar contenido HTML**

Para renderizar HTML, se está usando un [*fork*](https://github.com/manuelvargastapia/simple_html_css_flutter) del paquete *simple_html_css*. Ver `pubspec.yaml` para más detalles.

  - [simple_html_css](https://pub.dev/packages/simple_html_css)

**Almacenamiento local**

  - [hive](https://pub.dev/packages/hive): ^1.4.4+1
  - [hive_flutter](https://pub.dev/packages/hive_flutter): ^0.3.1

**Generación automática de código**

  - [json_annotation](https://pub.dev/packages/json_annotation): ^3.1.0
  - [build_runner](https://pub.dev/packages/build_runner): ^1.10.3
  - [json_serializable](https://pub.dev/packages/json_serializable): ^3.5.0
  - [hive_generator](https://pub.dev/packages/hive_generator): ^0.8.2
  - [equatable](https://pub.dev/packages/equatable): ^1.2.5

**Otros**

  - [dartz](https://pub.dev/packages/dartz): ^0.9.2
  - [expandable](https://pub.dev/packages/expandable): ^4.1.4
  - [package_info](https://pub.dev/packages/package_info): ^0.4.3+2
