extends CanvasLayer


onready var rpg_title_icon = $"Fill/Top/RpgTitleIcon"
onready var button_shop = $"Fill/Top/TopHBoxC/Label/ButtonShop"
onready var button_blog = $"Fill/Top/TopHBoxC/Label2/ButtonBlog"
onready var button_youtube = $"Fill/SocialMediaIcons/ButtonYoutubeIcon"


func _ready():
    rpg_title_icon.connect("pressed", self, "rpg_title_icon_pressed")
    button_shop.connect("pressed", self, "button_shop_pressed")
    button_youtube.connect("pressed", self, "button_youtube_pressed")



func button_shop_pressed():
	get_tree().change_scene("res://RpgWebsiteShop.tscn")

func rpg_title_icon_pressed():
    get_tree().change_scene("res://RpgWebsiteMainPage.tscn")

func button_youtube_pressed():
    OS.shell_open("https://www.youtube.com/@RPGMovement")