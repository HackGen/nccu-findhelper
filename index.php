<?php 
  require_once('src/facebook.php');
  
  //APP的 ID 與 secret
  $config = array(
    'appId' => '536722683073451',
    'secret' => '2142a7e3c7e1a7c1f73ddff3b4006284',
  );
  
  //Facebook 連線
  $facebook = new Facebook($config);
  $user_id = $facebook->getUser();
?>
<html>
  <head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<!--<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://www.modernizr.com/downloads/modernizr-latest.js"></script>-->
  </head>
  <body>
  <?php
    if($user_id) {
      try {
	  header("Location: ppllink");
        //$user_profile = $facebook->api('/me','GET');
        //echo "Name: " . $user_profile['name'] . "Key: " . $user_profile['id'];
	//$user_friends = $facebook->api('/me/friends','GET');
	//$access_token = $facebook->getAccessToken();
	//echo '<br/>';
	//echo $access_token;
	
	//$user_friends2 = $facebook->api('/me/friends?fields=education,work&access_token=' . $access_token,'GET');

	//file_put_contents("./tmp/" .  $user_profile['id'] . "_data.json", json_encode($user_friends, JSON_UNESCAPED_UNICODE));
	//file_put_contents("./tmp/" .  $user_friend2 . "ff_data.json", json_encode($user_friends, JSON_UNESCAPED_UNICODE));
	//echo "<br/>";
	//print_r($user_friends2);
	//print_r($user_friends2["data"]);
	//foreach ($user_friends["data"] as $key => $value) {
		//echo $value['id'] . $value['name'] . "<br/>";
		//$friend = $facebook->api('/' . $value[id] . '?fields=id,name,work,education&access_token=' . $access_token,'GET');
				
		//print_r($friend);
		//echo "<br/>";
	//}

      } catch(FacebookApiException $e) {
        $login_url = $facebook->getLoginUrl(); 
    	echo '<form id="slick-login" action=""><input type="button" value="FaceBook Log In" onclick="window.location.href=\'' . $login_url . '\'"></form>';
      } catch(Exception $ee) {
	      echo $ee;
      }  
    } else { 
      $login_url = $facebook->getLoginUrl();
      echo '<form id="slick-login" action=""><input type="button" value="FaceBook Log In" onclick="window.location.href=\'' . $login_url . '\'"></form>';
    }
  ?>
  </body>
</html>
