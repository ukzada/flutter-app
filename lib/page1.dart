  import 'package:flutter/material.dart';
  import 'profile.dart';  // Import your ProfilePage here

  // Main widget representing the first page of the app
  class Page1 extends StatefulWidget {
    @override
    _Page1State createState() => _Page1State();
  }

  class _Page1State extends State<Page1> {
    int _currentIndex = 0;

    final List<Widget> _pages = [
      Page1Content(),   // Content of Page 1
      SearchPage(),     // Define your SearchPage
      TicketsPage(),    // Define your TicketsPage
      ProfilePage(),    // Profile Page
    ];

    void _onTap(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: _currentIndex == 0 // Only show the AppBar on the first page
            ? AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            '         Securely Book    \n            Your Flight',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ), // Set text color to white
          ),
          actions: [

            IconButton(
              icon: Icon(Icons.notifications, color: Colors.grey), // Bell icon in grey color
              onPressed: () {
                // Handle bell icon press, e.g., navigate to notifications page
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Notifications"),
                    content: Text("You have no new notifications."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        )
            : null, // No AppBar for other pages
        body: _pages[_currentIndex], // Display the current page content
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[100], // Very light grey background
          selectedItemColor: Colors.grey[800], // Dark grey color for selected item
          unselectedItemColor: Colors.grey[600], // Dark grey color for unselected items
          currentIndex: _currentIndex, // Keeps track of the current tab
          onTap: _onTap, // Calls _onTap when a tab is selected
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number), // Ticket icon
              label: 'Tickets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      );
    }
  }

  // Separate the content of Page 1 into its own widget
  class Page1Content extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Stack(
        children: [
          // Background Container covering half of the page
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.blue[900], // Background color for half the page
          ),
          // Main content on top of the background
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Greeting section for the user
                  UserGreeting(),
                  SizedBox(height: 20),
                  // Form for searching flights
                  FlightSearchForm(),
                  SizedBox(height: 20),
                  // Section displaying upcoming flights
                  UpcomingFlights(),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  // Placeholder for SearchPage
  class SearchPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Center(
        child: Text("This is the Search Page"),
      );
    }
  }

  // Placeholder for TicketsPage
  class TicketsPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Center(
        child: Text("This is the Tickets Page"),
      );
    }
  }






  // Widget displaying a greeting to the user
  class UserGreeting extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Row(
        children: [
          // Clickable avatar image of the user
          GestureDetector(
            onTap: () {
              // Navigate to the profile page when the image is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()), // Replace with your ProfilePage class
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/me.jpeg'),
              radius: 15, // Adjust the size of the avatar as needed
            ),
          ),
          SizedBox(width: 5),
          // Greeting text and user's name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning',
                style: TextStyle(color: Colors.grey[900], fontSize: 18),
              ),
              Text(
                'Usman Khan',
                style: TextStyle(color: Colors.grey[900], fontSize: 18),
              ),
            ],
          ),
        ],
      );
    }
  }
  class FlightSearchForm extends StatefulWidget {
    @override
    _FlightSearchFormState createState() => _FlightSearchFormState();
  }
  
  class _FlightSearchFormState extends State<FlightSearchForm> {
    int numberOfTravelers = 1; // Initial number of travelers
  
    void incrementTravelers() {
      setState(() {
        numberOfTravelers++;
      });
    }
  
    void decrementTravelers() {
      setState(() {
        if (numberOfTravelers > 1) {
          numberOfTravelers--;
        }
      });
    }
  
    @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            // Departure and Destination locations input in parallel
            Row(
              children: [
                // Departure location input
                Expanded(
                  child: Container(
                    height: 60.0, // Set a fixed height
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.flight_takeoff),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text('From United States of America'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Destination location input
                Expanded(
                  child: Container(
                    height: 60.0, // Set a fixed height
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.flight_land),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text('To United Arab Emirates'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Departure date input
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text('Departure: 18 December 2024'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Return date input
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text('Return: 25 December 2024'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Number of travelers input with increment and decrement buttons
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text('Travelers: $numberOfTravelers Person${numberOfTravelers > 1 ? 's' : ''}'),
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: decrementTravelers,
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: incrementTravelers,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Button to start the flight search process
            ElevatedButton(
              onPressed: () {
                // Implement your search functionality here
              },
              child: Text('Get started'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                textStyle: TextStyle(fontSize: 18),
  
              ),
            ),
          ],
        ),
      );
    }
  }
  
  class UpcomingFlights extends StatelessWidget {
    // List of upcoming flights with airline name and price
    List<Map<String, String>> flights = [
      {'airline': 'Indigo Airlines', 'price': '\$550'},
      {'airline': 'PIA', 'price': '\$550'},
      {'airline': 'Qatar Airways', 'price': '\$550'},
    ];
  
    @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header for the upcoming flights section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Flights',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Handle "See all" button press
                  },
                  child: Text('See all'),
                ),
              ],
            ),
            SizedBox(height: 10),
            // List of upcoming flights
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: flights.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(flights[index]['airline']!),
                    trailing: Text(flights[index]['price']!),
                    onTap: () {
                      // Handle tap on the flight item
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(flights[index]['airline']!),
                            content: Text('Price: ${flights[index]['price']}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      );
    }
  }
