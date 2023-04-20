extends Node2D

onready var save_file = SaveFile.g_data

var item_list = ["pink_flowers", "orange_flowers","purple_flowers", "magenta_flowers",
"white_flowers","yellow_flowers","white_flower_bed","yellow_flower_bed","pink_flower_bed",
"blue_picnic","pink_picnic","blue_seesaw","red_seesaw","tan_seesaw","sandbox",
"blue_trampoline","yellow_trampoline"]

var price_list = [100,100,100,100,100,100,300,300,300,
1000,1000,1250,1250,1250,1500,3000,3000]

var item_count = 0
var item = 0

func _ready():
	$CanvasLayer/icon.play(item_list[item])
	item_count = item_list.size() - 1
	item = 0

func _physics_process(delta):
	if self.visible == true:
		$CanvasLayer/pricelabel.set_text(str(price_list[item]))
		$CanvasLayer/icon.play(item_list[item])

func _on_buttonleft_pressed():
	if (item - 1) >= 0:
		item -= 1
	else:
		item = item_count

func _on_buttonright_pressed():
	if (item + 1) <= item_count:
		item += 1
	else:
		item = 0

func _on_buybutton_pressed():
	if price_list[item] < save_file.gold and save_file.ownedList[item] == false:
		buy()

func buy():
	save_file.gold -= price_list[item]
	save_file.ownedList[item] = true
	SaveFile.save_data()
