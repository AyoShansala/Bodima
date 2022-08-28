import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("10,000LKR",
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 12,
              ),
              Text("January 2023",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 70, 70, 70))),
              SizedBox(
                height: 25,
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      //side: BorderSide(width: 2, color: Colors.black),
                      primary: Color.fromARGB(255, 207, 233, 255),
                      elevation: 0, // background
                      onPrimary: Color.fromARGB(255, 26, 88, 139),
                      padding: EdgeInsets.all(25) // foreground
                      ),
                  onPressed: () async {
                    // final result = await FilePicker.platform.pickFiles();
                    // if (result == null) return;

                    // final file = result.files.first;
                    // openFile(file);
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.upload_file,
                          size: 30,
                          color: Color.fromARGB(255, 26, 88, 139),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Click here attach your SLIP',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text("Your Message (Optional)")),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 400,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      /*prefixIcon: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.type_specimen,
                              size: 20.0, color: Colors.black),
                        ),*/
                      //labelText: "Your Message",
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      hintText: "Your Message",
                      hintStyle: TextStyle(color: Colors.white30),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(new Radius.circular(5.0))),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                  primary: Color.fromARGB(255, 11, 65, 87), // background
                  onPrimary: Color.fromARGB(255, 243, 250, 255), // foreground
                ),
                onPressed: () {},
                child: Text(
                  'SUBMIT',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
