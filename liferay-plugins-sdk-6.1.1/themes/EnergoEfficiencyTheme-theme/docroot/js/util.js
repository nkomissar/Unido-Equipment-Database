var curLayoutURL = themeDisplay.getURLHome()+themeDisplay.getLayoutURL();
var baseLayoutURL = curLayoutURL.substring(0,curLayoutURL.lastIndexOf('/')+1);
var googleMapsPortletId = '1_WAR_googlemapsportlet_INSTANCE_6JPfMHK5Tf0v';
LiferayMy = {
	curLayoutURL: curLayoutURL,
	baseLayoutURL: baseLayoutURL,
	calEventDetailsURL: 'events/-/asset_publisher/WospreYj8uVk/event/id/',
	addressUrlTpl: baseLayoutURL +  'karta?p_p_id='+googleMapsPortletId+'&p_p_lifecycle=1&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_'+googleMapsPortletId+'_cmd=saveMapAddress&mapAddress=',
	calEventsCategoryFilterURL: baseLayoutURL+'events?p_p_id=101_INSTANCE_WospreYj8uVk&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=_118_INSTANCE_K3aJFtHCwUPz__column-2&p_p_col_count=1&p_r_p_564233524_categoryId=',
	newsCategoryFilterURL: baseLayoutURL+'news?p_p_id=101_INSTANCE_2aj4lYfD76Ua&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=_118_INSTANCE_zvwiJPGj2eDS__column-2&p_p_col_count=1&p_r_p_564233524_categoryId=',
	newsTagFilterURL: baseLayoutURL+'news?p_p_id=101_INSTANCE_2aj4lYfD76Ua&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=_118_INSTANCE_zvwiJPGj2eDS__column-2&p_p_col_count=1&p_r_p_564233524_tag=',
	docsGoToFolderURL: baseLayoutURL+'docs?_20_displayStyle=icon&_20_viewEntries=1&_20_viewFolders=1&_20_struts_action=%2Fdocument_library%2Fview&_20_action=browseFolder&_20_entryEnd=20&_20_folderEnd=20&_20_expandFolder=0&_20_entryStart=0&_20_folderStart=0&p_p_id=20&p_p_lifecycle=0&_20_folderId='
};

LiferayMy.decorators = {};

LiferayMy.decorators.decorateCommon = {};
LiferayMy.decorators.decorateCommon.readyState = false;
LiferayMy.decorators.decorateCommon.process = function(){
	if (!LiferayMy.decorators.decorateCommon.readyState){
		LiferayMy.decorators.decorateCommon.readyState = true;
	}	
};

LiferayMy.decorators.decorateNestedPortletHeader = function(imageFileName){
	LiferayMy.decorators.decorateCommon.process();
	var portletTitleEl = Ext.get(Ext.DomQuery.selectNode('h1.portlet-title'));
	var iconSpan = portletTitleEl.select('span').elements[0];
	iconSpan.innerHTML = '<a href="'+Liferay.ThemeDisplay.getLayoutURL()+'"><img src="/EnergoEfficiencyTheme-theme/images/myPics/portlets/'+imageFileName+'" style="left: 829px;position: relative;top: -23px; z-index: 1;"></a>';
		
	Ext.get(Ext.DomQuery.selectNode('span.portlet-title-text')).on({
		click: function(){
			window.location = Liferay.ThemeDisplay.getLayoutURL();
		}
	});
 };
 
LiferayMy.decorators.decorateTagsList = function(){
	LiferayMy.decorators.decorateCommon.process();
	var tagsSpanList =  Ext.DomQuery.select('span.taglib-asset-tags-summary');
	Ext.each(tagsSpanList,function(tagsSpan){
		Ext.get(tagsSpan).insertHtml('afterBegin',Liferay.Language.get('newsTags')+':');
	});
};

LiferayMy.decorators.addRegularPaging  = function(){
	LiferayMy.decorators.decorateCommon.process();
	// paging navigation (from regular paging)
	var portletTitleEl = Ext.get(Ext.DomQuery.selectNode('h1.portlet-title'));
	var pagesNavigationEl = Ext.get(Ext.DomQuery.selectNode('div.search-pages'));
	if (pagesNavigationEl){
		portletTitleEl.appendChild(pagesNavigationEl);
		
		var pageSelectorCombo = Ext.get(Ext.DomQuery.selectNode('div.page-selector select'));
		var pageSelectorComboParent = pageSelectorCombo.parent();
		pageSelectorComboParent.dom.innerHTML = pageSelectorCombo.getValue();
			
		var pageSelectorEl = Ext.get(Ext.DomQuery.selectNode('div.page-selector'));
		var pageLinksEl = Ext.get(Ext.DomQuery.selectNode('div.page-links'));
		pageLinksEl.appendChild(pageSelectorEl);
	}else{
		var oneOfOnePagingHtml = '<div class="search-pages">'+
			'<div class="page-links">'+
				'<span class="first"> First </span>'+
				'<span class="previous"> Previous </span>'+
				'<span class="next">	Next </span>'+
				'<span class="last"> Last </span>'+
				'<div class="page-selector" id="ext-gen1053">'+
					'<span class="aui-field aui-field-select aui-field-menu">'+
						'<span class="aui-field-content">'+
							'<label for="page" class="aui-field-label-inline-label">	Page </label>'+
							'<span class="aui-field-element " id="ext-gen1052">1</span> <span class="aui-suffix"> of 1 </span>'+
						'</span> '+
					'</span>'+
				'</div>'+
			'</div>'+
		'</div>';
		portletTitleEl.insertHtml('beforeEnd',oneOfOnePagingHtml);
	}
  };

LiferayMy.decorators.overrideCategoriesNavigationLinks = function(portletCategoryFilterURL){
	LiferayMy.decorators.decorateCommon.process();	
	var hrefs = Ext.DomQuery.select('div.lfr-asset-category-list-container a');
	Ext.each(hrefs, function(href){
		var hrefParts = href.href.split('&');
		var categoryId = null;
		Ext.each(hrefParts,function(hrefPart){
			if (hrefPart.indexOf('categoryId') != -1){
				categoryId = hrefPart.substring(hrefPart.indexOf('categoryId')+'categoryId'.length+1);
			}
		});
		if(categoryId)
			href.href = portletCategoryFilterURL + categoryId;	
	});
};

LiferayMy.decorators.overrideTagsNavigationLinks = function(portletTagFilterURL){
	LiferayMy.decorators.decorateCommon.process();
	var hrefs = Ext.DomQuery.select('div.portlet-asset-tags-navigation a');
	Ext.each(hrefs, function(href){
		var hrefParts = href.href.split('&');
		var tag;
		Ext.each(hrefParts,function(hrefPart){
			if (hrefPart.indexOf('tag') != -1){
				tag = hrefPart.substring(hrefPart.indexOf('tag')+'tag'.length+1);
			}
		});
		if(tag)
			href.href = portletTagFilterURL + tag;	
	});
};

Ext.onReady(function(){
	
	Ext.ns('IBS.util');
	Ext.define('IBS.util.Ajax',{
		request: function(options){
			var failureNew = function(form, action){			
				switch (action.failureType) {
			    	case Ext.form.action.Action.CLIENT_INVALID:
			    		Ext.Msg.alert('Серверная ошибка', 'Обращение к серверу было осуществлено с некорректными данными. Если ошибка повторяется регулярно, обратитесь к администратору.');
			            break;
			        case Ext.form.action.Action.CONNECT_FAILURE:
			            Ext.Msg.alert('Серверная ошибка', 'Сетевая ошибка при обращении к серверу. Если ошибка повторяется регулярно, обратитесь к администратору.');
			            break;
			        case Ext.form.action.Action.SERVER_INVALID:
			            Ext.Msg.alert('Серверная ошибка', 'При обращении к серверу возникла ошибка. Детализация ошибки: '+action.result.msg);
			            if (options.failure)
							options.failure.call(form, action);
				}			
			};
			options.failure = failureNew;		
		    Ext.Ajax.request(options);
		}
	});
	IBS.Ajax = Ext.create('IBS.util.Ajax');
	
	Ext.define('IBS.util.Msg',{
		constructor: function(){
			this.confirm = function(title, msg){
				Ext.Msg.alert(title,msg);
			};
			this.alert = function(msg){
				Ext.Msg.alert('Ошибка',msg);
			};
			this.question = function(title, msg, okAction, noAction){
				Ext.Msg.show({
					title:title,
					msg: msg,
					buttons: Ext.Msg.YESNO,
					icon: Ext.Msg.QUESTION,
					fn: function(buttonId){
						if (buttonId == 'yes'){		    		 
							if (okAction)
								okAction.call();
						}
					}
				});
			};
		}
	});
	IBS.Msg = Ext.create('IBS.util.Msg');
	
	Ext.define('IBS.util.URL',{
		constructor: function(){
			var CommonPart = '/EnergoEfficiencyServices/';
			var links = {
				'addRssFeed': CommonPart+'rss/addRssFeed',
				'editRssFeed': CommonPart+'rss/editRssFeed',
				'getRssFeedsList': CommonPart+'rss/getRssFeedsList',
				'deleteRssFeed': CommonPart+'rss/deleteRssFeed'
			};
			this.getLink = function(action){
				return links[action];
			};
		}
	});
	IBS.URL = Ext.create('IBS.util.URL');
		
});