<%--
<html>
<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript" ></script>
<script type="text/javascript">
    $(document).ready(function() {
        alert("Data:  Status: ");
    });
</script>
<body>
<button id="test">Load</button>
</body>
</html>--%>

<%@ page import="java.sql.*"%>

<%
    String s=request.getParameter("val");
    if(s==null || s.trim().equals("")){
        out.print("Please enter id");
    }else{
        int id=Integer.parseInt(s);
        out.print(id);
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mdb","root","root");
            PreparedStatement ps=con.prepareStatement("select * from emp where id=?");
            ps.setInt(1,id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                out.print(rs.getInt(1)+" "+rs.getString(2));
            }
            con.close();
        }catch(Exception e){e.printStackTrace();}
    }
%>
