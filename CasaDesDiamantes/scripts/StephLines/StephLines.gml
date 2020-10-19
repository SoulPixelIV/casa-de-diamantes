function StephLines(){
	lines[0] = "This looks like a nightmare...";
	lines[1] = "Yeah fuck you.";
	lines[2] = "Asshole..";
	lines[3] = "I didn't pay for this!";
	lines[4] = "Whatcha looking at??";
	
	return lines[irandom_range(0, array_length(lines) - 1)];
}