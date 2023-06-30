import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';

class ContentWidget extends StatelessWidget {
  /// TODO add your comment here
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class ImagePickerWidget extends StatelessWidget {
  final void Function(PlatformFile? file) onTap;
  final Widget child;

  const ImagePickerWidget({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await FilePickerWeb.platform.pickFiles();
        if (result != null) {
          final data = result.files.first;
          onTap(data);
        } else {
          onTap.call(null);
        }
      },
      child: child,
    );
  }
}
