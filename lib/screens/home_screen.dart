import 'package:flutter/material.dart';
import 'package:muscily_app/models/playlist_model.dart';
import 'package:muscily_app/models/song_model.dart';
import 'package:muscily_app/widgets/playlist_card.dart';
import 'package:muscily_app/widgets/section_header.dart';
import 'package:muscily_app/widgets/song_card.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

@override
Widget build(BuildContext context){
  List<Song> songs = Song.songs;
  // ignore: unused_local_variable
  List<Playlist> playlists = Playlist.playlists;
  var _CustomAppBar = AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
  return  
  
  
  Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
        Colors.deepPurple.shade800.withOpacity(0.8),
        Colors.deepPurple.shade200.withOpacity(0.8),
        ],
        ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      // ignore: prefer_const_constructors
      appBar: _CustomAppBar,
      bottomNavigationBar: const _CustomNavBar(),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const _DiscoverMusic(),
            _TrendingMusic(songs: songs),
             Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [SectionHeader(title: 'Playlists'),
                ListView.builder(
                  shrinkWrap: true ,
                  padding: const EdgeInsets.only(top: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: playlists.length,
                  itemBuilder: (context,index) {
                    return PlaylistCard(playlists: playlists[index]);


                })],
              ),
            )
          ],
          ),
      ),
    ),
  );
}
}



class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
      left: 20.0,
      top: 20.0,
      bottom: 20.0
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'Trending Music'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);

              },
          )
          )
        ],
        ),
    );
  }
}






class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome',
          style: Theme.of(context)
          .textTheme.bodyLarge),
          const SizedBox(height: 5),
          
          Text('Enjoy your Favorite music',
          style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            hintText: 'search',
            hintStyle: Theme.of(context)
            .textTheme.
            bodyMedium!.
            copyWith(color: Colors.grey.shade400),

            prefixIcon:
            Icon(Icons.search, color: Colors.grey.shade400),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            )
          ))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const _CustomNavBar();
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
      
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),
        label: 'Favorites',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline),
        label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.people_outline),
        label: 'Profile',
        ),

    ],
    );
  }
}

// ignore: unused_element
//class _CustomAppBar extends StatefulWidget with PreferredSizeWidget{
 // const _CustomAppBar({
 //   Key? key,
 // }) : super(key: key);
//}

