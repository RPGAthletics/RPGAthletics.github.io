extends EzNode

var bg_with_guy: TextureRect
var bg_rpg_logo: TextureRect
var bg_rpg_arrow: TextureRect
var button_rpg_logo: TextureButton
var button_blog: TextureButton
var button_video: TextureButton
var button_faq: TextureButton
var button_about: TextureButton
var button_contact: TextureButton
var button_youtube: TextureButton
var button_ig: TextureButton
var button_tiktok: TextureButton

var main_content: Control
var blog_content: Control
var video_content: Control
var faq_content: Control
var about_content: Control
var contact_content: Control

var contents: Array[Array]


func _ready():
	super()

	contents = [
		[main_content, null],
		[blog_content, button_blog],
		[video_content, button_video],
		[faq_content, button_faq],
		[about_content, button_about],
		[contact_content, button_contact]
	]

	button_rpg_logo.connect("pressed", func(): show_content(main_content))
	button_blog.connect("pressed", func(): show_content(blog_content))
	button_video.connect("pressed", func(): show_content(video_content))
	button_faq.connect("pressed", func(): show_content(faq_content))
	button_about.connect("pressed", func(): show_content(about_content))
	button_contact.connect("pressed", func(): show_content(contact_content))
	(
		button_youtube
		. connect("pressed", func(): OS.shell_open("https://www.youtube.com/@RPGAthletics"))
	)
	button_ig.connect("pressed", func(): OS.shell_open("https://www.instagram.com/RPGAthletics/"))
	button_tiktok.connect("pressed", func(): OS.shell_open("https://www.tiktok.com/@rpgathletics"))

	button_rpg_logo.emit_signal("pressed")


func show_bg_rpg_arrow_only():
	bg_rpg_logo.visible = false
	bg_rpg_arrow.visible = true


func show_bg_rpg_logo_only():
	bg_rpg_logo.visible = true
	bg_rpg_arrow.visible = false


func show_content(content: Control):
	if content == main_content:
		show_bg_rpg_logo_only()
	else:
		show_bg_rpg_arrow_only()
	for x in contents:
		var the_content = x[0]
		var the_button = x[1]
		var is_the_content = the_content == content
		the_content.visible = is_the_content
		if the_button != null:
			the_button.texture_normal = the_button.texture_hover if is_the_content else null
