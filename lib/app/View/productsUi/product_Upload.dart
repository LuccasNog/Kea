// ignore_for_file: unused_local_variable

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductUploadScreen extends StatefulWidget {
  @override
  State<ProductUploadScreen> createState() => _ProductUploadScreenState();
}

class _ProductUploadScreenState extends State<ProductUploadScreen> {
  // imagem da memoria
  Uint8List? imageFileUint8List;

  //Controllers
  TextEditingController sellerNameTextEditingController =
      TextEditingController();
  TextEditingController sellerPhoneTextEditingController =
      TextEditingController();
  TextEditingController itemNameTextEditingController = TextEditingController();
  TextEditingController itemDescriptionTextEditingController =
      TextEditingController();
  TextEditingController itemPriceTextEditingController =
      TextEditingController();

  //Uploads
  bool isUploading = false;

  //upload form screen

  Widget uploadFormScreen() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Upload de Imagens',
          style: TextStyle(
              fontSize: 18,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.cloud_upload,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: [
          //condicional
          isUploading == true
              ? const LinearProgressIndicator(
                  color: Colors.purpleAccent,
                )
              : Container(),

          //Imagem
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
                child: imageFileUint8List != null
                    ? Image.memory(imageFileUint8List!)
                    : const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      )),
          ),

          const Divider(
            color: Colors.white70,
            thickness: 2,
          ),

          // Seller Name
          ListTile(
            leading: const Icon(Icons.person_pin_rounded),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: TextStyle(color: Colors.grey),
                controller: sellerNameTextEditingController,
                decoration: const InputDecoration(
                    hintText: 'Vendedora',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          //Phone
          ListTile(
            leading: const Icon(Icons.phone),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                controller: sellerPhoneTextEditingController,
                decoration: const InputDecoration(
                    hintText: 'Phone',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          // Item Name
          ListTile(
            leading: const Icon(Icons.title),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                controller: itemNameTextEditingController,
                decoration: const InputDecoration(
                    hintText: 'Nome do Item',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          // Item Description
          ListTile(
            leading: const Icon(Icons.description),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                controller: itemDescriptionTextEditingController,
                decoration: const InputDecoration(
                    hintText: 'Descrição do Item',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          // Item Price
          ListTile(
            leading: const Icon(Icons.price_change),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                controller: itemPriceTextEditingController,
                decoration: const InputDecoration(
                    hintText: 'Nome do Item',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),
        ],
      ),
    );
  }

//Show DIALOG
  showDialogBox() {
    return showDialog(
        context: context,
        builder: (c) {
          return SimpleDialog(
            backgroundColor: Colors.black,
            children: [
              //Capture Image With Camera
              SimpleDialogOption(
                onPressed: () {
                  captureImageWithPhoneCamera();
                },
                child: const Text(
                  'Tirar foto da sua Câmera',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              //Imagem da Galeria
              SimpleDialogOption(
                onPressed: () {
                  chooseImageFromPhoneGallery();
                },
                child: const Text(
                  'Escolher Imagem da Galeria',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              //Cancell
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancelar fotos',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

//default Screen

  captureImageWithPhoneCamera() async {
    try {
      // aqui vamos pegar a imagem
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        String? imagePath = pickedImage.path;
        imageFileUint8List = await pickedImage.readAsBytes();

        //remove background from image
        //make image transpoararente

        setState(() {
          imageFileUint8List;
        });
      }
    } catch (erroMsg) {
      print(erroMsg.toString());

      setState(() {
        imageFileUint8List = null;
      });
    }
  }

  chooseImageFromPhoneGallery() async {
    try {
      Navigator.pop(context);

      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        String imagePath = pickedImage.path;
        imageFileUint8List = await pickedImage.readAsBytes();

        //remove background from image
        //make image transpoararente

        setState(() {
          imageFileUint8List;
        });
      }
    } catch (erroMsg) {
      print(erroMsg.toString());

      setState(() {
        imageFileUint8List = null;
      });
    }
  }

  Widget defaultScreen() {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text(
              'Upload de Imagens',
              style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.camera_front,
                color: Colors.black,
                size: 150,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    showDialogBox();
                  },
                  child: const Text(
                    'Adicione um Item',
                    style: TextStyle(color: Colors.white70),
                  ))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return imageFileUint8List == null ? defaultScreen() : uploadFormScreen();
  }
}
