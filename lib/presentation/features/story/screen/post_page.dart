import 'dart:io';

import 'package:berbagi_app/presentation/features/story/provider/image_handler_provider.dart';
import 'package:berbagi_app/presentation/features/story/provider/post_provider.dart';
import 'package:berbagi_app/presentation/features/story/provider/story_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  final Function(BuildContext) onHome;
  const PostPage({
    super.key,
    required this.onHome,
  });

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final descriptionController = TextEditingController();
  final addOnTech = const LatLng(-6.8957473, 107.6337669);
  late GoogleMapController mapController;
  late final Set<Marker> markers = {};
  geo.Placemark? placemark;
  late double selectedLat;
  late double selectedLon;

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState scaffoldMessengerState =
        ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Project"),
        actions: [
          IconButton(
            onPressed: () {
              if (descriptionController.text.isNotEmpty) {
                _onUpload();
                context.read<StoryProvider>().reload();
              
              } else {
                scaffoldMessengerState.showSnackBar(
                  const SnackBar(
                    content: Text("Gambar atau  Deskripsi tidak boleh kosong"),
                  ),
                );
              }
            },
            icon: context.watch<PostProvider>().isUploadLoaading
                ? const CircularProgressIndicator()
                : const Icon(Icons.upload),
            tooltip: "Unggah",
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                height: 200,
                child: context.watch<ImageHandlerProvider>().imagePath == null
                    ? const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.image,
                          size: 100,
                        ),
                      )
                    : _showImage(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukan Deskripsi",
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Center(
                  child: Stack(
                    children: [
                      GoogleMap(
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: addOnTech,
                          zoom: 18,
                        ),
                        markers: markers,
                        zoomControlsEnabled: false,
                        mapToolbarEnabled: false,
                        myLocationButtonEnabled: false,
                        onMapCreated: (controller) async {
                          final info = await geo.placemarkFromCoordinates(
                              addOnTech.latitude, addOnTech.longitude);
                          final place = info[0];
                          final street = place.street!;
                          final address =
                              '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
                          setState(() {
                            placemark = place;
                          });
                          defineMarker(addOnTech, street, address);

                          final marker = Marker(
                            markerId: const MarkerId("source"),
                            position: addOnTech,
                          );
                          setState(
                            () {
                              mapController = controller;
                              markers.add(marker);
                            },
                          );
                        },
                        onLongPress: (LatLng latLng) {
                          onLongPressGoogleMap(latLng);
                        },
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: FloatingActionButton(
                          child: const Icon(Icons.my_location),
                          onPressed: () {
                            onMyLocationButtonPress();
                          },
                        ),
                      ),
                      if (placemark == null)
                        const SizedBox()
                      else
                        Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: PlacemarkWidget(
                            placemark: placemark!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () => _onGalleryView(),
                    child: const Text(
                      "Gallery",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () => _onCameraView(),
                    child: const Text(
                      "Camera",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId(
        "source",
      ),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }

  void onLongPressGoogleMap(LatLng latLng) async {
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      placemark = place;
      selectedLat = latLng.latitude;
      selectedLon = latLng.longitude;
    });
    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void onMyLocationButtonPress() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location services is not available");
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission is denied");
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final place = info[0];
    final street = place.street;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      placemark = place;
      selectedLat = latLng.latitude;
      selectedLon = latLng.longitude;
    });
    defineMarker(latLng, street!, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  _onUpload() async {
    final ScaffoldMessengerState scaffoldMessengerState =
        ScaffoldMessenger.of(context);
    final imageHandlerProvider = context.read<ImageHandlerProvider>();

    final postProvider = context.read<PostProvider>();
    final storyProvider = context.read<StoryProvider>();
    final imagePath = imageHandlerProvider.imagePath;
    final imageFile = imageHandlerProvider.imageFile;
    if (imagePath == null || imageFile == null) return;

    final fileName = imageFile.name;
    final bytes = await imageFile.readAsBytes();

    final newBytes = await postProvider.compressImage(bytes);

    await postProvider.postStory(
      newBytes,
      fileName,
      descriptionController.text.isNotEmpty
          ? descriptionController.text
          : 'No Description',
      selectedLat,
      selectedLon,
    );

    if (postProvider.postStoryResponse != null) {
      imageHandlerProvider.setImageFile(null);
      imageHandlerProvider.setImagePath(null);
      if (!context.mounted) return;
    }
    if (postProvider.error) {
      scaffoldMessengerState.showSnackBar(
        SnackBar(content: Text(postProvider.message)),
      );
    } else {
      scaffoldMessengerState.showSnackBar(
        SnackBar(content: Text(postProvider.message)),
      );
      widget.onHome(context);
      storyProvider.reload();
    }
  }

  _onGalleryView() async {
    final provider = context.read<ImageHandlerProvider>();

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  _onCameraView() async {
    final provider = context.read<ImageHandlerProvider>();
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  Widget _showImage() {
    final imagePath = context.read<ImageHandlerProvider>().imagePath;
    return kIsWeb
        ? Image.network(
            imagePath.toString(),
            fit: BoxFit.contain,
          )
        : Image.file(
            File(
              imagePath.toString(),
            ),
            fit: BoxFit.contain,
          );
  }
}

class PlacemarkWidget extends StatelessWidget {
  const PlacemarkWidget({
    super.key,
    required this.placemark,
  });
  final geo.Placemark placemark;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  placemark.street!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
