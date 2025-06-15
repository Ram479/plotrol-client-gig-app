import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/response/autentication_response/autentication_response.dart';
import '../model/response/book_service/pgr_create_response.dart';
import '../model/response/common_models.dart';

class IdGen {
  static const IdGen _instance = IdGen._internal();

  static IdGen get instance => _instance;

  /// Shorthand for [instance]
  static IdGen get i => instance;

  final Uuid uuid;

  const IdGen._internal() : uuid = const Uuid();

  /// Generates a version 1 UUID and returns it as a string.
  String get identifier => uuid.v1();

  }

  class AppUtils {

    int millisecondsSinceEpoch([DateTime? dateTime]) {
      return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
    }

    bool checkIsPGRAdmin(List<Role> roles){
      return roles.any((role) => role.code == 'PGR-ADMIN' || role.code == 'PGR_ADMIN');
    }

    bool checkIsHousehold(List<Role> roles){
      final hasDistributor = roles.any((role) => role.code == 'DISTRIBUTOR');
      final hasPgrAdmin = roles.any((role) => role.code == 'PGR-ADMIN' || role.code == 'PGR_ADMIN');

      return hasDistributor && !hasPgrAdmin;
    }


    bool checkIsGig(List<Role> roles){
      final hasDistributor = roles.any((role) => role.code == 'DISTRIBUTOR');
      final hasHelpDeskUser = roles.any((role) => role.code == 'HELPDESK_USER');

      return hasHelpDeskUser && !hasDistributor;
    }

    static String timeStampToDate(int? timeInMillis, {String? format}) {
      if (timeInMillis == null) return '';
      try {
        DateTime date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);

        return DateFormat(format ?? 'dd/MM/yyyy').format(date);
      } catch (e) {
        return e.toString();
      }
    }

    String getOrderStatus(ServiceWrapper order) {
      switch (order.workflow?.action) {
        case 'CREATE':
          return 'created';
        case 'ASSIGN':
          return 'accepted';
        case 'RESOLVE':
          return 'completed';
        default:
          return 'unknown';
      }
    }

    static DayRange getDayStartAndEnd([DateTime? date]) {
      final localDate = (date ?? DateTime.now()).toLocal();

      final startOfDay = DateTime(localDate.year, localDate.month, localDate.day);
      final endOfDay = DateTime(localDate.year, localDate.month, localDate.day, 23, 59, 59);

      return DayRange(
        startMillis: startOfDay.millisecondsSinceEpoch,
        endMillis: endOfDay.millisecondsSinceEpoch,
      );
    }

    String formatAddress(Address? address) {
      if (address == null) return '';

      final parts = <String>[];

      if(address.buildingName != null && (address.buildingName ?? "").isNotEmpty){
        parts.add(address.buildingName!);
      }

      if (address.landmark != null && (address.landmark ?? "").isNotEmpty) {
        parts.add('${address.landmark!}');
      }

      if(address.street != null && (address.street ?? "").isNotEmpty){
        parts.add(address.street!);
      }

      if (address.addressLine1 != null && (address.addressLine1 ?? "").isNotEmpty) {
        parts.add('${address.addressLine1!}${address.addressLine2 ?? ""}');
      }
      if (address.doorNo != null && (address.doorNo ?? "").isNotEmpty) {
        parts.add(address.doorNo!);
      }
      if (address.city != null && (address.city ?? "").isNotEmpty) {
        parts.add(address.city!);
      }

      return parts.join(', ');
    }


    Future<void> openMap(double latitude, double longitude) async {
      final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      final Uri uri = Uri.parse(googleMapsUrl);

      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // <- IMPORTANT
      )) {
        throw 'Could not open the map.';
      }
    }


    Address parseAddressFromText(String fullAddress, {int chunkSize = 6}) {
      final words = fullAddress.trim().split(RegExp(r'\s+'));

      String? getChunk(int start) {
        if (start >= words.length) return null;
        final end = (start + chunkSize < words.length) ? start + chunkSize : words.length;
        return words.sublist(start, end).join(' ');
      }

      return Address(
        addressLine1: getChunk(0),
        addressLine2: getChunk(chunkSize),
        street: getChunk(chunkSize * 2),
      );
    }


  }

class DayRange {
  final int startMillis;
  final int endMillis;

  DayRange({
    required this.startMillis,
    required this.endMillis,
  });
}
