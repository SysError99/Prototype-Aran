//storage type : 0: WebApp, 1: localStorage
storagetype="0";
//variables
txtcmd="";
txtdata="";

// --- LocalStorage (play on browser, and iOS) ---
function get_storage_type(){
	return storagetype.replace("\"","");
}
function load_data(loc){
	//load from local
	var d=localStorage.getItem(loc);
	if(d!=null){
		//load
		txtdata=d;
	}
	else{
		//no data
		txtdata="";
	}
	//tell game back
	txtcmd="OK";
}
function save_data(loc,data){
	//save to local
	localStorage.setItem(loc,data.replace("\"",""));
	//tell game back
	txtcmd="OK";
}

// --- WebApp  ---
//prepare
function create_env(){
	clean();
}

function get_cmd(){
	//get current command (generally for checking browser respones "OK")
	return txtcmd.replace("\"","");
}

function get_data(){
	//get loaded data from browser
	return txtdata.replace("\"","");
}

function webview_get_data(){
	//get data (being used by app)
	txtcmd="OK";
	return txtdata.replace("\"","");;
}

function tell(strCmd,strData){
	//put command and data (being used by both web and app)
	txtcmd=strCmd;
	txtdata=strData;
}

function clean(){
	//clean all stuffs
	txtcmd="";
	txtdata="";
}