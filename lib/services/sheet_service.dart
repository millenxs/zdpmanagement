import 'package:gsheets/gsheets.dart';
import 'package:contador_app/models/publication.dart';

class SheetService {
  final _credentials =
      r'''<SUA_CREDENCIAL_AQUI>'''; // Copie isso do seu arquivo JSON
  final _spreadsheetId = '1ccr56OS8PO3SrpJfq7fXCCBtbmkha0xKShDnt1lVk7o';

  late GSheets _gsheets;
  late Spreadsheet _spreadsheet;

  SheetService() {
    _gsheets = GSheets(_credentials);
  }

  Future<void> init() async {
    _spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
  }

  Future<List<Publication>> getPublications() async {
    final sheet = _spreadsheet.worksheetByTitle('Folha1');

    if (sheet == null) return [];

    final rows = await sheet.values.map.allRows();
    if (rows == null) return [];

    final publications = <Publication>[];

    for (var row in rows) {
      if (row['Brand'] == null || row['Posts'] == null) continue;

      publications.add(
        Publication(
          brand: row['Brand']!,
          link: row['Posts']!,
          previousLikes: int.tryParse(row['Previous Likes'] ?? '0') ?? 0,
          currentLikes: int.tryParse(row['Current Likes'] ?? '0') ?? 0,
          previousComments: int.tryParse(row['Previous Comments'] ?? '0') ?? 0,
          currentComments: int.tryParse(row['Current Comments'] ?? '0') ?? 0,
          previousFollowers:
              int.tryParse(row['Previous Followers'] ?? '0') ?? 0,
          currentFollowers: int.tryParse(row['Current Followers'] ?? '0') ?? 0,
        ),
      );
    }

    return publications;
  }
}
