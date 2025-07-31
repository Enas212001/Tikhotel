import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/app/guest_drawer.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/widgets/custom_app_bar.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/message_text_field.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/replay_message.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ViewGuestRequestPage extends StatelessWidget {
  const ViewGuestRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GuestDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(text: S.of(context).viewRequest),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: containerDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomRequestTextField(
                          label: S.of(context).requestId,
                          value: '1324434',
                        ),
                        CustomRequestTextField(
                          label: S.of(context).startTime,
                          value: '7-7-2025',
                          isDate: true,
                        ),
                        CustomRequestTextField(
                          label: S.of(context).by,
                          value: 'Aboselosod',
                        ),
                        MessageTextField(
                          value: '',
                          label: S.of(context).message,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ReplayMessage(isGuest: true),
          ],
        ),
      ),
    );
  }
}
