import 'package:flutter/material.dart';

class AssignmentDescriptionPage extends StatelessWidget {
  const AssignmentDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/login.jpg'),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Assignment Description :',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        height: 4,
                      ),
                ),
                Text(
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'dfghjkl;fgchvjbknlm'
                    'vhjbnkmlcghvjbn'
                    'vhbjnkcfghvjbnkm'
                    'ghvjbknlfgchvjbknlm'
                    'fcghvjbknhgcfhvjbknlm;,'
                    'xfgchvjbknhgfxgchvjbknl',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
