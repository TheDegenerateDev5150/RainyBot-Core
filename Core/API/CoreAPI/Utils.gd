extends CoreAPI


class_name Utils


static func get_formated_time()->String:
	var os_time = Time.get_time_dict_from_system()
	var hour = get_beautifuler_num(os_time.hour)
	var minute = get_beautifuler_num(os_time.minute)
	var second = get_beautifuler_num(os_time.second)
	var time = hour + ":" + minute + ":" + second
	return time


static func get_beautifuler_num(num)->String:
	if num < 10:
		return "0"+str(num)
	else:
		return str(num)


static func send_http_get_request(url:String,timeout:int=20)->HttpRequestResult:
	var result = await HttpRequestManager.send_http_get_request(url,timeout)
	return result


static func send_http_post_request(url:String,request_data="",headers:PackedStringArray=PackedStringArray([]),timeout:int=20)->HttpRequestResult:
	var result = await HttpRequestManager.send_http_post_request(url,request_data,headers,timeout)
	return result