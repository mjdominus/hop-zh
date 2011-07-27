#!/usr/bin/perl

$type = $ARGV[0];

$xsl_path = "/usr/share/sgml/docbook/xsl-stylesheets-1.69.1-5.1";
$dtd_path = "/usr/share/sgml/docbook/xml-dtd-4.1.2-1.0-30.1/docbookx.dtd";
if ($^O =~ /cygwin/) {
	$xsl_path = "/usr/share/docbook-xsl";
	$dtd_path = "/usr/share/xml/docbook/4.1.2/docbookx.dtd";
}

open FH, ">catalog.xml";
print FH <<XML;
<?xml version="1.0"?>
<catalog  xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">

	<!-- define public DTD -->
	<public
		publicId="-//OASIS//DTD DocBook XML V4.1.2//EN"
		uri="file://$dtd_path" />

	<!-- XSL location -->
	<uri
		name="html/docbook.xsl"
		uri="$xsl_path/html/docbook.xsl" />
	<uri
		name="html/chunk.xsl"
		uri="$xsl_path/html/chunk.xsl" />

</catalog>

XML

close FH;


