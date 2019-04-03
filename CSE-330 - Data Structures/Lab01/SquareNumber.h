#ifndef _SQUARENUMBER_H_

class SquareNumber
{
public:
	SquareNumber()
		:base(0)
	{}
	int getsq() { return (base * base); }
	int nextsq() { return (base++); }
	int prevsq() { return (base--); }

	// … fill in …
private:
	int base;
};

#endif // !_SQUARENUMBER_H_


