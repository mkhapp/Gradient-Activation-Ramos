for (i = 0; i < 70; i++) {
	run("Duplicate...", i);
}
run("Images to Stack", "use");
run("Delete Slice");

waitForUser

run("Split Channels");
names = getList("image.titles");

for (i = 0; i < names.length; i++) {
	if (startsWith(names[i], "C1-")) {
		selectWindow(names[i]);
		rename("C1.tif");
	}
	if (startsWith(names[i], "C2-")) {
		selectWindow(names[i]);
		rename("C2.tif");
	}
}

run("Concatenate...", "open image1=C1.tif image2=C2.tif image3=Stack");

run("Stack to Hyperstack...", "order=xytzc channels=3 slices=1 frames=70 display=Grayscale");