/*function createNewBox(xPos, yPos, width, height) {
	fill(20);
	rect(xPos+5, yPos+5, width, height, 20);
	rect(xPos-5, (yPos - (0.5*height) + 25), width + 20, height/2, 20)

	fill(225,225,225);
	rect(xPos, yPos, width, height, 20);

	fill(170);
	rect(xPos-10, (yPos - (0.5*height) + 20), width + 20, height/2, 20);
}

function setup() {
	
}

function draw() {
	createCanvas(windowWidth, windowHeight);
	createNewBox(250,250,250,100);
	//background(51);
	text('Hello world', windowWidth/2, windowHeight/2);

}*/


function drawSidebar() {
	fill(150);
	if(windowWidth > 900) {
		rect(0, 0, 140 + (windowWidth/15), windowHeight);
	} else {
		rect(0, 0, 200, windowHeight);
	}	

	text(windowWidth, windowWidth/2, windowHeight/2);
}

function setup() {

}

function draw() {
	createCanvas(windowWidth,windowHeight);
	drawSidebar();
	//background(80);
}