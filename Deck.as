﻿class Deck {	private var xml:XML;	private var askedQuestion:Array;		xml.onLoad = function() {		trace(xml.firstChild.childNodes[1].firstChild.length);	}	 	public function Deck() {		xml = new XML();	    xml.ignoreWhite =  true;    xml.load('questions.xml');				trace(xml.firstChild.childNodes[1].firstChild.length);		askedQuestion = new Array(new Array(xml.firstChild.childNodes[0].firstChild.length));	}}