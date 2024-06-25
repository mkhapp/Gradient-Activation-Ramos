//choose Texas Red or AF647, as well as directory
dir = "C:/Users/travermk/Desktop/2024_0606 Ramos Activation Gradient/";
fluorophore = ;  //set this as 555 or 647


//set display correctly and save
channel = 1;
slice = 1;
frame = 1;

Stack.setPosition(channel, slice, frame);
run("Grays");
setMinAndMax(50, 15000);

channel = 2;
Stack.setPosition(channel, slice, frame);
run("Green");
setMinAndMax(50, 5000);

channel = 3;
Stack.setPosition(channel, slice, frame);
if (fluorophore == 555) {
	run("Red");
	setMinAndMax(50, 10000);
}
if (fluorophore == 647) {
	run("Magenta");
	setMinAndMax(100, 65536);
}

save(dir + getTitle());

//make gif
run("Make Composite");
run("RGB Color", "frames");

names = split(getTitle(), ".");
name = names[0] + ".gif"

saveAs("Gif", dir + name);
close;
