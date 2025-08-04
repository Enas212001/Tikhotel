import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/topic_cubit/topic_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

class TopicsDropDown extends StatelessWidget {
  const TopicsDropDown({super.key, this.value, this.onChanged});

  final TopicItem? value;
  final ValueChanged<TopicItem?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopicCubit()..getTopics(),
      child: BlocBuilder<TopicCubit, TopicState>(
        builder: (context, state) {
          if (state is TopicFetched) {
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: DropdownButtonFormField<TopicItem>(
                value: value,
                style: TextStyles.text12LightGrey,
                decoration: InputDecoration(
                  labelText: S.of(context).problem,
                  border: borderTextField(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyles.text14RegularGrey,
                ),
                items: state.topics
                    .map(
                      (topic) => DropdownMenuItem<TopicItem>(
                        value: topic,
                        child: Text(topic.topic ?? ''),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
                validator: (value) => value == null
                    ? S.of(context).pleaseSelect(S.of(context).topic)
                    : null,
              ),
            );
          } else if (state is TopicFetchingError) {
            return Center(child: Text(state.error));
          } else if (state is TopicFetching) {
            return ShimmerCard(height: 40.h);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
