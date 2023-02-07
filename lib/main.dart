import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nson/db/db_helper.dart';
import 'package:nson/services/theme_services.dart';
import 'package:nson/ui/home.dart';
import 'package:nson/ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: const Home(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
/*
INFO | Android emulator version 32.1.9.0 (build_id 9364964) (CL:N/A) INFO |
 Found systemPath C:\Users\ksawa\AppData\Local\Android\Sdk\system-images\android-29\google_apis_playstore\x86\ 
 init: Could not find wglGetExtensionsString! remote 0 Maybe try updating graphics card driver,
  or disconnect external displays?ERROR: 
  init: Missing extension function wglGetPixelFormatAttribiv 
  ERROR: init: Missing extension function wglGetPixelFormatAttribfv 
  ERROR: init: Missing extension function wglChoosePixelFormat 
  ERROR: init: Missing extension function wglMakeContextCurrent 
  ERROR: init: Missing extension function wglGetCurrentReadDC 
  ERROR: init: Missing extension function wglCreatePbuffer 
  ERROR: init: Missing extension function wglGetPbufferDC 
  ERROR: init: Missing extension function wglReleasePbufferDC 
  ERROR: init: Missing extension function wglDestroyPbuffer 
  ERROR: init: Missing extension function wglCreateContextAttribs 
  ERROR: init: Missing extension function wglSwapInterval 
  ERROR: init: Missing extension function wglGetSwapInterval 
  OpenGL Core Profile not supported.
   ERROR | Could not find GLES 2.x config! 
   ERROR | Failed to obtain GLES 2.x extensions string!
    ERROR | Could not initialize emulated framebuffer 
    INFO | Storing crashdata in: C:\Users\ksawa\AppData\Local\Temp\\AndroidEmulator\emu-crash.db,
     detection is enabled INFO | Duplicate loglines will be removed,
      if you wish to see each indiviudal line launch with the -log-nofilter flag. 
      INFO | IPv4 server found: 192.168.81.20 INFO |
       Crash reports will be automatically uploaded to: https://clients2.google.com/cr/report 
       INFO | Report bde2f30f-88cf-43bf-b75b-2c4c98dd5684 is available remotely as: d386767d1691c012, 
       deleting. INFO | Consent given for uploading crashreport 412f1c84-81f7-4d02-8350-a845621e4d33 
       to https://clients2.google.com/cr/report INFO | added library vulkan-1.dll
        HAX is working and emulator runs in fast virt mode. W
        ARNING | *** Basic token auth will be deprecated soon, please migrate to using -grpc-use-jwt *** 
        INFO | Started GRPC server at 127.0.0.1:8554, security: Local, auth: +token 
        INFO | Advertising in: C:\Users\ksawa\AppData\Local\Temp\avd\running\pid_12976.ini 
        ERROR | OpenGLES emulation failed to initialize. Please consider the following troubleshooting
         steps: 1. Make sure your GPU drivers are up to date.
          2. Erase and re-download the emulator ($ANDROID_SDK_ROOT/emulator). 
          3. Try software rendering: Go to Extended Controls > Settings > Advanced tab and change 
          "OpenGL ES renderer (requires restart)" to "Swiftshader". Or, run emulator from command line with "
          -gpu swiftshader_indirect". 4. Please file an issue
           to https://issuetracker.google.com/issues?q=componentid:192727 and
            provide your complete CPU/GPU info plus OS and display setup.
             ERROR | crashhandler_die: fatal: OpenGLES emulation failed to initialize. 
             Please consider the following troubleshooting 
             steps: 1. Make sure your GPU drivers are up to date. 
             2. Erase and re-download the emulator ($ANDROID_SDK_ROOT/emulator). 
             3. Try software rendering: Go to Extended Controls > Settings > Advanced tab and change
              "OpenGL ES renderer (requires restart)" to "Swiftshader". Or,
               run emulator from command line with "-gpu swiftshader_indirect". 
               4. Please file an issue to https://issuetracker.google.com/issues?q=componentid:192727 and 
               provide your complete CPU/GPU info plus OS and display setup.*/