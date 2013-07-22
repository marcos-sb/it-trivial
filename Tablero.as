﻿ class Tablero extends MovieClip {	private var _casillas:Array;	private var _colorCas:Array;	private var _esQuesito:Array;	private var a,b:Number;	private var i:Number = 0;	private var j:Number = 0;  private var _movs:Array;	private var _posX:Array;	private var _posY:Array;	private static var _am:Number = 1;	private static var _ro:Number = 2;	private static var _az:Number = 3;	private static var _na:Number = 4;	private static var _ve:Number = 5;	private static var _gr:Number = 7;	private static var _ma:Number = 6;	private static var _es:Number = 0;  // color de la casilla central		public function Tablero() {		this._movs = new Array();		this._colorCas = new Array(_am, _gr, _ro, _az, _gr, _na, _ve, _na, _gr, _am, _ma, _gr, _az, _ro, 															 _az, _gr, _na, _ve, _gr, _ma, _am, _ma, _gr, _az, _ro, _gr, _ve, _na,															 _ve, _gr, _ma, _am, _gr, _ro, _az, _ro, _gr, _ve, _na, _gr, _am, _ma,															 _am, _ro, _na, _az, _ve, _na, _am, _az, _ma, _ro, _az, _na, _ma, _ve,															 _am, _ma, _az, _ve, _ro, _na, _ve, _ma, _ro, _am, _az, _ro, _ve, _am,															 _na, _ma, _es);				this._posX = new Array(96 , 122, 150, 182, 214, 247, 300, 353, 388, 421, 453, 480, 504, 534, 555,													 565, 569, 568, 564, 558, 535, 505, 481, 452, 420, 387, 352, 300, 246, 212,													 180, 150, 122, 97 , 66 , 43 , 34 , 29 , 29 , 34 , 44 , 67 , 108, 141, 172,													 203, 233, 300, 300, 300, 300, 300, 494, 462, 431, 399, 368, 495, 463, 431,													 400, 371, 300, 300, 300, 300, 300, 110, 141, 171, 201, 232, 300);				this._posY = new Array(477, 504, 526, 543, 556, 565, 572, 564, 556, 543, 527, 504, 479, 435, 389,													 358, 324, 289, 252, 218, 167, 125, 100, 77 , 59 , 44 , 36 , 28 , 35 , 45 ,													 58 , 75 , 99 , 123, 166, 215, 250, 285, 321, 355, 388, 436, 412, 397, 380,													 362, 345, 523, 487, 451, 416, 380, 413, 395, 377, 360, 341, 192, 209, 228,													 246, 263, 81 , 116, 150, 185, 222, 189, 206, 224, 244, 262, 300);				this._esQuesito = new Array();		for (i = 0; i < this._colorCas.length; i++) {			this._esQuesito[i] = false;		}		this._esQuesito[6] = true;		this._esQuesito[13] = true;		this._esQuesito[20] = true;		this._esQuesito[27] = true;		this._esQuesito[34] = true;		this._esQuesito[41] = true;				this._casillas = new Array();		for (i = 0; i < this._colorCas.length; i++) {			this._casillas[i] = new Casilla(this._colorCas[i], i, this._esQuesito[i]);		}		for (i = 1; i < 41; i++) {  // ojo con la casilla 0 (no está relacionada con la -1, sino con la 42)			this._casillas[i].añadirRel(this._casillas[i-1]);			this._casillas[i].añadirRel(this._casillas[i+1]);		}		this._casillas[0].añadirRel(this._casillas[41]);  // quesito amarillo		this._casillas[0].añadirRel(this._casillas[1]);  // dados		a = 47;		for (i = 6; i < 41; i += 7) {			this._casillas[i].añadirRel(this._casillas[a]);			a += 5;		}				this._casillas[41].añadirRel(this._casillas[40]);		this._casillas[41].añadirRel(this._casillas[0]);		this._casillas[41].añadirRel(this._casillas[42]);				for(j = 0; j < 6; j++) {			switch(j) {				case 0:					a = 43;					b = 46;					break;				default:				  a = b+2;					b = a+3;					break;			}			for(i = a; i < b; i++) {				this._casillas[i].añadirRel(this._casillas[i-1]);				this._casillas[i].añadirRel(this._casillas[i+1]);			}			this._casillas[b].añadirRel(this._casillas[b-1]);			this._casillas[b].añadirRel(this._casillas[72]);		}			this._casillas[42].añadirRel(this._casillas[41]);		this._casillas[42].añadirRel(this._casillas[43]);			a = 47;		for (i = 6; i < 41; i += 7) {			this._casillas[a].añadirRel(this._casillas[i]);	  	this._casillas[a].añadirRel(this._casillas[a+1]);			a += 5;		}		for (i = 46; i <= 71; i += 5) {			this._casillas[72].añadirRel(this._casillas[i]);		}		// posiciones de las casillas		for(i = 0; i < 73; i++) {			_casillas[i].setX(_posX[i]);		  _casillas[i].setY(_posY[i]);		}		for(var i=0; i<_casillas.length; i++) {			for(var j=0; j<_casillas[i].getNumRel(); j++) {				trace(_casillas[i] + " -> " + _casillas[i].getRel(j));			}		}	}		public function getCasilla(number:Number) {		return this._casillas[number];	}	public function findMovs(tirada:Number, c:Casilla):Array {		this._movs = [];		var n:Number = c.getNumRel();		var aux:Number = tirada;		for(i = 0; i < n; i++) {			this._movs.push(new Par(c.getRel(i), c));		}		while(aux > 1) {			aux--;			var l:Number = this._movs.length;			var temp;			for(i = 0; i < l; i++) {				temp = this._movs.shift();				n = temp.a().getNumRel();				var j:Number;				for(j = 0; j < n; j++) {					var temp2:Casilla = temp.a().getRel(j);					if(temp2 != temp.b()) {						this._movs.push(new Par(temp2, temp.a()));					}				}			}		}		return this._movs;  // devolvemos un par(casilla final, casilla anterior)	}}