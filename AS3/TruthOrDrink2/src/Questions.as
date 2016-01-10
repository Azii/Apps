package 
{
	/**
	 * ...
	 * @author Azad Tasan
	 */
	public class Questions 
	{
		
		private static var questions:Vector.<String> = 
			new < String > ["Wenn dir jemand 1 Million anbietet und du dürftest nie wieder mit mir reden, würdest du das Geld nehmen?",
			"Würdest du für mich ins Gefängnis gehen?",
			"Wenn du einen Teil meines Körpers essen müsstest, welcher wäre es?",
			"Beende diesen Satz für mich:\nIch habe eine Schwäche für...",
			"Beende diesen Satz für mich:\nMein Lieblingspornogenre ist...",
			"Was wäre nötig, damit wir beide Sex haben?",
			"Setz dich auf meinen Schoß und schau mir eine Minute intim in die Augen.",
			"Was würde niemand von dir erwarten, was du aber trotzdem schon einmal getan hast?",
			"Erzähl mir von deinem peinlichsten Date.",
			"Was ist deine eigenartigste Angewohnheit?",
			"Erzähl mir etwas peinliches über mich.",
			"Was ist das ekeligste, das du je in deinem Mund hattest?",
			"Küss mich!",
			"Was stört dich an mir?",
			"Würdest du lieber allein oder mit mir auf einer einsamen Insel stranden?",
			"Wer von uns beiden ist hübscher? (Klare Antwort oder trinken.)",
			"Wer von uns beiden ist klüger? (Klare Antwort oder trinken.)",
			"Was denken deine Freunde von mir?",
			"Welche/n meiner Freunde hättest du gerne?", 
			"Suche für jeden Buchstaben meines Names ein Adjektiv, das mit diesem Buchstaben beginnt und mich beschreibt.",
			"Bei welcher Frage dieses Spiels hast du gelogen?",
			"Versprich mir, dass.. (denk dir etwas aus)",
			"Netflix & Chill?",
			"Was würdest du als erstes tun, wenn du für einen Tag das andere Geschlecht hättest?", 
			"Was darf die Polizei nicht über dich wissen?",
			"Wer von uns hat mehr Style? (Klare Antwort oder trinken.)",
			"Was würdest du jetzt am liebsten mit mir tun?",
			"Schick mir ein Nacktbild von dir.",
			"Auf welchen Link in deinem Verlauf bist du nicht stolz?",
			"Darf ich deine Handyfotos durchsuchen?",
			"Gib mir dein Handy und lass mich jemandem eine Nachricht schicken.",
			"Kommt es dir auf die Größe an?",
			"Wenn ich essbar wäre, was wäre ich und würdest du mich essen?",
			"Ruf deine Mutter an und erklär ihr, dass du homosexuell bist!",
			"Wie häufig masturbierst du?"];
		
		public static function getQuestion():String
		{
			var index:int = Math.floor(Math.random() * questions.length);
			var question:String = questions[index];
			questions.splice(index, 1);
			return question;
		}
		
	}

}