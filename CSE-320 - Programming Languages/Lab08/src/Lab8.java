
public class Lab8 {
	
	//Single Responsibility Principle
	class UserAccount {
		public Username name;
		public Password pass;
		public Email email;
		
		public UserAccount(Username name, Password pass, Email email)
		{
			this.name = name;
			this.pass = pass;
			this.email = email;
		}
	}

	class Username	{
		public String name;
		
		public Username(String name) {
			if(validateUsername(name))
			{
				this.name = name;
			}
			else
			{
				throw new RuntimeException();
			}
		}
		
		private boolean validateUsername(String name)
		{
			//Validation of name
			return true;
		}
	}
	
	class Email	{
		public String email;
		
		public Email(String email) {
			if(validateUsername(email))
			{
				this.email = email;
			}
			else
			{
				throw new RuntimeException();
			}
		}
		
		private boolean validateUsername(String email)
		{
			//Validation of name
			return true;
		}
	}

	class Password	{
		public String pass;
		
		public Password(String pass) {
			this.pass = hashPass(pass);
		}
		
		private String hashPass(String pass)
		{
			//Hash's password
			String hash = null;
			return hash;
		}
	}
	
	
	//Open/Close Principle
	class SendMessage {
		public void sendmsg(Message s)
		{
			s.send();
		}
	}
	
	abstract class Message {
		abstract void send();
	}
	
	class TextMessage extends Message {
		public void send()
		{
			//Send only text message
		}
	}
	
	class ImgMessage extends Message {
		public void send()
		{
			//Send image message
		}
	}
	
	
	//Liskov Substitution Principle
	class TransportationDevice
	{
		String name;
		double maxSpeed;
		boolean canReverse;
		
		void setName(String n) {}
		String getName() {}
		
		void setSpeed(double d) {}
		double getSpeed() {}
		
		boolean getCanReverse() {}
		void setCanReverse(boolean c) {}
	}
	
	class DevicesWithoutEngines  extends TransportationDevice
	{
		void startMoving() {}
	}
	
	class DeviceWithEngines extends TransportationDevice
	{
		Engine engine;
		Engine getEngine() {}
		void setEngine(Engine e) {}
		
		void startEngine() {}
	}

	class Car extends DeviceWithEngines {
		@Override
		void startEngine() {}
	}
	
	class Bicycle extends DevicesWithoutEngines {
		@Override
		void startMoving() {}
	}
	
	//Interface Segregation Principle
	interface ILoans extends PayLoan, GetLoan {}
	
	interface IPayloan {
		public void pay();
	}
	
	interface IGetLoan{
		public void get();
	}
	
	class CollegeStudent implements IGetLoan {
		public void get()
		{
			//Gets a loan for school
		}
	}
	
	class GraduateStudent implements IPayloan {
		public void pay()
		{
			//Make payment to student loan
		}
	}
	
	class NormalPerson implements IGetLoan, IPayLoan {
		public void get()
		{
			//Get Loan
		}
		
		public void pay()
		{
			//Pay loan
		}
	}
	
	class Citizen {
		Citizen person;
		
		public void setPerson(Citizen p)
		{
			person = p;
		}
		
		public void GMoney()
		{
			person.GetMoney();
		}
	}

	//Dependency Inversion Principle
	interface IRifle {
		public void shoot();
	}
	
	class SmallRifle implements IRifle {
		public void shoot()
		{
			//... rilfe shoot
		}
	}
	
	class BigRifle implements IRifle {
		public void shoot()
		{
			//Shot bigger bullet
		}
	}
	
	class GunUser {
		IRifle gun;
		
		public void setGun(IRifle g)
		{
			gun = g;
		}
		
		public void ShootGun()
		{
			gun.shoot();
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
