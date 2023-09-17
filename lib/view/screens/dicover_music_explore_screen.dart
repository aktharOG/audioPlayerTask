
import 'package:audio_player/core/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../common_widgets/heading_text.dart';
import '../../helpers/navigation_helpers.dart';
import '../../providers/home_providerWF.dart';
import 'genre_details_screen.dart';

class DiscoverMusicExploreScreen extends StatefulWidget {
  const DiscoverMusicExploreScreen({super.key});

  @override
  State<DiscoverMusicExploreScreen> createState() => _DiscoverMusicExploreScreenState();
}

class _DiscoverMusicExploreScreenState extends State<DiscoverMusicExploreScreen> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       final homePro = Provider.of<HomeProviderWF>(context,listen: false);
       homePro.fetchGenresAPI();
     });
  }
  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProviderWF>(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: HeadingText(
                    name: "Browse all",
                    fontsize: 20,
                  ),
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homePro.genreList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 1.8,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final data = homePro.genreList[index];
                    final color =
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0);
                    return InkWell(
                      onTap: (){
                        push(context,  GenreDetailsSCreen(color: color,id: data.id,));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(5),
                          
                          ),
                          alignment: Alignment.center,
                          height: 70,
                          width: 100,
                          child: HeadingText(
                            name: data.name,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
