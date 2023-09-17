import 'package:audio_player/core/constants.dart';
import 'package:audio_player/providers/home_providerWF.dart';
import 'package:audio_player/services/audio_services/models/models.dart';
import 'package:audio_player/view/screens/popular_song_explore.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/heading_text.dart';
import '../../../data/dummy_data.dart';
import '../../../helpers/navigation_helpers.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/discover_music_tile.dart';
import '../../widgets/heading_with_button.dart';
import '../../widgets/popular_tile.dart';
import '../dicover_music_explore_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProviderWF>(context);
    return RefreshIndicator(
      onRefresh: () async{
        homePro.fetchGenresAPI();
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const HeadingText(
              name: "Good afternoon, Arsha!",
              fontweight: FontWeight.bold,
            ),
            actions: const [
              Icon(
                Icons.headphones,
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(profile),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // discover
                  HeadingWithTitle(
                      title: "Discover Music",
                      btnName: "Explore",
                      onTap: () {
                        pushSlideToLeft(
                            context, const DiscoverMusicExploreScreen());
                      }),
    
                  //      DiscoverMusicTile(title: "s", subTitle: "sds", image: lap),
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final data = dicoverList[index];
                          return GestureDetector(
                            onTap: (){
                                push(context, const DiscoverMusicExploreScreen());
                            },
                            child: DiscoverMusicTile(
                                title: data["title"],
                                subTitle: data["subTitle"],
                                image: data["image"]),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: dicoverList.length),
                  ),
    
                  // popular
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const HeadingText(
                        name: "Popular songs",
                        fontsize: 20,
                      ),
                      CustomButton(btnName: "Explore",onTap: (){
                        pushSlideToLeft(context,const PopularSongExplore());
                      },)
                    ],
                  ),
    
                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        final data = Song.songs[index];
                        return  PopularTile(song: data,);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: Song.songs.length)
                ],
              ),
            ),
          )),
    );
  }
}
