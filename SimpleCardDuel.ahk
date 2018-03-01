; ### SET VARIABLES/ARRAYS ###
Deck := {"Hearts": {1: "Two", 2: "Three", 3: "Four", 4: "Five", 5: "Six", 6: "Seven", 7: "Eight", 8: "Nine", 9: "Ten", 10: "Knight", 11: "Queen", 12: "King", 13: "Ace"} ; Can be made into one row
	, "Spades": {1: "Two", 2: "Three", 3: "Four", 4: "Five", 5: "Six", 6: "Seven", 7: "Eight", 8: "Nine", 9: "Ten", 10: "Knight", 11: "Queen", 12: "King", 13: "Ace"} ; but I kept these in case I
	, "Clubs": {1: "Two", 2: "Three", 3: "Four", 4: "Five", 5: "Six", 6: "Seven", 7: "Eight", 8: "Nine", 9: "Ten", 10: "Knight", 11: "Queen", 12: "King", 13: "Ace"} ; would like to make suit or
	, "Diamonds": {1: "Two", 2: "Three", 3: "Four", 4: "Five", 5: "Six", 6: "Seven", 7: "Eight", 8: "Nine", 9: "Ten", 10: "Knight", 11: "Queen", 12: "King", 13: "Ace"}} ; rank matter
Colors := {1: "Hearts", 2: "Spades", 3: "Clubs", 4: "Diamonds"}

; ### FUNCTIONS ###
DrawCard(Deck, Colors)
{
	Random, Rand1, 1, 4
	Random, Rand2, 1, 13
	DrawnCard .= Rand2 ","Deck[Colors[Rand1], Rand2] " of " Colors[Rand1]
	return DrawnCard
}

; ### GUI ###
Gui, Cards: Color, White
Gui, Cards: Font, s12 bold, Georgia
Gui, Cards: Add, Text, section xm, Simple Card Duel!
Gui, Cards: Add, Text,
Gui, Cards: Font, s11 normal, Calibri
Gui, Cards: Add, Button, gDraw default section xm, Draw a card!
Gui, Cards: Add, Button, gClose ys, Close
Gui, Cards: Show, Autosize, Simple Card Duel
return

Draw:
{
	PlayerCard := DrawCard(Deck, Colors), CPUCard := DrawCard(Deck, Colors)
	PlayerScore := StrSplit(PlayerCard, ","), CPUScore := StrSplit(CPUCard, ",")
	if (PlayerScore[1] < CPUScore[1])
		WinLose := "You lost!"
	if (PlayerScore[1] > CPUScore[1])
		WinLose := "You won!"
	if (PlayerScore[1] == CPUScore[1])
		WinLose := "It's a draw!"
	Gui, Cards2: Color, Black
	Gui, Cards2: Font, s12 bold, Georgia
	Gui, Cards2: Add, Text, w400 center cwhite, % "You drew the " Format("{:L}", PlayerScore[2]) "!"
	Gui, Cards2: Font, s12 bold, TimesNewRoman
	Gui, Cards2: Add, Text, w400 center cwhite, % "The computer drew the " Format("{:L}", CPUScore[2]) "!"
	Gui, Cards2: Add, Text,
	Gui, Cards2: Font, s14 bold, ComicSans
	Gui, Cards2: Add, Text, w400 +Center cwhite, % WinLose
	Gui, Cards2: Font, s11 normal, Calibri
	Gui, Cards2: Add, Text,
	Gui, Cards2: Add, Button, x200 center gOK, OK
	Gui, Cards2: Show, h250 w420, Results
	return
	
	OK:
	GuiCards2Close:
	GuiCards2Escape:
	Gui, Cards2: Destroy
	return
}

Close:
CardsGuiClose:
CardsGuiEscape:
ExitApp