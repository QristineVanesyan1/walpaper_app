import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:affirmation_utility/components/app_bar_widget.dart';
import 'package:affirmation_utility/configs/app_colors.dart';
import 'package:affirmation_utility/configs/app_texts.dart';

class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({super.key});

  @override
  State<TermsOfUseScreen> createState() => _TermsOfUseScreenState();
}

class _TermsOfUseScreenState extends State<TermsOfUseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Column(
            children: [
              AppBarWidget(
                title: AppTexts.termOfUse,
                onLeading: () {
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis erat ut risus gravida consequat nec et elit. Donec at facilisis diam. Nulla ut vehicula est. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed sit amet tincidunt tortor. Etiam ut faucibus nisi. Donec suscipit vel sem vitae maximus. In a porttitor dui. Mauris condimentum augue nec risus efficitur ullamcorper. Nulla purus dui, aliquam non tortor ac, vestibulum aliquet est. Proin sit amet tortor nisi. Donec in vestibulum tortor. Vestibulum sodales accumsan euismod. Nulla bibendum ipsum arcu, vitae egestas nulla blandit sed.',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: AppColors.textPrimary, height: 1.3),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis erat ut risus gravida consequat nec et elit. Donec at facilisis diam. Nulla ut vehicula est. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed sit amet tincidunt tortor. Etiam ut faucibus nisi. Donec suscipit vel sem vitae maximus. In a porttitor dui. Mauris condimentum augue nec risus efficitur ullamcorper. Nulla purus dui, aliquam non tortor ac, vestibulum aliquet est. Proin sit amet tortor nisi. Donec in vestibulum tortor. Vestibulum sodales accumsan euismod. Nulla bibendum ipsum arcu, vitae egestas nulla blandit sed.',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: AppColors.textPrimary, height: 1.3),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis erat ut risus gravida consequat nec et elit. Donec at facilisis diam. Nulla ut vehicula est. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed sit amet tincidunt tortor. Etiam ut faucibus nisi. Donec suscipit vel sem vitae maximus. In a porttitor dui. Mauris condimentum augue nec risus efficitur ullamcorper. Nulla purus dui, aliquam non tortor ac, vestibulum aliquet est. Proin sit amet tortor nisi. Donec in vestibulum tortor. Vestibulum sodales accumsan euismod. Nulla bibendum ipsum arcu, vitae egestas nulla blandit sed.',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: AppColors.textPrimary, height: 1.3),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis erat ut risus gravida consequat nec et elit. Donec at facilisis diam. Nulla ut vehicula est. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed sit amet tincidunt tortor. Etiam ut faucibus nisi. Donec suscipit vel sem vitae maximus. In a porttitor dui. Mauris condimentum augue nec risus efficitur ullamcorper. Nulla purus dui, aliquam non tortor ac, vestibulum aliquet est. Proin sit amet tortor nisi. Donec in vestibulum tortor. Vestibulum sodales accumsan euismod. Nulla bibendum ipsum arcu, vitae egestas nulla blandit sed.',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: AppColors.textPrimary, height: 1.3),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
