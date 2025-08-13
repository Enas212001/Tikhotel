import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/border_text_field.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/core/utils/widgets/shimmer_loading.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/location_cubit/location_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

class LocationDropDown extends StatelessWidget {
  const LocationDropDown({super.key, this.value, this.onChanged});

  final LocationItem? value;
  final ValueChanged<LocationItem?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit()..getAllLocations(),
      child: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is AllLocationsLoaded) {
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: DropdownButtonFormField<LocationItem>(
                value: value,
                style: TextStyles.text12LightGrey,
                decoration: InputDecoration(
                  labelText: S.of(context).location,
                  border: borderTextField(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyles.text14RegularGrey,
                ),
                items: state.locations.data!
                    .map(
                      (location) => DropdownMenuItem<LocationItem>(
                        value: location,
                        child: Text(location.location ?? ''),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
                validator: (value) => value == null
                    ? S.of(context).pleaseSelect(S.of(context).location)
                    : null,
              ),
            );
          } else if (state is AllLocationsLoadingError) {
            return Center(child: Text(state.message));
          } else if (state is AllLocationsLoading) {
            return ShimmerCard(height: 40.h);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
