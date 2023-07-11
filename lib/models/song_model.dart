class Song{
  late final String title;
  late final String description;
  late final String url;
  late final String coverUrl;


  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

static List<Song> songs= [
  Song(
    title: 'Glass',
    description: 'Glass',
    url: 'assets/music/glass.mp3',
    coverUrl: 'assets/images/glass.jpg',
  ),

Song(
    title: 'Illusions',
    description: 'Illusions',
    url: 'assets/music/Illusions.mp3',
    coverUrl: 'assets/images/Illusions.jpg',
  ),

 
Song(
    title: 'Pray',
    description: 'Pray',
    url: 'assets/music/pray.mp3',
    coverUrl: 'assets/images/pray.jpg',
  ), 


];

}