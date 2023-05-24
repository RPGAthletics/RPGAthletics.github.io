extends  RpgWebsite


var name_line_edit: LineEdit
var email_line_edit: LineEdit
var subject_line_edit: LineEdit
var message_text_edit: TextEdit
var submit_button: TextureButtonLabel
var message: Label


func _ready():
	name_line_edit = find_node("NameLineEdit")
	email_line_edit = find_node("EmailLineEdit")
	subject_line_edit = find_node("SubjectLineEdit")
	message_text_edit = find_node("MessageTextEdit")
	submit_button = find_node("SubmitButton")
	message = find_node("Message")



	submit_button.connect("pressed", self, "submit_button_pressed")


func submit_button_pressed():
	if len(name_line_edit.text) == 0:
		message.text = "Please enter your name."
	elif len(email_line_edit.text) == 0:
		message.text = "Please enter your email."
	elif len(subject_line_edit.text) == 0:
		message.text = "Please enter a subject."
	else:
		message.text = "Thank you, %s. We have received your message about \"%s\"." % [name_line_edit.text, subject_line_edit.text]
		name_line_edit.text = ""
		email_line_edit.text = ""
		subject_line_edit.text = ""






