dir = "C:/Users/travermk/Desktop/2024_0606 Ramos Activation Gradient/"
files = getFileList(dir);

for (i = 0; i < files.length; i++) {
	if (endsWith(files[i], ".nd2")) {
		run("Bio-Formats Importer", "open=[" + dir + files[i] + "] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
		name = File.getNameWithoutExtension(dir+files[i]);
		saveAs("tiff", dir+name+".tif");
		File.delete(dir+files[i]);
		close("*");
	}
}