import 'package:flutter/material.dart';
import 'package:specxsol/features/authentication/login_screen.dart';
import 'package:specxsol/features/products/product_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:specxsol/features/cart/cart_controller.dart';
import 'package:specxsol/features/cart/cart_screen.dart';
import 'package:specxsol/features/info/faqs_screen.dart';
import 'package:specxsol/features/info/profile_screen.dart';
import 'package:specxsol/features/info/orders_screen.dart';
import 'package:specxsol/features/info/settings_screen.dart';
import 'package:specxsol/features/info/reglaze_your_glasses_screen.dart';
import 'package:specxsol/features/info/terms_of_service_screen.dart';
import 'package:specxsol/features/info/privacy_policy_screen.dart';
import 'package:specxsol/features/info/refund_policy_screen.dart';
import 'package:specxsol/features/info/shipping_policy_screen.dart';
import 'package:specxsol/features/info/book_appointment_screen.dart';
import 'package:specxsol/features/authentication/auth_controller.dart';
import 'package:specxsol/features/products/product.dart';
import 'package:specxsol/features/products/product_detail_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartController()),
        ChangeNotifierProvider(create: (context) => AuthController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Specxsol App',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF007BFF, // Blue color from the website
          <int, Color>{
            50: Color(0xFFE0F2FF),
            100: Color(0xFFB3DAFF),
            200: Color(0xFF80C2FF),
            300: Color(0xFF4DB0FF),
            400: Color(0xFF269DFF),
            500: Color(0xFF007BFF),
            600: Color(0xFF006ACB),
            700: Color(0xFF0058B6),
            800: Color(0xFF0045A1),
            900: Color(0xFF00227D),
          },
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF007BFF), // Use primary color for app bar
          foregroundColor: Colors.white, // White text/icons on app bar
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.amber[800], // Match existing selected color
          unselectedItemColor: Colors.grey, // Match existing unselected color
          backgroundColor: Colors.white, // White background for bottom navigation
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    GlassesScreen(),
    MoreInfoScreen(),
    AboutScreen(),
    ContactScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specxsol'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.visibility),
            label: 'Glasses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'More Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Product> newArrivals = [
    Product(
      id: '1',
      name: 'Arhlo ARH039 Eyeglasses',
      imageUrl: 'https://specxsol.com/cdn/shop/files/ArhloARH039Eyeglasses_720x.png',
      regularPrice: 59.99,
      isFrameOnly: true,
      brand: 'Arhlo',
      type: 'Eyeglasses',
    ),
    Product(
      id: '2',
      name: 'Arhlo ARH038 Eyeglasses',
      imageUrl: 'https://specxsol.com/cdn/shop/files/ArhloARH038Eyeglasses_720x.png',
      regularPrice: 59.99,
      isFrameOnly: true,
      brand: 'Arhlo',
      type: 'Eyeglasses',
    ),
  ];

  final List<Product> featuredProducts = [
    Product(
      id: '5',
      name: 'Ray-Ban Meta RW4008 601ST3 Wayfarer Sunglasses',
      imageUrl: 'https://specxsol.com/cdn/shop/products/RB4008_601ST3_50_720x.jpg',
      regularPrice: 260.00,
      isFrameOnly: true,
      brand: 'Ray-Ban',
      type: 'Sunglasses',
    ),
    Product(
      id: '6',
      name: 'Emporio Armani EA1027',
      imageUrl: 'https://specxsol.com/cdn/shop/products/EA10273001_1_720x.jpg',
      regularPrice: 99.00,
      isFrameOnly: true,
      brand: 'Emporio Armani',
      type: 'Glasses',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Arrivals',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newArrivals.length,
                  itemBuilder: (context, index) {
                    final product = newArrivals[index];
                    return ProductCard(product: product);
                  },
                ),
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Featured Products',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 200, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredProducts.length,
                  itemBuilder: (context, index) {
                    final product = featuredProducts[index];
                    return ProductCard(product: product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        child: Consumer<CartController>(
          builder: (context, cart, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.shopping_cart),
                if (cart.itemCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        cart.itemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              height: 100,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text('£${product.regularPrice.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

class GlassesScreen extends StatelessWidget {
  const GlassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Glasses Screen Content'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListScreen()),
              );
            },
            child: const Text('View Products'),
          ),
        ],
      ),
    );
  }
}

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'More Info',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: const Text('FAQs'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FAQsScreen()));
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersScreen()));
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
              },
            ),
            ListTile(
              title: const Text('Reglaze Your Glasses'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReglazeYourGlassesScreen()));
              },
            ),
            const Divider(),
            const Text(
              'Our Policies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: const Text('Terms of Service'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsOfServiceScreen()));
              },
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
              },
            ),
            ListTile(
              title: const Text('Refund Policy'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RefundPolicyScreen()));
              },
            ),
            ListTile(
              title: const Text('Shipping Policy'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ShippingPolicyScreen()));
              },
            ),
            const Divider(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BookAppointmentScreen()),
                  );
                },
                child: const Text('Book an Appointment'),
              ),
            ),
            const SizedBox(height: 20),
            Consumer<AuthController>(
              builder: (context, auth, child) {
                if (!auth.isLoggedIn) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text('Login / Register'),
                    ),
                  );
                } else {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        auth.logout();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logged out successfully!')),
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'About Specxsol',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text(
            'At Specxsol, we bring expert eye care directly to your doorstep. Whether you need a new pair of glasses, an updated prescription, or simply professional advice, our mobile optician service ensures you get personalised care at your convenience.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('+44 7825 210325'),
            onTap: () {
              // Implement call functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('info@specxsol.com'),
            onTap: () {
              // Implement email functionality
            },
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Follow Us',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.facebook), // Placeholder for Facebook icon
                onPressed: () {
                  // Open Facebook page
                },
              ),
              IconButton(
                icon: Icon(Icons.camera_alt), // Placeholder for Instagram icon
                onPressed: () {
                  // Open Instagram page
                },
              ),
              // Add TikTok icon if available in Flutter Icons or custom asset
            ],
          ),
        ],
      ),
    );
  }
}
