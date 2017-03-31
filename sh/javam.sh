#!/bin/bash
function javam {
	if [ -z "$1" ]; then
		javam Main
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		Help
	elif [ "$1" == "-c" -o "$1" == "--class" -o "$2" == "-c" -o "$2" == "--class" ]; then
		echo -e "/**\r * $1\r * @author Maximilian Berkmann\r * @version 1.0\r */\rclass $1 {\r\t\r\t$1 () {\r\t\t\r\t}\r\t\r\tpublic String toString () {\r\t\treturn \"$1(''=)\";\r\t}\r}" > "$1".java
	elif [ "$1" == "-s" -o "$1" == "--scanner" -o "$2" == "-s" -o "$2" == "--scanner" ]; then
		echo -e "/**\r * $1\r * @author Maximilian Berkmann\r * @version 1.0\r */\rimport java.utils.Scanner;\r\rclass $1 {\r\tpublic static void main (String[] args) {\r\t\tScanner kbd = new Scanner(System.in);\r\t\t\r\t}\r}" > "$1".java
	elif [ "$1" == "-r" -o "$1" == "--reader" -o "$2" == "-r" -o "$2" == "--reader" ]; then
		echo -e "/**\r * $1\r * @author Maximilian Berkmann\r * @version 1.0\r */\rimport java.utils.FileReader;\r\rclass $1 {\r\tpublic static void main (String[] args) {\r\t\tFileReader fr = new FileReader(\"file.txt\");\r\t\t\r\t}\r}" > "$1".java
	elif [ "$1" == "-w" -o "$1" == "--writer" -o "$2" == "-w" -o "$2" == "--writer" ]; then
		echo -e "/**\r * $1\r * @author Maximilian Berkmann\r * @version 1.0\r */\rimport java.utils.FileWriter;\r\rclass $1 {\r\tpublic static void main (String[] args) {\r\t\tFileWriter fr = new FileWriter(\"file.txt\");\r\t\t\r\t}\r}" > "$1".java
	elif [ "$1" == "-t" -o "$1" == "--test" -o "$2" == "-t" -o "$2" == "--test" ]; then
		echo -e "/**\r * Test class for $1\r * @author Maximilian Berkmann\r * @version 1.0\r */\rimport static org.junit.Assert.assertEquals;\r\rimport org.junit.After;\rimport org.junit.Before;\rimport org.junit.Test;\r\rclass $1Test {\r\tprivate $1 obj;\r\r\t/**\r\t * Set up for the test.\r\t * @throws java.lang.Exception $1 class unusable\r\t */\r\t@Before public void setUp() throws Exception {\r\t\tobj = new $1();\r\t}\r\r\t/**\r\t * Clear up.\r\t */\r\t@After public void tearDown() {\r\t\tobj = null;\r\t}\r\r\t/**\r\t * Test ...\r\t */\r\t@Test public void test() {\r\t\tAssertEquals(\"test0\", exp, obj.act());\r\t}\r}" > "$1Test".java
	else
		echo -e "/**\r * $1\r * @author Maximilian Berkmann\r * @version 1.0\r */\rclass $1 {\r\tpublic static void main (String[] args) {\r\t\t\r\t}\r}" > "$1".java
	fi
}

function Help {
	echo Makes a java script.
	echo "Usages: javam [name] [-c|-s|-r|-w|-t]"
	echo ""
	echo  "  -h, --help                  Display this help section."
	echo  "  -c, --class                 Make a proper class."
	echo  "  -s, --scanner               Add a keyboard scanner."
	echo  "  -r, --reader                Add a file reader."
	echo  "  -w, --writer                Add a file writer."
	echo  "  -t, --test                  Make JUnit test class."
	echo ""
	echo "To create a simple generic java script, type: javam, to generate a main.java script."
}

javam $1 $2 $3