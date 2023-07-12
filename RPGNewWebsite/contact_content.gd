extends EzNode

var line_edit_name: LineEdit
var line_edit_email: LineEdit
var line_edit_subject: LineEdit
var text_edit_message: TextEdit
var button_submit: Button

var http_request_send_to_server: HTTPRequest

const server_ip := "75.157.176.197"


func _ready():
	super()
	button_submit.pressed.connect(func():
		if http_request_send_to_server.get_http_client_status() != 0:
			return
		var x = {}
		x.name = line_edit_name.text
		x.email = line_edit_email.text
		x.subject = line_edit_subject.text
		x.message = text_edit_message.text

		# Send the request
		http_request_send_to_server.request(
			"http://"+ server_ip + ":6996",
			["Content-Type: application/json"],
			HTTPClient.METHOD_POST,
			JSON.stringify(x)
		)
	)


func _process(delta):
	button_submit.text = "SUBMIT" if http_request_send_to_server.get_http_client_status() == 0 else "Submitting..."
