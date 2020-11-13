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
  
  
  <sql:query dataSource="${sample}" var="result">
       select * from customers where id="${sessionScope.id}"
</sql:query> 

<c:forEach var="row" items="${result.rows}">
<article>	
			
			<form>
				    <h1>加入旅遊趣會員</h1><br>
				
				
					<h3><label>帳號:</label></h3>
					<input value="<%=session.getAttribute("id") %>"  disabled="disabled" id='id' >
				
				
					<h3><label>姓名:</label></h3>
					<input  value= "${row.name}" id='name' >
				
				
					<h3><label>設定密碼:</label></h3>
					<input type="password" value='${row.password}' minlength="5" maxlength="20" id='password1' ><br>
					<h3><label>確認密碼:</label></h3>
					<input type="password" value='${row.password}' minlength="5" maxlength="20" id='password2'  >

					<h3><label>性別:</label></h3>
					
					$("input:radio[value='2']").attr('checked','true');
					<input type="radio" name='gender'  id='gender' value='M' ><label>男</label>
					<input type="radio" name='gender' id='gender' value='F' checked><label>女</label>
				    
					<h3><label>E-mail:</label></h3>
					<input type='email' value="${row.email}" id='email' >
			
					<h3><label>生日:</label></h3>
					<input type='date' id='birthday'  value="${row.birthday}">
				
					<h3><label>手機號碼:</label></h3>
					<input type='tel' id='phone' value="${row.phone}">
				
					<h3><label>地址:</label></h3>
					<textarea id='address' >${row.address}</textarea><br>

				<br><input type='button'  id="send" value='修改資料' >	<br>		
				
			</form>
		</article>
  <div id="msg"></div>
     <script>
          function show(data){
        	  $("#msg").html(data);
          }
          function send(){
        	  
        	  if($("#password1").val()!=$("#password2").val())
        	  {alert("密碼不一致")}
        	  else{
        	  $.post("membership.jsp",{"id":$("#id").val() ,"name":$("#name").val() , "password":$("#password1").val() ,
        		        "gender":$("#gender:checked").val(),"email":$("#email").val(),
        		        "birthday":$("#birthday").val(),"phone":$("#phone").val(),"address":$("#address").val()}, show);}

          }
  
          $("#send").click(send);

 </script>
</c:forEach>
</body>
</html>