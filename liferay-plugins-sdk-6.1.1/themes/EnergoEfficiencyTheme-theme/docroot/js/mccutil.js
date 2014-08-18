var Portlet = {};

Portlet.sizeUtils = {};

Portlet.sizeUtils.getClientWidth = function(){ //ext. GetWidth
	var x = 0;
	if (self.innerHeight){
		x = self.innerWidth;
	}else if (document.documentElement && document.documentElement.clientHeight){
		x = document.documentElement.clientWidth;
	}else if (document.body){
		x = document.body.clientWidth;
	}
	return x;
};

Portlet.sizeUtils.getClientHeight = function(){ //ext. GetHeight
	var y = 0;
	if (self.innerHeight){
		y = self.innerHeight;
	}else if (document.documentElement && document.documentElement.clientHeight){
		y = document.documentElement.clientHeight;
	}else if (document.body){
		y = document.body.clientHeight;
	}
	return y;
};

Portlet.sizeUtils.getHeightWithoutDockbar = function(){ //ext. GetResultHeight
	var upperMenuHeight = 68;
	if (document.getElementById('dockbar'))
		upperMenuHeight += 31;
	return Portlet.sizeUtils.getClientHeight()-upperMenuHeight;
};

/* Класс загрузчика (из НСИ) */

Portlet.JSLoader = {

/* Загрузка файлов из списка fileList, если preserveOrder, то в указанном
  порядке. Если указан callback, тот вызывается после успешной загрузки
  в контексте scope */
		
	load: function(fileList, callback, scope, preserveOrder) {
	
	 scope = scope || this;
	 var head = document.getElementsByTagName("head")[0];
	 var fragment = document.createDocumentFragment();
	 var numFiles = fileList.length;
	 var loadedFiles = 0;
	 var me = this;
	     
	 var loadFileIndex = function(index) {
	   head.appendChild(me.buildScriptTag(fileList[index], onFileLoaded));
	 };
	     
	 var onFileLoaded = function() {
	   loadedFiles++;
	   if (numFiles == loadedFiles && typeof callback == 'function') {
	     callback.call(scope);} 
	   else if (preserveOrder === true) 
	     loadFileIndex(loadedFiles);
	 };
	     
	 if (preserveOrder === true) 
	   loadFileIndex.call(this, 0);
	 else {
	   Ext.each(fileList, function(file, index) {
	     fragment.appendChild(this.buildScriptTag(file, onFileLoaded));}, this);
	   head.appendChild(fragment);}
	},
	
	/* Создаём и возвращаем скриптовый таг с указанным именем, после загрузки вызываем callback */    
	buildScriptTag: function(file, callback) {
	
	 if (file.id == undefined && file.src == undefined)
	   file = {id: file, src: file};
	   
	 var id = file.id, filename = file.src;
	
	 var existNode = document.getElementById(id);
	 if (existNode) {
	   document.getElementsByTagName("head")[0].removeChild(existNode);
	 }
	 var script = document.createElement('script');
	 script.type = "text/javascript";
	 script.src = filename;
	 script.id = id;
	 if (script.readyState) {
	   script.onreadystatechange = function() {
	     if (script.readyState == "loaded" || script.readyState == "complete") {
	       script.onreadystatechange = null;
	       callback();
	     }};} 
	 else 
	   script.onload = callback;
	 return script;
	}
};
