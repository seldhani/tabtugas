import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _selectTab(int index) {
    _tabController.animateTo(index);
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Icon(Icons.school, size: 40, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'SMK Negeri 4 Bogor',
                style: GoogleFonts.texturina(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.white),
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[300],
          tabs: [
            Tab(icon: Icon(Icons.support_agent), text: 'Profile'),
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.person), text: 'Data Warna'),
            Tab(icon: Icon(Icons.info), text: 'About'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.deepPurpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Icon(Icons.school, size: 100, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'SMK Negeri 4 Bogor',
                    style: GoogleFonts.texturina(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.support_agent),
              title: Text('Profile'),
              onTap: () => _selectTab(0),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => _selectTab(1),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Data Warna'),
              onTap: () => _selectTab(2),
            ),
            
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () => _selectTab(3),
            ),
            
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SupportAgentTab(),
          DataTab(),
          AboutTab(),
          EmptyAboutTab(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class SupportAgentTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Background color untuk Scaffold
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CircleAvatar dengan border dan shadow
              CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage(
                  'https://i.ibb.co.com/SQqDY76/Whats-App-Image-2024-07-25-at-08-26-58-24d33702.jpg',
                ),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 20),
              // Card dengan gradient
              Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey[100]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selma Ramadhani',
                          style: GoogleFonts.bevan(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lahir di Bogor pada 30 September 2006, kini di usia nya yang ke-17, Selma sedang menjalankan tahun ketiga-nya sekolah di SMK Negeri 4 Bogor.',
                          style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyAboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background decoration
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Positioned decorative elements
          Positioned(
            top: -50,
            right: -50,
            child: Opacity(
              opacity: 0.7,
              child: Icon(
                Icons.star,
                size: 150,
                color: Colors.orange,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Opacity(
              opacity: 0.7,
              child: Icon(
                Icons.star,
                size: 150,
                color: Colors.orange,
              ),
            ),
          ),
          // Centered card with information
          Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.grey[200]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 60,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Project ini merupakan bagian dari tugas kejuruan yang diperiksa pada tanggal 21 Agustus 2024',
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    // Optional button or additional content
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class DataTab extends StatelessWidget {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(
        'https://satudata.mubakab.go.id/api/Assets/Files/Appl/File/opd_10106/survey-pendataan-bansos-melalui-aplikasi-muba-survei-tahun-2021.geojson'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['features'];
      return data.map((user) => User.fromJson(user['properties'])).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Alamat Penerimaan Bansos',
          style: GoogleFonts.rasa(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4.0, // Memberikan shadow pada card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Membuat card dengan sudut melengkung
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.blueAccent, // Memberikan warna pada ikon
                        size: 30, // Ukuran ikon
                      ),
                      title: Text(
                        user.Alamat,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 18, // Mengatur ukuran font
                        ),
                      ),
                      subtitle: Text(
                        user.Kabupaten,
                        style: TextStyle(
                          color: Colors.black54, // Warna subtitle
                          fontSize: 15, // Mengatur ukuran font
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}


class AboutTab extends StatelessWidget {
  Future<List<About>> fetchAbout() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/unknown'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((about) => About.fromJson(about)).toList();
    } else {
      throw Exception('Failed to load about info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Warna Rumah',
          style: GoogleFonts.rasa(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<List<About>>(
        future: fetchAbout(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            final aboutList = snapshot.data!;
            return ListView.builder(
              itemCount: aboutList.length,
              itemBuilder: (context, index) {
                final about = aboutList[index];
                // Mengonversi warna dari string menjadi Color
                Color cardColor;
                try {
                  cardColor =
                      Color(int.parse(about.color.replaceFirst('#', '0xFF')));
                } catch (e) {
                  cardColor = Colors.grey; // Warna default jika parsing gagal
                }
                return Card(
                  margin: EdgeInsets.all(8.0),
                  color: cardColor, // Mengatur warna latar belakang Card
                  child: ListTile(
                    title: Text(
                      about.name,
                      style: TextStyle(
                          color: Colors
                              .white), // Mengatur warna teks agar kontras dengan background
                    ),
                    subtitle: Text(
                      about.color,
                      style: TextStyle(
                          color: Colors
                              .white), // Mengatur warna teks agar kontras dengan background
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class User {
  final String Alamat;
  final String Kabupaten;

  User({required this.Alamat, required this.Kabupaten});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      Alamat: json['Alamat'] ?? 'No Address',
      Kabupaten: json['Kabupaten'] ?? 'No Region',
    );
  }
}

class About {
  final String name;
  final String color;

  About({required this.name, required this.color});

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      name: json['name'] ?? 'No Name',
      color: json['color'] ?? 'No Color',
    );
  }
}
