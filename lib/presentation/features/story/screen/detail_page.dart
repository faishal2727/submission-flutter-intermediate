// ignore_for_file: avoid_unnecessary_containers

import 'package:berbagi_app/data/datasources/remote/story_remote_datasource.dart';
import 'package:berbagi_app/data/model/story/detail_story_response.dart';
import 'package:berbagi_app/presentation/features/story/provider/story_detail_provider.dart';
import 'package:berbagi_app/presentation/features/story/provider/story_provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String storyId;
  const DetailPage({
    super.key,
    required this.storyId,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StoryDetailProvider>(
      create: (_) => StoryDetailProvider(
        storyDatasource: StoryDatasource(),
        id: widget.storyId,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<StoryDetailProvider>(
            builder: (contex, provider, _) {
              if (provider.state == ResultState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final story = provider.story.story;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        margin: const EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(story!.photoUrl!),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'author : ${story.name}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Created At : ${story.createdAt}',
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: Colors.grey,
                            ),
                      ),
                      Text(
                        story.description!,
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                            ),
                      ),
                      Text(
                        story.lat.toString(),
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                            ),
                      ),
                      Text(
                        story.lon.toString(),
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                            ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          Expanded(
                            child: Container(
                              child: FutureBuilder<String>(
                                future: getInfoLocation(story),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text("Loading ....");
                                  } else if (snapshot.hasError) {
                                    return const Text('No Found Location');
                                  } else {
                                    final locationInfo = snapshot.data ?? '';
                                    return Text(
                                      locationInfo,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text("Detail Lokasi :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      if (story.lat != null && story.lon != null)
                        MapsWidget(
                          lat: story.lat ?? 0.0,
                          lon: story.lon ?? 0.0,
                        )
                      else
                        const SizedBox()
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<String> getInfoLocation(Story? story) async {
  final info =
      await geo.placemarkFromCoordinates(story?.lat ?? 0.0, story?.lon ?? 0.0);

  final place = info.isNotEmpty ? info[0] : null;
  final address = place != null
      ? '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}'
      : '';
  return address;
}

class MapsWidget extends StatefulWidget {
  final double lat;
  final double lon;
  const MapsWidget({
    super.key,
    required this.lat,
    required this.lon,
  });

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late GoogleMapController mapController;
  final Set<Marker> markers = {};
  geo.Placemark? placemark;

  @override
  void initState() {
    super.initState();

    getLocation(widget.lat, widget.lon);
  }

  @override
  Widget build(BuildContext context) {
    final currentPosition = LatLng(widget.lat, widget.lon);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.amber),
        height: 250,
        child: Stack(
          children: [
            GoogleMap(
              markers: markers,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              initialCameraPosition: CameraPosition(
                target: currentPosition,
                zoom: 18,
              ),
              onMapCreated: (controller) async {
                final info =
                    await geo.placemarkFromCoordinates(widget.lat, widget.lon);

                final place = info[0];
                final street = place.street!;
                final address =
                    '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

                setState(
                  () {
                    mapController = controller;
                  },
                );
                defineMarker(currentPosition, street, address);
              },
            ),
            Positioned(
              bottom: 130,
              right: 16,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: "zoom-in",
                    backgroundColor: Colors.amber,
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      mapController.animateCamera(CameraUpdate.zoomIn());
                    },
                  ),
                  FloatingActionButton.small(
                    heroTag: "zoom-out",
                    backgroundColor: Colors.amber,
                    child: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      mapController.animateCamera(CameraUpdate.zoomOut());
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getLocation(double lat, double lon) async {
    final currentPosisition = LatLng(lat, lon);
    final marker = Marker(
      markerId: const MarkerId('Dicoding Id'),
      position: currentPosisition,
      onTap: () => mapController.animateCamera(
        CameraUpdate.newLatLngZoom(currentPosisition, 18),
      ),
    );
    markers.add(marker);
  }

  void defineMarker(LatLng latLng, String? street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(
        title: street ?? '',
        snippet: address,
      ),
    );
    setState(
      () {
        markers.clear();
        markers.add(marker);
      },
    );
  }
}
