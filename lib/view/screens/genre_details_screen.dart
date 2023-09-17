
import 'package:audio_player/common_widgets/heading_text.dart';
import 'package:audio_player/core/constants.dart';
import 'package:audio_player/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home_providerWF.dart';
import '../widgets/album_tile.dart';

class GenreDetailsSCreen extends StatefulWidget {
  final Color color;
  final String id;
  const GenreDetailsSCreen({super.key, required this.color, required this.id});

  @override
  State<GenreDetailsSCreen> createState() => _GenreDetailsSCreenState();
}

class _GenreDetailsSCreenState extends State<GenreDetailsSCreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProviderWF>(context, listen: false);
      homePro.fetchGenreDetailsByIdAPI(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProviderWF>(context);
    return Scaffold(
      //  appBar: AppBar(
      //   backgroundColor: Colors.purpleAccent,
      //  ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // Below is the code for Linear Gradient.
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.color, backgroundDark],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          homePro.isDetailsLoading
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
                          child: HeadingText(
                            name: homePro.genreDetailsData?["name"]
                                    .toString()
                                    .capitalize() ??
                                "",
                            fontsize: 20,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                        Center(
                            child: HeadingText(
                          name:
                              "Popular ${homePro.genreDetailsData?["name"].toString().capitalize() ?? ""} Playlists",
                          fontsize: 20,
                          fontweight: FontWeight.w500,
                        )),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => const AlbumTile(),
                          ),
                        ),
                        const Center(
                            child: HeadingText(
                          name: "New & Trending",
                          fontsize: 20,
                          fontweight: FontWeight.w500,
                        )),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => const AlbumTile(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
