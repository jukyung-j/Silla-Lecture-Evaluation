<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>�Ŷ���б� ���� ��</title>
	
<style>
	header{
		position: static;
 		top: 0;
  		left: 0;
  		right: 0;
 		height: 5%;
  		padding: 1rem;
  		color: white;
  		background: MediumSeaGreen;
  		font-weight: bold;
	}
	h1{
		text-align:center;
	}
	body{
		background-color:#EAEAEA;
		background-clip:content-box;
	}
	.icon{
		float:left; 
		margin-top:15%; 
		margin-left:25%;
		clear:both;
		margin-right:1%;
		background:none;
	}
	fieldset{
		background : none;
		width:400px;
		height:500px;
		padding-top:1%;
		border-radius:5px;
		margin-left:30%;
		margin-top:3%;
	}
	table{
		border-collapse:separate;
		border-spacing:0 10px;
	}
	div{
		padding : 100px 500px;
		line-height : 30px;
		
	}
	footer{
		background: gray;
		position:absolute;
		bottom:0;
		width:100%;
		height:40px;  
		padding-top:15px;
		 	
	}
	.join_button{
		margin-top:10%;
		margin-left:27%;
		width:200px;
		height:50px;
		align:center;
		border:3px solid MediumSeaGreen;
		border-radius:15px;
		font-size:1em;
	}
	input{
		outline:none;
	}
	</style>

</head>
<body>
	<header>
		<h1>�Ŷ���б� ���� ��</h1> 
	</header>
	<img src="../img/icon.png" class="icon" width="200" height="200">
	<div>
	<form>
	<fieldset class="join">
      <legend align="center"><h2>ȸ�� ����</h2></legend>
    <table>
    	<tr>
    	<th>�̸�</th>
    	<td>
    		<input type="text">
    	</td>
    	</tr>
    	<tr>
    	<th>�а�</th>
    	<td><select >	
    		<option>�а� ����</option>
    		<option>���������а�</option>
			<option>�濵�к�</option>
			<option>ȸ�輼���а�</option>
			<option>����ȫ���а�</option>
			<option>���������濵�к�</option>
			<option>���������к� ��������������</option>
			<option>���������к� ��������������</option>
			<option>��ȣ�а�</option>
			<option>����ġ���а�</option>
			<option>ġ�����а�</option>
			<option>���̿�����к�</option>
			<option>������а�</option>
			<option>��ǰ�����а�</option>
			<option>����ü���к�</option>
			<option>������(����)</option>
			<option>MICT��(����)</option>
			<option>�����к�</option>
			<option>�������ڵ������к�</option>
			<option>��ǻ�ͼ���Ʈ������к�</option>
			<option>����Ʈ�������ڰ��к�</option>
			<option>���ձ����к�</option>
			<option>������ȭ�а��к�</option>
			<option>�ż�����к�</option>
			<option>���յ������к�</option>
			<option>â�������к�</option>
			<option>�����а�</option>
			<option>���Ʊ�����</option>
			<option>�������</option>
			<option>�Ͼ����</option>
			<option>�������</option>
			<option>���米����</option>
			<option>���б�����</option>
			<option>��ǻ�ͱ�����</option>
			<option>â�����������к� ��������</option>
			<option>â�����������к� ��������</option>
			<option>�װ��к� �װ�����������</option>
			<option>�װ��к� �װ�����������</option>
			<option>�װ��к� �װ�����������</option>
			<option>����</option>
			<option>����</option>
			<option>����濵�а�</option>
			<option>��Ƽ����Ͻ��а�</option>
			<option>�����������а�</option>
			<option>�ܱ������л�</option>
		</select>
		</td>
    	</tr>
    	<tr>
    	<th>���̵�</th>
    	<td>
    		<input type="text" id="id" >
    	</td>
    	</tr>
    	<tr>
    	<th>��й�ȣ</th>
    	<td>
    		<input type="password">
    	</td>
    	</tr>	
    	<tr>
    	<th>��й�ȣ Ȯ��</th>
    	<td>
    		<input type="password">
    	</td>
    	</tr>	
    	<tr>
    	<th>�г���</th>
    	<td>
    		<input type="text">
    	</td>
    	</tr>
    	<tr>
    	<th>�̸���</th>
    	<td>
    		<input type="email">
    		<input type="button" value="�̸��� ����"> 
    	</td>
    	</tr>	 	    	 
    </table>
       	<a href="index.jsp>"><input type="button" value="ȸ������" class="join_button"> </a>
    
    </fieldset>
  </form>
    </div>	
	<footer align="center">
		201795025 ������ / 201795081 ���ְ�
	</footer>
</body>
</html>	