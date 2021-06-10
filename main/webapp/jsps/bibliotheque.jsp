<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="models.Livre" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Ma bibliotheque</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<h1>Bienvenue dans ma bibliotheque</h1>
	

	<!-- Afficher les informations des livres -->
	<h2>Livres disponibles</h2>
	<table>
		<tr>
			<th>Référence</th>
			<th>Titre</th>
			<th>Auteur</th>
		</tr>
		
		<!-- Limite partie fixe/ itérations -->
		<% for(Livre livre : (ArrayList<Livre>) request.getAttribute("bibliotheque")) { %>
		<tr>
			<td><%= livre.getReference() %></td>
			<td><%= livre.getTitre() %></td>
			<td><%= livre.getAuteur() %></td>
		</tr>
		<% } %>
		<!-- <tr>
			<td>nb548</td>
			<td>L'Iliade et l'Odyssée</td>
			<td>Homère</td>
		</tr>
		<tr>
			<td>ut862</td>
			<td>1984</td>
			<td>George Orwell</td>
		</tr> -->
		<!-- FIN Limite partie fixe/ itérations -->
		
	</table>
	
	<!-- Ecrire un formulaire permettant d'ajouter un livre -->

	<h2>Ajouter un nouveau livre</h2>
	
	<form action="bibliotheque" method="POST">
	
		<div>
			<label for="reference">Référence </label>
			<input type="text" name="reference" id="reference">
		</div>
		<div>
			<label for="titre">Titre </label>
			<input type="text" name="titre" id="titre">
		</div>
		<div>
			<label for="auteur">Auteur </label>
			<input type="text" name="auteur" id="auteur">
		</div>
		<div>
			<input type="submit" value="Ajouter à la bibliotheque">
		</div>
	
	</form>

</body>
</html>