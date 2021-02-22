# pgm pour mesure F0, F1, F2 et F3
clearinfo
printline Nom_de_fichier 'tab$' Voyelle 'tab$' DurÈe 'tab$' F1_debut 'tab$' F1_centre 'tab$' F1_fin 'tab$' F2_debut 'tab$' F2_centre 'tab$' F2_fin 'tab$' F3_debut 'tab$' F3_centre 'tab$' F3_fin 'tab$' F0_debut 'tab$' F0_centre 'tab$' F0 fin

directory$ = "C:\apa\apata"
Create Strings as file list... list 'directory$'\*.wav
numberOfFiles = Get number of strings

for ifile to numberOfFiles

	select Strings list
	fileName$ = Get string... ifile
	Read from file... 'directory$'\'fileName$'
	name$ = selected$ ("Sound")
	Read from file... 'directory$'\'name$'.TextGrid
	
	select Sound 'name$'
	To Formant (burg)... 0.01 4 5500 0.025 50
	select Sound 'name$'
	To Pitch... 0.01 75 600

	select TextGrid 'name$'
	nbre_int=Get number of intervals... 1
	
	for i to nbre_int
		select TextGrid 'name$'
		label_int$=Get label of interval... 1 i

		debut=Get starting point... 1 i
		fin=Get end point... 1 i
		duree=fin-debut
		centre = ((fin-debut)/2)+debut
		select Formant 'name$'
		f1_debut = Get value at time... 1 debut Hertz Linear
		f1_centre = Get value at time... 1 centre Hertz Linear
		f1_fin = Get value at time... 1 fin Hertz Linear
		f2_debut = Get value at time... 2 debut Hertz Linear
		f2_centre = Get value at time... 2 centre Hertz Linear
		f2_fin = Get value at time... 2 fin Hertz Linear
		f3_debut = Get value at time... 3 debut Hertz Linear
		f3_centre = Get value at time... 3 centre Hertz Linear
		f3_fin = Get value at time... 3 fin Hertz Linear

		select Pitch 'name$'
		f0_debut = Get value at time... debut Hertz Linear
		f0_centre = Get value at time... centre Hertz Linear
		f0_fin = Get value at time... fin Hertz Linear

		
		printline 'fileName$' 'tab$' 'label_int$' 'tab$' 'duree' 'tab$' 'f1_debut' 'tab$' 'f1_centre' 'tab$' 'f1_fin' 'tab$' 'f2_debut' 'tab$' 'f2_centre' 'tab$' 'f2_fin' 'tab$' 'f3_debut' 'tab$' 'f3_centre' 'tab$' 'f3_fin' 'tab$' 'f0_debut' 'tab$' 'f0_centre' 'tab$' 'f0_fin'
		endif

	endfor

endfor