import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:ticker/util/date_helper.dart';

void main() {
  group('DateHelper', () {
    test('Test the output format', () {
      // Arrange
      final dateHelper = DateHelper();
      final String expectedDate = DateFormat('d MMMM').format(DateTime.now());

      final String actualDate = dateHelper.getTodayDate();

      expect(actualDate, expectedDate);
    });
  });
}
