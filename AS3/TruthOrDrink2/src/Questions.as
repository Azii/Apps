package 
{
	/**
	 * ...
	 * @author Azad Tasan
	 */
	public class Questions 
	{
		
		private static var questions:Vector.<String> = 
			new < String > ["Würdest du für 1M Euro nie wieder mit mir reden?",
			"Würdest du für mich ins Gefängnis gehen?",
			//"Wenn du einen Teil meines Körpers essen müsstest, welcher wäre es?",
			//"Beende diesen Satz für mich:\nIch habe eine Schwäche für...",
			"Beende diesen Satz für mich:\nMein Lieblingspornogenre ist...",
			"Was wäre nötig, damit wir beide Sex haben?",
			"Setz dich auf meinen Schoß und schau mir eine Minute intim in die Augen",
			"Was würde niemand von dir erwarten, was du aber trotzdem schon einmal getan hast?",
			"Erzähl mir von deinem peinlichsten Date",
			//"Was ist deine eigenartigste Angewohnheit?",
			"Erzähl mir etwas peinliches über mich",
			"Was ist das ekeligste, das du je in deinem Mund hattest?",
			"Küss mich!",
			"Was stört dich an mir?",
			"Würdest du lieber allein oder mit mir auf einer einsamen Insel stranden?",
			"Wer von uns beiden ist hübscher? (Klare Antwort oder trinken)",
			"Wer von uns beiden ist klüger? (Klare Antwort oder trinken)",
			"Was denken deine Freunde von mir?",
			"Welche/n meiner Freunde hättest du gerne?", 
			//"Suche für jeden Buchstaben meines Names ein Adjektiv, das mit diesem Buchstaben beginnt und mich beschreibt.",
			//"Bei welcher Frage dieses Spiels hast du gelogen?",
			"Versprich mir, dass...",
			"Netflix & Chill?",
			"Was würdest du als erstes tun, wenn du für einen Tag das andere Geschlecht hättest?", 
			"Was darf die Polizei nicht über dich wissen?",
			"Wer von uns hat mehr Style? (Klare Antwort oder trinken.)",
			"Was würdest du jetzt am liebsten mit mir tun?",
			"Schick mir ein Nacktbild von dir",
			"Auf welchen Link in deinem Verlauf bist du nicht stolz?",
			"Darf ich deine Handyfotos durchgucken?",
			"Gib mir dein Handy und lass mich jemandem eine Nachricht schicken",
			"Kommt es dir auf die Größe an?",
			"Ruf deine Mutter an und erklär ihr, dass du homosexuell bist!",
			"Wie häufig masturbierst du?",
			"Was ist das ausversehen schwulste was dir je passiert ist?",
			"Wann und wo hast du das letze mal mastubiert?",
			"Lies die peinlichste Nachricht vor, die du je betrunken geschrieben hast!",
			"Die komischste Fantasie, die du je mit einem Lehrer hattest",
			"Das ekligste, das du je gegessen hast, weil es nichts anderes gab?",
			"Ich darf ein Foto in deine Snapchat Story posten",
			"Alle dürfen den restlichen Abend bei dir Kippen schnorren",
			"Womit hast du in deinem Leben am meisten Zeit vergeudet?",
			"Sing ein Lied aus den iTunes Charts",
			"Tanz zu einem Jason Derulo Song",
			"Geh zum nächsten Späti und mach ein Selfie mit dem Verkäufer",
			"Erzähl einen Witz, wenn keiner lacht musst du trinken",
			"Vor welcher Frage hast du am meisten Angst?",
			"Trink den ersten Uwe, den du finden kannst",
			"Chatroulete...",
			"Lass dich schminken",
			"Halte mit der Person rechts von dir 5 Minuten Händchen",
			"Tausche das T-Shirt mit der Person links von dir",
			"Ich darf dir deine Haare neu stylen",
			"Täusche einen Orgasmus vor",
			"Bestell online eine Pizza",
			"Ziehe dein Oberteil aus",
			"Führ einen Striptease vor",
			"Eine Person deiner Wahl öffnet dir alle Knöpfe und Reißverschlüsse"];
		
		public static function getQuestion():String
		{
			if (questions.length > 0)
			{	
				var index:int = Math.floor(Math.random() * questions.length);
				var question:String = questions[index];
				questions.splice(index, 1);
				return question;
			}else
				throw new Error();
		}
		
	}

}