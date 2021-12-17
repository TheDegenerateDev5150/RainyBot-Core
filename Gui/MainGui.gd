extends Control


func _ready():
	DisplayServer.window_set_title("RainyBot-Gui")
	$TabContainer.set_tab_title(0,"RainyBot控制台")
	Console.print_success("成功加载 RainyBot-Gui | 版本:V2.0-Beta-1 | 作者:Xwdit")
	RainyBotCore.start()


func _process(_delta):
	$Status.text = "协议后端:Mirai | %s | Bot ID:%s" % ["已连接" if BotAdapter.is_bot_connected() else "未连接", str(BotAdapter.get_bot_id())]