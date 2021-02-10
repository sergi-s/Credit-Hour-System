<html>
<center>
	<html>
	<?php
	include "db_connect.php";
	$link = connect();
	session_start();

	$query = mysqli_query($link, "SELECT distinct(course_id),c_name FROM course NATURAL JOIN dept WHERE c_sem = '" . $_SESSION['user_sem'] . "' AND dept_id = '" . $_SESSION['user_dep'] . "' AND course_id NOT IN (SELECT c_id FROM enrolled WHERE std_id = '" . $_SESSION['user_id'] . "' )");
	$row_cnt = mysqli_num_rows($query);
	// echo (mysqli_error($link));

	if (!$row_cnt != 0) {
		echo "No available courses .. redirecting ...";
		header('refresh:1;url=student.php');
	}
	?>

	<head>

		<title>Enroll Course</title>

	</head>

	<style>
		a:visited {
			color: white;
		}

		.img-circle {
			border-radius: 50%;
		}

		#background {
			width: 100%;
			height: 100%;
			position: fixed;
			left: 0px;
			top: 0px;
			z-index: -1;
		}

		.stretch {
			width: 100%;
			height: 100%;
		}
	</style>

	<body link="white">
		<div id="background">
			<img src="Images/bg2.jpg" class="stretch" alt="" />
		</div>
		<font color="white">
			<div id="header">
				<h2 id="h2"> Courses to Enroll Into </h2>
			</div>
			<form name="new_course" id="cform" method="POST" action="">
				<div id="formdiv">
					<div id="inputbox">
						<label for="cname">Course Title</label>
						<select name="cname" id="cname">

							<?php
							$query = mysqli_query($link, "SELECT DISTINCT(course_id),c_name FROM course NATURAL JOIN dept WHERE c_sem = '" . $_SESSION['user_sem'] . "' AND dept_id = '" . $_SESSION['user_dep'] . "' AND course_id NOT IN (SELECT c_id FROM enrolled WHERE std_id = '" . $_SESSION['user_id'] . "' )");
							$row_cnt = mysqli_num_rows($query);
							echo (mysqli_error($link));
							if (!$row_cnt != 0) {
								echo "No available courses .. redirecting ...";
							} else {
								while ($res = mysqli_fetch_array($query)) {
									print_r($res);
							?>
									<option value="<?php echo $res['course_id']; ?>"><?php echo $res['c_name']; ?></option>


								<?php
								}
								?>
						</select>
					</div><br>
					<div id="inputbox">
						<input type="submit" name="submit" class="button" value="Enroll">
					</div><br>
				<?php
							}
				?>
			</form>
			</div>
	</body>

	</html>

	<?php

	if (isset($_POST['submit'])) {
		$cname = $_POST['cname'];



		if ($link) {
			$query1 = mysqli_query($link, "insert into enrolled (std_id,c_id) values('" . $_SESSION['user_id'] . "','" . $cname . "')");

			if ($query1) {
				$msg = "Course Added Succesfully";
				header('refresh:2;url=student.php');
			} else {
				echo $link->error;
				$msg = "Query1 did not execute";
			}
		}
		if (isset($msg)) {
			echo '<div id="msgdiv"><h3>' . $msg . '</h3></div>';
		}
	}

	?>
	</font>
</center>