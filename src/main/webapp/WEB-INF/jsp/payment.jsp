<html>

<head>
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>


<body>
	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<div class="span12">
					<form class="form-horizontal span6">
						<fieldset>
							<legend>Payment</legend>

							<div class="control-group">
								<label class="control-label">Card Holder's Name</label>
								<div class="controls">
									<input type="text" class="input-block-level"
										pattern="\w+ \w+.*" title="Fill your first and last name"
										required>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Card Number</label>
								<div class="controls">
									<div class="row-fluid">
										<div class="span3">
											<input type="text" class="input-block-level"
												autocomplete="off" maxlength="4" pattern="\d{4}"
												title="First four digits" required>
										</div>
										<div class="span3">
											<input type="text" class="input-block-level"
												autocomplete="off" maxlength="4" pattern="\d{4}"
												title="Second four digits" required>
										</div>
										<div class="span3">
											<input type="text" class="input-block-level"
												autocomplete="off" maxlength="4" pattern="\d{4}"
												title="Third four digits" required>
										</div>
										<div class="span3">
											<input type="text" class="input-block-level"
												autocomplete="off" maxlength="4" pattern="\d{4}"
												title="Fourth four digits" required>
										</div>
									</div>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Card Expiry Date</label>
								<div class="controls">
									<div class="row-fluid">
										<div class="span9">
											<select class="input-block-level">
												<option>January</option>
												<option>...</option>
												<option>December</option>
											</select>
										</div>
										<div class="span3">
											<select class="input-block-level">
												<option>2013</option>
												<option>...</option>
												<option>2015</option>
											</select>
										</div>
									</div>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Card CVV</label>
								<div class="controls">
									<div class="row-fluid">
										<div class="span3">
											<input type="text" class="input-block-level"
												autocomplete="off" maxlength="3" pattern="\d{3}"
												title="Three digits at back of your card" required>
										</div>
										<div class="span8">
											<!-- screenshot may be here -->
										</div>
									</div>
								</div>
							</div>

							<div class="form-actions">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="button" class="btn">Cancel</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>