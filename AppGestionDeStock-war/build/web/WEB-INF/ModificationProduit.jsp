<%@page import="java.util.List"%>
<%@page import="Entites.Marque"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Articles</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
         <style>
        /* Modify the background color */
          
        .navbar-custom {
            background-color: #1c355e;
            color: white;
            text-decoration: none;
        }
        /* Modify brand and text color */
          
        .navbar-custom .navbar-brand,
        .navbar-custom .navbar-text {
         color: white;
        }
        
    </style>
    </head>
    <body class="sb-nav-fixed">
        <%@ include file="NavBar.jsp" %>
        <div id="layoutSidenav">
            <%@ include file="SideBar.jsp" %>
            <div id="layoutSidenav_content">
                <main class="bgBody">
                    <div class="container-fluid login">
                        <div class="row">
                            <div class="col-md-3 col-sm-4 col-xs-0"></div>
                            <div class="col-md-6 col-sm-8 col-xs-12" style="margin-top: 10px; border : 2px solid rgba(0, 0, 0, 0.150); padding: 40px; padding-top: 10px; padding-bottom:  20px; margin-bottom:  20px; border-radius: 5px; ">
                                <h3 style="color: #1c355e; font-weight: 28px; padding-bottom: 15px; text-align: center;">Modifier un produit</h3>
                                <form  action="http://localhost:8080/AppGestionDeStock-war/ModificationProduit" method="POST" class="form-con">
                                        <div class="mb-3 InputFormArticl">
                                          <label  class="form-label">R??f??rence </label>
                                          <input type="text" class="form-control" name = "nom" value="<%= (String)request.getAttribute("nom") %>" id="" aria-describedby="" readonly="readonly" >
                                        </div>
                                        <div class="mb-3 InputFormArticl">
                                            <label for="exampleInputEmail1" class="form-label">Marque</label></br>
                                            <select class="form-select" aria-label="Default select example" name="nomMarque">
                                                <option  value="<%= (String)request.getAttribute("nomMarque") %>" selected><%= (String)request.getAttribute("nomMarque") %></option>
                                                 <% 
                                                 List<Marque> LsMarque = (List<Marque>) request.getAttribute("ListMarque");
                                                    for (int i = 0; i < LsMarque.size(); i++){
                                                %>
                                                <option value="<%= LsMarque.get(i).getNomMarque() %>"><%= LsMarque.get(i).getNomMarque() %></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-3 InputFormArticl">
                                          <label  class="form-label">D??nomination </label>
                                          <input type="text" class="form-control" name = "denomination" placeholder="d??nomination..." value="<%= (String)request.getAttribute("denomination") %>" id="" aria-describedby="">
                                        </div>
                                        <div class="mb-3 InputFormArticl">
                                          <label  class="form-label">Prix</label>
                                          <input type="text" class="form-control" name = "prix" placeholder="prix..." value="<%= (String)request.getAttribute("prix") %>" id="" aria-describedby="">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-4 col-xs-0">  
                                                <div class="mb-3 InputFormArticl">
                                                   <label  class="form-label">Poids</label>
                                                    <input type="text" class="form-control" name = "poids" placeholder="poids..." value="<%= (String)request.getAttribute("poids") %>" id="" aria-describedby="">
                                                </div>
                                            </div> 
                                            <div class="col-md-6 col-sm-4 col-xs-0">
                                                <div class="mb-3 InputFormArticl">
                                                    <label  class="form-label">Volume</label>
                                                    <input type="text" class="form-control" name = "volume" placeholder="volume..." value="<%= (String)request.getAttribute("volume") %>" id="" aria-describedby="">
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn " style="width: 300px; margin-left: 100px; color: white; background-color: #1c355e; font-weight: 140;">Enregistrer</button>
                                    
                                </form>
                            <div class="col-md-3 col-sm-4 col-xs-0"></div>
                         </div>
                     </div>
                    </div>
                    
                </main>
                
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>            
      

