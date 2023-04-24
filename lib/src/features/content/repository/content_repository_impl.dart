import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'content_repository.dart';

class ContentRepositoryImpl extends ContentRepository {
  // TODO add your methods here
}

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepositoryImpl();
});
