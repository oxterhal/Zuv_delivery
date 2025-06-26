import 'package:intl/intl.dart';

/// Utility functions for handling delivery date formatting
class DeliveryDateUtils {
  /// Converts ISO timestamp to readable format (yyyy-MM-dd HH:mm:ss)
  static String convertISOToReadable(String isoTimestamp) {
    try {
      // Parse the ISO timestamp
      final DateTime parsedDate = DateTime.parse(isoTimestamp);

      // Format to readable date and time
      final DateFormat outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      return outputFormat.format(parsedDate);
    } catch (e) {
      return isoTimestamp; // Return original if parsing fails
    }
  }

  /// Converts ISO timestamp to readable format with local timezone
  static String convertISOToReadableWithTimezone(String isoTimestamp) {
    try {
      final DateTime parsedDate = DateTime.parse(isoTimestamp);

      // Convert to local timezone
      final DateTime localDate = parsedDate.toLocal();

      // Format to readable date and time
      final DateFormat outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      return outputFormat.format(localDate);
    } catch (e) {
      return isoTimestamp;
    }
  }

  /// Formats created_at timestamp with different handling for ISO vs date-only formats
  static String formatCreatedAt(String createdAt) {
    try {
      if (createdAt.contains('T')) {
        final DateTime parsedDate = DateTime.parse(createdAt);
        final DateFormat outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
        return outputFormat.format(parsedDate);
      } else {
        final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
        final DateFormat outputFormat = DateFormat('dd-MM-yyyy');
        final DateTime parsedDate = inputFormat.parse(createdAt);
        return outputFormat.format(parsedDate);
      }
    } catch (e) {
      return createdAt;
    }
  }
}
