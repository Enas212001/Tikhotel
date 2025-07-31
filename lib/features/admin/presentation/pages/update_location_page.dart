import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/location_cubit/location_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'widgets/update_location_body.dart';

class UpdateLocationPage extends StatelessWidget {
  const UpdateLocationPage({super.key, required this.location});
  final LocationItem location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LocationCubit(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text: S.of(context).updateLocation),
              UpdateLocationBody(location: location),
            ],
          ),
        ),
      ),
    );
  }
}
