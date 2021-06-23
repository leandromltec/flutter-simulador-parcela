import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_simulador_parcela/app/shared/utils/uierror.dart';
import 'package:flutter_simulador_parcela/app/views/camera/camera_screen.dart';

//https://flutter.dev/docs/cookbook/plugins/picture-using-camera

class CameraComponent extends StatefulWidget {
  CameraDescription? camera;

  CameraComponent({this.camera});

  @override
  _CameraComponentState createState() => _CameraComponentState();
}

class _CameraComponentState extends State<CameraComponent> {
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;

  //CameraDescription? camera;

  /*Future<void> initializeCamera() async {
    await availableCameras().then((value) {
      camera = value.first;

      if (camera != null) {
        _cameraController = CameraController(camera!, ResolutionPreset.medium);
        _initializeControllerFuture = _cameraController!.initialize();
      }
    });
  }*/

  /*Future _initCameraController(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.medium);

    _initializeControllerFuture = _cameraController!.initialize();
  }*/

  @override
  void initState() {
    super.initState();

    _cameraController = CameraController(widget.camera!, ResolutionPreset.high);

    _initializeControllerFuture = _cameraController!.initialize();
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return CameraPreview(_cameraController!);
              else
                return Center(child: CircularProgressIndicator());
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Container(child: Icon(Icons.camera_alt)),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final takeImage = await _cameraController!.takePicture();

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CameraScreen(
                          imagePath: takeImage.path,
                        )));
          } on CameraException catch (e) {
            UIHelper.showDialogError(
                context: context,
                titleError: "Erro ao Fotografar",
                messageError:
                    "Descrição do erro - " + e.description.toString());
          }
        },
      ),
    );
  }
}
