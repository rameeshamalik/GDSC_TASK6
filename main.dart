import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Claudia Alves',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'hello @ reallygreatesite.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Username'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Password'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.apps),
              title: Text('All Categories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllCategoriesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.shirt),
              title: Text('Shirts'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShirtsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.accessibility),
              title: Text('Bottoms'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.shoePrints),
              title: Text('Shoes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.tag_faces),
              title: Text('Heels'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeelsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.watch),
              title: Text('Accessories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccessoriesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.style),
              title: Text('Tops'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class AllCategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'All Categories',

          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ), // Text color
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SlippersListViewScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          List<String> imagePaths = [
            'lib/icons/1.jpeg',
            'lib/icons/2.png',
            'lib/icons/4.jpeg',
            'lib/icons/3.png',
            'lib/icons/6.jpeg',
            'lib/icons/5.jpeg',
          ];
          List<String> customTexts = [
            'Sliders',
            'Long sleeve Tshirt',
            'Dress',
            'Sandles',
            'Joggers',
            'Top',
          ];
          return GridItem(
              index: index, imagePaths: imagePaths, customTexts: customTexts);
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;
  final List<String> imagePaths;
  final List<String> customTexts;
  GridItem(
      {required this.index,
      required this.imagePaths,
      required this.customTexts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePaths[index % imagePaths.length]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          customTexts[index % customTexts.length],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SlippersListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'All Categories',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.apps,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: 200.0,
              child: Card(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // SizedBox(width: 8.0),
                          Text('Slippers ${index + 1}'),
                        ],
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BottomsPage extends StatelessWidget {
  final List<String> imagePaths = [
    'lib/icons/b1.jpeg',
    'lib/icons/b2.jpg',
    'lib/icons/b3.jpg',
    'lib/icons/b4.jpeg',
    'lib/icons/b5.jpeg',
    'lib/icons/b6.jpeg',
    'lib/icons/b8.jpeg',
  ];
  final List<String> texts = [
    'Womes Black Skinny',
    'Blue High Rise Clean Look',
    'Rise Light Blue',
    'Fit High Rise Jeans',
    'Jeans Blue Available In Stock',
    'Jeans With White Top',
    'Black Plazo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Bottoms',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 300.0,
                  child: Image.asset(
                    imagePaths[index],
                    width: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  texts[index],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ShirtsPage extends StatelessWidget {
  final List<String> imagePaths = [
    'lib/icons/s1.jpeg',
    'lib/icons/s2.png',
    'lib/icons/s3.png',
    'lib/icons/s4.jpeg',
    'lib/icons/s5.png',
    'lib/icons/s6.png',
    'lib/icons/s7.png',
  ];
  final List<String> texts = [
    'Blue Dress Shirt',
    'Black Shirt',
    'Classic Blue Shirt',
    'Different Shades of Shirts',
    'Fancy Shirt',
    'Blue And White Check Shirt',
    'White T shirt',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Shirts',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 300.0,
                  child: Image.asset(
                    imagePaths[index],
                    width: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  texts[index],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ShoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Shoes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class HeelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Heels',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class AccessoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Accessories',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class TopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Tops',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
