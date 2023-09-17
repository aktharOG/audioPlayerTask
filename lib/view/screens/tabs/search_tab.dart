import 'dart:developer';

import 'package:audio_player/data/dummy_data.dart';
import 'package:audio_player/helpers/navigation_helpers.dart';
import 'package:audio_player/view/screens/dicover_music_explore_screen.dart';
import 'package:audio_player/view/screens/tabs/search_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../common_widgets/heading_text.dart';
import '../../../common_widgets/svg_icon.dart';
import '../../../providers/home_providerWF.dart';
import '../../widgets/heading_with_button.dart';
import '../../widgets/popular_genres_tile.dart';
import '../../widgets/recent_search_tile.dart';
import '../../widgets/search_result_tile.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProviderWF>(context, listen: false);
      homePro.getSearchhistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProviderWF>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.only(left: 10, bottom: 5),
                    decoration: BoxDecoration(
                        color: backgroundDark,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        const SvgIcon(
                          icon: "search",
                          color: white,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              push(context, const SearchScreen());
                            },
                            // controller: homePro.searchController,
                            style: const TextStyle(color: white),
                            decoration: const InputDecoration(
                                fillColor: white,
                                focusColor: white,
                                border: InputBorder.none,
                                hintText: "What do you want to listen to?",
                                hintStyle:
                                    TextStyle(fontSize: 12, color: white)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.notifications,
                ),
                const SizedBox(
                  width: 10,
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(profile),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (homePro.history.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: HeadingWithTitle(
                      title: "Recent Searches",
                      btnName: "Clear",
                      onTap: () {
                        homePro.clearALLHistory();
                      }),
                ),
              if (homePro.history.isNotEmpty)
                ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: homePro.history.length,
                    itemBuilder: (context, index) {
                      final history = homePro.history[index];
                      return Dismissible(
                        key: GlobalKey(),
                        onDismissed: (direction) {
                          homePro.deleteHistory(index);
                        },
                        child: GestureDetector(
                            onTap: () {
                              homePro.searchController.text = history.trim();
                              push(context, const SearchScreen());
                              homePro.search();
                            },
                            child: RecentSearchTile(
                              title: history,
                            )),
                      );
                    }),
              if (homePro.history.isEmpty)
                const SizedBox(
                  height: 40,
                ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: HeadingText(
                  name: "Popular Genres",
                  fontsize: 20,
                  fontweight: FontWeight.bold,
                ),
              ),

              GridView.builder(
                itemCount: dicoverList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3/2,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final data = dicoverList[index];
                  return GestureDetector(
                      onTap: () {
                        push(context, const DiscoverMusicExploreScreen());
                      },
                      child: PopularGenresTile(
                        data: data,
                      ));
                },
              )
              // const SearchResultTile()
            ],
          ),
        ));
  }
}
