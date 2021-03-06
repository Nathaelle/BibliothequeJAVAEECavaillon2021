<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<%-- Afficher une valeur (équivalent) --%>
	<%-- <h2><%= "Hello World" %></h2>
	<h2><c:out value="Hello World"/></h2> --%>
	
	<%-- Créer une variable (équivalent) --%>
	<%-- <% String maVariable1 = "Ma valeur 1"; %>
	<p><%= maVariable1 %></p> --%>
	
	<%-- <c:set var="maVariable2" value="Ma valeur 2"/>
	<p><c:out value="${ maVariable2 }"/></p> --%>
	
	<%-- Créer une variable (équivalent) --%>
	<%-- <% if(15 < 50) { %>
		<h2>Test validé</h2>
	<% } %>
	<c:if test="${ 15 < 50 }">
		<h2>Test validé</h2>
	</c:if> --%> 
	
	<%-- <c:choose>
	    <c:when test="${ condition }">Un texte</c:when>
	    <c:when test="${ autreCondition }">Un autre texte</c:when>
	    <c:when test="${ encoreUneAutreCondition }">Encore un autre texte</c:when>
	    <c:otherwise>(Texte par défaut)</c:otherwise>
	</c:choose> --%>
	
	<%-- Boucle for (boucle avec compteur) (équivalent) --%>
	<%-- <% for(int i = 0; i <= 10; i++) { %>
		<p>Un message n° <%= i %> !</p>
	<% } %>
	<c:forEach var="i" begin="0" end="10" step="1">
	    <p>Un message n° ${ i } !</p>
	</c:forEach> --%>
	
	<%-- Boucle for(each) (boucle de parcours de collection) (équivalent) --%>
	<%-- <% for(Livre livre: (ArrayList<Livre>) request.getAttribute("bibliotheque")) { %>
		<p>Titre :  <%= livre.getTitre() %> !</p>
	<% } %>
	<c:forEach var="livre" items="${ bibliotheque }" >
	    <p>Titre : ${ livre.titre } !</p>
	</c:forEach>
	
	<c:forTokens var="morceau" items="Un élément/Encore un autre élément/Un dernier pour la route" delims="/ ">
	    <p>${ morceau }</p>
	</c:forTokens> --%>

	<!-- Afficher les informations des livres -->
	<h2>Livres disponibles</h2>
	<table>
		<tr>
			<th>Référence</th>
			<th>Titre</th>
			<th>Auteur</th>
			<th></th>
		</tr>
		
		<!-- Limite partie fixe/ itérations -->
		<%-- <% for(Livre livre : (ArrayList<Livre>) request.getAttribute("bibliotheque")) { %> --%>
		<c:forEach var="livre" items="${ bibliotheque }">
		<tr>
			<%-- <td><%= livre.getReference() %></td>
			<td><%= livre.getTitre() %></td>
			<td><%= livre.getAuteur() %></td> --%>
			<td>${ livre.reference }</td>
			<td>${ livre.titre }</td>
			<td>${ livre.auteur }</td>
			<td>
				<a href="bibliotheque?action=modify&reference=${ livre.reference }">Modifier</a> | 
				<a href="bibliotheque?action=delete&reference=${ livre.reference }">Supprimer</a>
			</td>	
			
			
		</tr>
		</c:forEach>
		<%-- <% } %> --%>
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

	<h2>${ livre != null ? "Modifier le livre" : "Ajouter un livre" }</h2>
	
	<form action='bibliotheque?to=${ livre != null ? "mod" : "add" }' method="POST">
	
		<div>
			<label for="reference">Référence </label>
			<input type="text" name="reference" id="reference" value='${ livre != null ? livre.reference : "" }' ${ livre != null ? "disabled" : "" }>			
			<%-- <% if(request.getAttribute("livre") != null) { %> --%>
			<c:if test="${ livre != null }">
				<input type="hidden" name="reference" value='${ livre.reference }'>
			</c:if>
			<%-- <% } %> --%>
		</div>
		<div>
			<label for="titre">Titre </label>
			<input type="text" name="titre" id="titre" value='${ livre != null ? livre.titre : "" }'>
		</div>
		<div>
			<label for="auteur">Auteur </label>
			<input type="text" name="auteur" id="auteur" value='${ livre != null ? livre.auteur : "" }'>
		</div>
		<div>
			<input type="submit" value='${ livre != null ? "Modifier le livre" : "Ajouter à la bibliotheque" }'>
		</div>
	
	</form>

</body>
</html>