import 'package:flutter/material.dart';
import 'package:suzanne_app/screens/home/home_screen.dart';
import 'package:suzanne_app/utilis/helpers/helper_functions.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    labelText: "First Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    labelText: "Last Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_circle_outlined),
              labelText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone),
              labelText: "Phone",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Password Field
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // Remember Me & Forgot Password
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              //Text("I agree to Privacy Policy and Terms of use"),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "I agree to ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "Privacy Policy",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: dark ? Colors.white : Colors.blue)),
                TextSpan(
                    text: " and ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: "Terms of use",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: dark ? Colors.white : Colors.blue)),
              ]))
            ],
          ),
          const SizedBox(height: 20.0),

          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // Create Account Button
        ],
      ),
    );
  }
}
