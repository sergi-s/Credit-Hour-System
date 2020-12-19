<?php

function connect()
{
  $user = "root";
  $pass = "";
  $link = mysqli_connect('localhost', $user, $pass, 'university management');
  if ($link) {
    return $link;
  } else {
    return 0;
    exit();
  }
}
