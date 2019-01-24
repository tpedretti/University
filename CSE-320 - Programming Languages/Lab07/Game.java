import java.util.*;


class Player {
	String _name;
	int _health;
	PlayerInventory _inventory;
	
	Player() {}
	Player(String name, int health, PlayerInventory inventory) {
		_name = name;
		_health = health;
		_inventory = inventory;
	}
}

abstract class Item {
	String _name;
	double _value;
	double _weight;
	
	Item(String name, double value, double weight) {
		_name = name;
		_value = value;
		_weight = weight;
	}
}

abstract class Inventory {
	abstract void add(Item item);
	abstract void remove(Item item);
}

class PlayerInventory extends Inventory {
	private List<Item> items;

	public void add(Item item) {}
	public void remove(Item item) {}
	
	public int itemCount() {return items.size(); }
}

class Weapon {
	String _name;
}

class Sword extends Weapon {
	double _slashDMG;
	double _pokeDMG;
	
	void slashAtk() { }
	void pokeAtk() { }
}

class Gun extends Weapon {
	double _bulletDMG;
	
	void shoot() { }
}

class PlayerPrinter {
	public void printPlayerName(Player p)
	{
		System.out.println(p._name);
	}
}

public class Game {

	public static void main(String argv[])
	{
		Player mainPlayer = new Player("Tim", 100, new PlayerInventory());
		PlayerPrinter p = new PlayerPrinter();
		
		p.printPlayerName(mainPlayer);
		
		System.out.println("Hello");
	}
}
