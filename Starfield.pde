Particle[] light = new Particle[500];
void setup()
{
	size(500,500);
	for(int i = 0; i < light.length; i++)
	{
		light[i] = new NormalParticle();
	}
	for(int i = 0; i < 5; i++)
	{
		light[i] = new OddballParticle();
	}
	for(int i = 0; i < 3; i++)
	{
		light[i] = new JumboParticle();
	}
}
void draw()
{
	background(0);
	for(int i = 0; i < light.length; i++)
	{
		light[i].move();
		light[i].show();
	}
}
class NormalParticle implements Particle
{
	double myX, myY, myDir;
	int mySpeed;
	int myColor;
	int mySize;
	int myWidth;
	NormalParticle()
	{
		myX = 250;
		myY = 250;
		mySpeed = (int)(Math.random()*5)+1;
		myDir = Math.random()*2*Math.PI;
		myColor = color(200,200,255);
		mySize = (int)(Math.random()*100)+50;
		myWidth = (int)(Math.random()*3)+2;
	}
	void move()
	{
		myX += (mySpeed * Math.cos(myDir));
		myY += (mySpeed * Math.sin(myDir));
	}
	void show()
	{
		fill(myColor);
		rect((float)myX,(float)myY,mySize,myWidth,20);
	}
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	int myX, myY;
	double myDir;
	int mySpeed;
	int myColor;
	OddballParticle()
	{
		myX = 250;
		myY = 250;
		mySpeed = (int)(Math.random()*10)+1;
		myDir = Math.random()*2*Math.PI;
		myColor = color(200,200,255);
	}
	void move()
	{
		myX = myX + (int)(Math.random()*5)-1;
		myY = myY + (int)(Math.random()*5)-1;
	}
	void show()
	{
		fill(myColor);
		rect(myX,myY,20,10);
	}
}
class JumboParticle extends NormalParticle
{
	void show()
	{
		fill(0,0,255);
		rect((float)myX,(float)myY,100,25,20);
	}
}