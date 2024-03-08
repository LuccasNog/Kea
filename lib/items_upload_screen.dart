import 'dart:typed_data';

import 'package:flutter/material.dart';

class ItemsUploadScreen extends StatefulWidget {
  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}

class _ItemsUploadScreenState extends State<ItemsUploadScreen> {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          'Upload New Item',
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

//default Screen

  Widget defaultScreen() {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.purple,
            title: const Text(
              'Upload New Item',
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
                Icons.add_photo_alternate,
                color: Colors.white,
                size: 200,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                  onPressed: () {},
                  child: const Text(
                    'Add New Item',
                    style: TextStyle(color: Colors.white70),
                  ))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return defaultScreen();
  }
}
