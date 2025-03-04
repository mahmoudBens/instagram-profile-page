import 'package:flutter/material.dart';
import 'package:celec/user_data.dart';

class InstagramProfile extends StatefulWidget {
  final UserData userData;

  const InstagramProfile({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  State<InstagramProfile> createState() => _InstagramProfileState();
}

class _InstagramProfileState extends State<InstagramProfile> {
  late UserData _userData;

  @override
  void initState() {
    super.initState();
    _userData = widget.userData;
  }

  void _incrementStats() {
    setState(() {
      _userData.posts += 1;
      _userData.followers += 100;
      _userData.username = '${_userData.username}'+"septdsdsdsem";
    });
  }

  void _changeProfilePicture() async {
    // Simulating image picker
    setState(() {
      _userData.profilePicUrl = 'https://picsum.photos/200?random=${DateTime.now().millisecondsSinceEpoch}';
    });

    // In real app, you would use:
    // final ImagePicker _picker = ImagePicker();
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // if (image != null) {
    //   setState(() {
    //     _userData.profilePicUrl = image.path;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
           Flexible(flex: 3,
               child:
            Text(
              _userData.username,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
              ),
            )),
            Flexible(flex:1,child: Icon(Icons.keyboard_arrow_down, color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementStats,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          // Profile Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // Profile Picture with Change Button
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(_userData.profilePicUrl),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: _changeProfilePicture,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 32),
                // Stats Row
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('Posts', _userData.posts.toString()),
                      _buildStatColumn('Followers', _userData.followers.toString()),
                      _buildStatColumn('Following', _userData.following.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bio Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userData.displayName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(_userData.bio),
              ],
            ),
          ),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text('Edit Profile'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text('Share Profile'),
                  ),
                ),
              ],
            ),
          ),

          // Story Highlights
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _userData.storyHighlights.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(_userData.storyHighlights[index]),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Story ${index + 1}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Tab Bar
          const SizedBox(height: 16),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on, color: Colors.black)),
                    Tab(icon: Icon(Icons.person_pin_outlined, color: Colors.black)),
                  ],
                ),
                SizedBox(
                  height: 400,
                  child: TabBarView(
                    children: [
                      // Grid Posts
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                        ),
                        itemCount: _userData.postImages.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            _userData.postImages[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      // Tagged Posts
                      const Center(child: Text('No tagged posts')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}