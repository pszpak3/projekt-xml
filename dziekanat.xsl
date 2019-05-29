<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
		<body>
		<h2>Lista ocen</h2>
			<table border="1">
				<tr bgcolor="#9acd32">
				<th></th>
					<xsl:for-each select="Dziekanat/Przedmioty/przedmiot">
					<th><xsl:value-of select="nazwaPrzedmiotu"/></th>
					</xsl:for-each>
				</tr>
				<xsl:for-each select="Dziekanat/Studenci/student">
				<tr>
					<xsl:variable name="indeks_rel_name"> <xsl:value-of select="indeks"/> </xsl:variable>
					<th><xsl:value-of select="indeks"/></th>
					<xsl:for-each select="../../Przedmioty/przedmiot">
					<xsl:variable name="idPrzedmiot_rel_name"> <xsl:value-of select="idPrzedmiot"/> </xsl:variable>
						<th><xsl:value-of select="../../Oceny/ocena[@indeksStudenta=$indeks_rel_name][@idPrzedmiot=$idPrzedmiot_rel_name]"/></th>
					</xsl:for-each>
				</tr>
				</xsl:for-each>
			</table>
			
		<h2>Informacje o przedmiotach</h2>
		<table border="1">
				<tr bgcolor="#9acd32">
					<th>id Przedmiotu</th>
					<th>nazwa przedmiotu</th>
					<th>prowadzacy</th>
					<th>punkty ECTS</th>
				</tr>
				<xsl:for-each select="Dziekanat/Przedmioty/przedmiot">
				<tr>
					<th><xsl:value-of select="idPrzedmiot"/></th>
					<th><xsl:value-of select="nazwaPrzedmiotu"/></th>
					<th><xsl:value-of select="prowadzacy"/></th>
					<th><xsl:value-of select="punktyECTS"/></th>
				</tr>
				</xsl:for-each>
			</table>
			
		<h2>Dane studentow</h2>
		<ol>
		  <xsl:apply-templates />
		</ol>
		</body>
		</html>
		</xsl:template>
		<xsl:template match="student">
		<xsl:variable name="indeks_var"> <xsl:value-of select="indeks"/> </xsl:variable>
			<li><xsl:apply-templates select="nazwisko"/>, <xsl:apply-templates select="imie"/><br/>
				drugie imie: <xsl:apply-templates select="drugieImie"/><br/>
				telefon: <xsl:apply-templates select="nrTelefonu"/><br/>
				typ studiow: <xsl:apply-templates select="studia/typ"/><br/>
				kierunek: <xsl:apply-templates select="studia/kierunek"/><br/>
				data urodzenia: <xsl:apply-templates select="dataUrodzenia"/>
			</li>
			Adres: <span style="font-style: italic; font-weight: bold;"><xsl:value-of select="../../Adresy/adres[@indeksStudenta=$indeks_var]"/></span>

		</xsl:template>

		<xsl:template match="nazwisko">
		  <span style="text-decoration:underline">
		  <xsl:value-of select="."/></span>
		</xsl:template>

		<xsl:template match="imie">
		  <span style="font-weight:bold">
		  <xsl:value-of select="."/></span>
		</xsl:template>
		
		<xsl:template match="drugieImie | nrTelefonu | adresEmail | studia/typ | studia/kierunek | dataUrodzenia">
		  <span style="color:red;">
		  <xsl:value-of select="."/></span>
		</xsl:template>



</xsl:stylesheet> 