<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>加入會員</title>
<link rel="stylesheet" type="text/css" href="style/travelFun.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" 
	            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
	            crossorigin="anonymous"></script>
<script>
</script>
<style type="text/css">

.header{
position:fixed;

}

.registerform {
margin: 170px auto;
padding: 0;
width: 560px;

}

.registerform input{

/* height:25px ;
 width:300px ; */

}
</style>
</head>
</head>
<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%String u=request.getParameter("id");
		session.setAttribute("id",u);
%>
<sql:setDataSource var="sample" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/tf?useUnicode=true&characterEncoding=utf8"
     user="root"  password="1234"/> 
 
  <c:set var="Id" value="${sessionScope.id}" />    
 <c:set var="Name" value="${param['name']}" />
 <c:set var="Password" value="${param['password']}" />
 <c:set var="Gender" value="${param['gender']}" />
 <c:set var="Email" value="${param['email']}" /> 
 <c:set var="Birthday" value="${param['birthday']}" /> 
 <c:set var="Phone" value="${param['phone']}" /> 
  <c:set var="Address" value="${param['address']}" /> 

 <sql:update dataSource="${sample}" var="count">
       update customers set name='${Name}' ,password='${Password}' , gender='${Gender}' , email='${Email}', birthday='${Birthday}' , phone='${Phone}' , address='${Address}'  where id= '${Id}'
</sql:update> 
<sql:query dataSource="${sample}" var="result">
      select * from customers where id="${sessionScope.id}"
</sql:query> 
<table border="1" width="100%">
<tr>
	<th>ID</th>
   <th>Name</th>
   <th>Password</th>
   <th>Gender</th>
   <th>Email</th>
   <th>Birthday</th>
   <th>Phone</th>
   <th>Address</th>
   <h3>修改資料如下</h3>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.password}"/></td>
   <td><c:out value="${row.gender}"/></td>
   <td><c:out value="${row.email}"/></td>
   <td><c:out value="${row.birthday}"/></td>
   <td><c:out value="${row.phone}"/></td>
   <td><c:out value="${row.address}"/></td>
</tr>
</table>
</c:forEach>
</body>
</html>