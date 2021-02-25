import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  BillSplitter({Key key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.shade100.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total per person",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.purple,
                          fontSize: 18.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid)),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purpleAccent.shade100
                                    .withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.purpleAccent.shade100
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //Tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                  //Slider

                  Column(
                    children: [
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.purple,
                          inactiveColor: Colors.grey,
                          divisions: 10, //optional
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercentage = value.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  Wisdom({Key key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;

  List quotes = [
    "Life is hard but don't be scared",
    "You are a champion not a monkey",
    "Tomorrow will be the another day and another opportunity",
    "Don't worry too much about tomorrow",
    "Life sucks? But not for you buddy!"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.5),
                  ),
                  child: Center(
                    child: Text(
                      quotes[_index % quotes.length],
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 3.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FlatButton.icon(
                    onPressed: _showQuote,
                    color: Colors.pinkAccent.shade200,
                    icon: Icon(Icons.wb_sunny),
                    label: Text(
                      "Inspire me",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.8,
                      ),
                    )),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    ));
  }

  void _showQuote() {
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BizCard'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [_getCard(), _getAvatar()],
          ),
        ));
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 250,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Kunal Wadhwani",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Text(
            "Entreprenue",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline),
              Text("twitter: @kkwadhwani")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width: 1.5),
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/id/237/230/300"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("Tapped Button is an Alarm");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My New App'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: [
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("Email Tapped")),
          IconButton(icon: Icon(Icons.alarm), onPressed: _tapButton)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint("Tapped"),
          backgroundColor: Colors.amberAccent,
          child: Icon(Icons.call_missed)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('First'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            title: Text('Second'),
          ),
        ],
        onTap: (int index) => debugPrint('Tappes NO: $index'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton()
            // InkWell(
            //   child: Text(
            //     'Tap me',
            //     style: TextStyle(fontSize: 25),
            //   ),
            //   onTap: () => debugPrint('Tapped here......'),
            // )
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue.shade200,
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackbar = SnackBar(content: Text('Hello Welcome'));

        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('Button'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.deepOrange,
        child: Center(
          child: Text(
            "Hello WOrld",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 50.0,
                fontStyle: FontStyle.italic),
          ),
        ));
  }
}
