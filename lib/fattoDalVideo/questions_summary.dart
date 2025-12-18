// Import della libreria Flutter per i widget Material Design.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget che mostra un riepilogo delle domande e delle risposte.
/// Riceve una lista di mappe (`summaryData`) con i dati di ogni domanda:
/// - indice della domanda
/// - testo della domanda
/// - risposta corretta
/// - risposta data dall’utente
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  /// Lista di mappe con i dati riassuntivi.
  /// Viene costruita in ResultsScreen e passata qui.
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    /// SizedBox: contenitore con altezza fissa (320).
    /// Dentro mettiamo un SingleChildScrollView per permettere lo scroll
    /// se ci sono più domande di quelle che entrano nello spazio.
    return SizedBox(
      height: 320,
      child: SingleChildScrollView(
        child: Column(
          /// Per ogni elemento della lista summaryData creiamo un Row.
          /// - map(): trasforma ogni mappa in un widget Row.
          /// - toList(): converte l’iterabile in lista di widget.
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Numero della domanda (indice + 1).
                //Text(((data['question_index'] as int) + 1).toString()),
                //Per renderlo più carino uso un altro widget CircleAvatar
                CircleAvatar(
                  radius: 16,
                  backgroundColor: const Color.fromARGB(255, 255, 160, 64),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.creepster(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Expanded: occupa tutto lo spazio rimanente della riga.
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Testo della domanda.
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.alice(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Risposta data dall’utente.
                      Text(
                        'Tua risposta: ${data['user_answer']}',
                        style: GoogleFonts.alice(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 16, 5, 2),
                        ),
                      ),

                      // Risposta corretta.
                      Text(
                        'Risposta corretta: ${data['correct_answer']}',
                        style: GoogleFonts.alice(
                          color: Colors.greenAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
