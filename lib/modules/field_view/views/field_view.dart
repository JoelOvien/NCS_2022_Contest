import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_irrigation/modules/field_view/domains/providers/field_view_provider.dart';
import 'package:smart_irrigation/modules/field_view/views/field_view_offline.dart';
import 'package:smart_irrigation/modules/field_view/views/field_view_online.dart';

class FieldViewRouterPage extends ConsumerWidget {
  static const String routeName = '/field_view_router_page';
  const FieldViewRouterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldViewController = ref.watch(fieldViewProvider);
    if (fieldViewController.cameraOnline) {
      return const FieldViewOnline();
    } else {
      return const FieldViewOffline();
    }
  }
}
