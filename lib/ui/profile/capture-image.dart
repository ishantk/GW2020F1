import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gw2020f1/ui/profile/display-captured-image.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CaptureImageFromCamera extends StatefulWidget{

  CameraDescription camera;

  createState() => CaptureImageFromCameraState();
}

class CaptureImageFromCameraState extends State<CaptureImageFromCamera>{

  CameraController controller;
  Future<void> controllerFuture;

  /*
  @override
  void initState() {
    super.initState();

    controller = CameraController(
      widget.camera,
      ResolutionPreset.medium
    );

    controllerFuture = controller.initialize();

  }*/

  void initializeController(){
    controller = CameraController(
        widget.camera,
        ResolutionPreset.medium
    );

    controllerFuture = controller.initialize();
  }

  @override
  Widget build(BuildContext context) {

    widget.camera = ModalRoute.of(context).settings.arguments;
    initializeController();

    return Scaffold(
      appBar: AppBar(
        title: Text("CAPTURE IMAGE"),
      ),
      body: FutureBuilder<void>(
        future: controllerFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return CameraPreview(controller);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async{
          await controllerFuture;
          String name = "temp-image.png";
          final imagePath = join( (await getTemporaryDirectory()).path, name);
          controller.takePicture(imagePath);

          //Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayCapturedImage(imagePath: imagePath,),));
          Navigator.pop(context, imagePath);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

}