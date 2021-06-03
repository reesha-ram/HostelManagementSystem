<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet" type="text/css" href="stylesheet/style.css" />
</head>
<style>
.button {
  background-color:pink;
  -webkit-border-radius: 10px;
  border-radius: 40px;
  border: none;
  color: pink;
  cursor: pointer;
  display: inline-block;
  font-family: Arial;
  font-size: 50px;
  padding: 20px 10px;
  text-align: center;
  text-decoration: none;
  -webkit-animation: glowing 1500ms infinite;
  -moz-animation: glowing 1500ms infinite;
  -o-animation: glowing 1500ms infinite;
  animation: glowing 1500ms infinite;
  position: absolute;
top: 4px;
right: 10px;
}
@-webkit-keyframes glowing {
  0% { background-color: #B20000; -webkit-box-shadow: 0 0 3px #B20000; }
  50% { background-color: #FF0000; -webkit-box-shadow: 0 0 40px #FF0000; }
  100% { background-color: #B20000; -webkit-box-shadow: 0 0 3px #B20000; }
}

@-moz-keyframes glowing {
  0% { background-color: #B20000; -moz-box-shadow: 0 0 3px #B20000; }
  50% { background-color: #FF0000; -moz-box-shadow: 0 0 40px #FF0000; }
  100% { background-color: #B20000; -moz-box-shadow: 0 0 3px #B20000; }
}

@-o-keyframes glowing {
  0% { background-color: #B20000; box-shadow: 0 0 3px #B20000; }
  50% { background-color: #FF0000; box-shadow: 0 0 40px #FF0000; }
  100% { background-color: #B20000; box-shadow: 0 0 3px #B20000; }
}

@keyframes glowing {
  0% { background-color: #B20000; box-shadow: 0 0 3px #B20000; }
  50% { background-color: #FF0000; box-shadow: 0 0 40px #FF0000; }
  100% { background-color: #B20000; box-shadow: 0 0 3px #B20000; }
}
</style>
  

<div class="banner">
    <table>
        <tr>
            <td>
                <img src="media/logo.jpg" height="120"/>
            </td>
            <td>
                <div class="title">
                    CEGHOSTELS<br/>
                </div>
                <div class="name">
                    Halls of Students Residence<br/>
                     <a href="1.jsp" class="button" role="button">Homepage</a>
                </div>
            </td>
      
        </tr>
    </table>
</div>
    
