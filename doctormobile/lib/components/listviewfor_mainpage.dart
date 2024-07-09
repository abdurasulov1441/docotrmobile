import 'package:doctormobile/style/app_style.dart';
import 'package:flutter/material.dart';

class ListViewForNews extends StatelessWidget {
  const ListViewForNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              // title: item.buildTitle(context),
              // subtitle: item.buildSubtitle(context),
              title: const Text(
                'name[index]',
                style: AppStyle.fontStyle,
              ),
              subtitle: const Text(
                'secondName[index]',
                style: AppStyle.fontStyle,
              ),
              onTap: () {},
              //leading: Image.asset(images[index],width: 50,height: 50,),
              textColor: Colors.white,
              trailing: const Icon(
                Icons.play_arrow,
                color: Colors.black,
                weight: 20,
              ),
            );
          },
        ),
      ),
    );
  }
}
