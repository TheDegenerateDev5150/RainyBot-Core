extends Message


class_name ImageMessage


var data_dic:Dictionary = {
	"type": "Image",
	"imageId": null,
	"url": null,
	"path": null,
	"base64": null
}


static func init(image:Resource)->ImageMessage:
	var f_path:String
	if image is Image:
		f_path = GlobalManager.cache_path + "image_cache_%s.png" % randi()
		var err:int = image.save_png(f_path)
		if err == OK:
			Console.print_success("成功将Image图像实例缓存至文件: %s"% f_path)
		else:
			Console.print_error("无法将Image图像实例缓存至文件 %s，请检查路径或权限是否有误!"% f_path)
	elif image is GifImage:
		f_path = GlobalManager.cache_path + "gif_image_cache_%s.gif" % randi()
		var err:int = image.save(f_path)
		if err == OK:
			Console.print_success("成功将GifImage图像实例缓存至文件: %s"% f_path)
		else:
			Console.print_error("无法将GifImage图像实例缓存至文件 %s，请检查路径或权限是否有误!"% f_path)
	else:
		Console.print_error("无法将指定的实例缓存至文件 %s，传入的实例需要是一个Image或GifImage类实例!"% f_path)
	var ins:ImageMessage = ImageMessage.new()
	var dic:Dictionary = ins.data_dic
	dic.path = f_path
	return ins


static func init_id(image_id:String)->ImageMessage:
	var ins:ImageMessage = ImageMessage.new()
	var dic:Dictionary = ins.data_dic
	dic.imageId = image_id
	return ins


static func init_url(image_url:String)->ImageMessage:
	var ins:ImageMessage = ImageMessage.new()
	var dic:Dictionary = ins.data_dic
	dic.url = image_url
	return ins


static func init_path(image_path:String)->ImageMessage:
	var ins:ImageMessage = ImageMessage.new()
	var dic:Dictionary = ins.data_dic
	dic.path = image_path
	return ins


static func init_base64(image_base64:String)->ImageMessage:
	var ins:ImageMessage = ImageMessage.new()
	var dic:Dictionary = ins.data_dic
	dic.base64 = image_base64
	return ins


static func init_meta(dic:Dictionary)->ImageMessage:
	var ins:ImageMessage = ImageMessage.new()
	ins.data_dic = dic
	return ins

	
func get_image_id()->String:
	return data_dic.imageId
	
	
func set_image_id(image_id:String)->void:
	data_dic.imageId = image_id
	
	
func get_image_url()->String:
	return data_dic.url
	
	
func set_image_url(image_url:String)->void:
	data_dic.url = image_url
	
	
func get_image_path()->String:
	return data_dic.path
	
	
func set_image_path(image_path:String)->void:
	data_dic.path = image_path
	
	
func get_image_base64()->String:
	return data_dic.base64
	
	
func set_image_base64(image_base64:String)->void:
	data_dic.base64 = image_base64


func get_as_text()->String:
	return "[图片:"+get_image_id()+"]"
