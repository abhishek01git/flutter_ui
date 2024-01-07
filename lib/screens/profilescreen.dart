import 'package:flutter/material.dart';
import 'package:teachersapp/modalclasses/user_model.dart';

enum GenderOptions {
  male,
  female,
}

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController FnameController = TextEditingController();
  TextEditingController LnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GenderOptions? gender = GenderOptions.male;
  UserFields? userFields;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple.shade200,
      drawer: Drawer(
        backgroundColor: Colors.deepPurple.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                ),
                child: const CircleAvatar(backgroundColor: Colors.indigoAccent),
              ),
              ListTile(
                title: const Text('user details',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                trailing: const Icon(Icons.supervised_user_circle_outlined),
                tileColor: Colors.deepPurple.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0), // Adjust the border radius as needed
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  'Home',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                trailing: const Icon(Icons.home_filled),
                tileColor: Colors.deepPurple.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0), // Adjust the border radius as needed
                ),
                onTap: () {
                  // Add your functionality for Option 2
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  'Food',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                trailing: const Icon(Icons.restaurant),
                tileColor: Colors.deepPurple.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0), // Adjust the border radius as needed
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'First Name: ${userFields?.Fname} ',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Last Name: ${userFields?.Lname}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Age: ${userFields?.age}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Email: ${userFields?.email}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'PhoneNumber: ${userFields?.phone}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Gender: ${userFields?.gender.toString()}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          onPressed: () {
            showBottomScreen(context);
          },
          backgroundColor: Colors.deepPurple.shade400,
          child: const Icon(Icons.restaurant),
        ),
      ),
    );
  }

  void showBottomScreen(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: FnameController,
                      decoration: InputDecoration(
                        hintText: "Enter Your First Name",
                        icon: const Icon(Icons.drive_file_rename_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your FirstName";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: LnameController,
                      decoration: InputDecoration(
                        hintText: "Enter Your Last Name",
                        icon: const Icon(Icons.drive_file_rename_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your LastName";
                        }
                        return null;
                      },
                    ),
                    RadioListTile(
                      value: GenderOptions.male,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      title: const Text("male"),
                    ),
                    RadioListTile(
                      value: GenderOptions.female,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      title: const Text("female"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Enter Your  age",
                          icon: const Icon(Icons.numbers),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your Age";
                        } else if (value.length > 100) {
                          return "Age Maximum at 48";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter Your email",
                          icon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          hintText: "Enter Your phone",
                          icon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your PhoneNumber";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        minimumSize: const MaterialStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.deepPurple.shade300),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                           UserFields(
                              Fname: FnameController.text,
                              Lname: LnameController.text,
                              age: int.parse(ageController.text),
                              email: emailController.text,
                              phone: phoneController.text,
                              gender: gender.toString(),
                            );
                          });
                          Navigator.pop(context);
                          FnameController.clear();
                          LnameController.clear();
                          ageController.clear();
                          emailController.clear();
                          phoneController.clear();
                        }
                      },
                      child: const Text(
                        "submit",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
