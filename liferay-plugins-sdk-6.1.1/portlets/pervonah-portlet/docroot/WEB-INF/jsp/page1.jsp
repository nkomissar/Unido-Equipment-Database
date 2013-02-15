
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>

<portlet:renderURL var="showPage2URL">
	<portlet:param name="action" value="showPage2" />
</portlet:renderURL>
<portlet:actionURL var="doSimpleFormURL">
	<portlet:param name="action" value="doSimpleForm" />
</portlet:actionURL>

<portlet:renderURL var="doAjaxLoadURL" windowState="<%=LiferayWindowState.EXCLUSIVE.toString()%>">
	<portlet:param name="action" value="doAjaxLoad" />
</portlet:renderURL>

<portlet:resourceURL id="doAjaxPost" var="doAjaxURL" />

<portlet:renderURL var="doEntityLoadURL" windowState="<%=LiferayWindowState.EXCLUSIVE.toString()%>">
	<portlet:param name="action" value="doEntityLoad" />
</portlet:renderURL>



<a href="${showPage2URL}">Show me page 2</a>

<div id='pervonah-div'></div>

<script type="text/javascript">
	Ext
			.require([ 'Ext.form.*', 'Ext.layout.container.Column',
					'Ext.tab.Panel', 'Ext.util.*' ]);

	Ext.onReady(function() {

		var myDiv = Ext.get('pervonah-div');

		var simple = new Ext.FormPanel({
			url : '${doAjaxURL}',
			frame : true,
			title : 'Simple Form',
			bodyStyle : 'padding:5px 5px 0',
			width : 350,
			fieldDefaults : {
				msgTarget : 'side',
				labelWidth : 75
			},
			defaultType : 'textfield',
			defaults : {
				anchor : '100%'
			},

			items : [ {
				fieldLabel : 'First Name',
				name : 'first',
				allowBlank : false
			}, {
				fieldLabel : 'Last Name',
				name : 'last'
			}, {
				fieldLabel : 'Company',
				name : 'company'
			}, {
				fieldLabel : 'Email',
				name : 'email',
				vtype : 'email'
			}, {
				xtype : 'datefield',
				fieldLabel : 'Date',
				name : 'date',
				format: 'm d Y'
		        //,altFormats: 'm,d,Y|m.d.Y'
			} ],

			buttons : [ {
				text : 'Load',
				handler : function() {
					fnLoadForm(simple, '${doAjaxLoadURL}');
				}
			}, {
				text : 'Ajax',
				handler : function() {
					fnUpdateForm(simple);
				}
			}, {
				text : 'Save',
				handler : function() {
					this.up('form').getForm().submit({
						url : '${doSimpleFormURL}',
						submitEmptyText : false,
						waitMsg : 'Saving Data...'
					});
				}
			}, {
				text : 'Cancel'
			} ]
		});

		simple.render(myDiv);
		
		var entityForm = new Ext.FormPanel({
			url : '${doEntityLoadURL}',
			frame : true,
			title : 'Entity Form',
			bodyStyle : 'padding:5px 5px 0',
			width : 350,
			fieldDefaults : {
				msgTarget : 'side',
				labelWidth : 75
			},
			defaultType : 'textfield',
			defaults : {
				anchor : '100%'
			},

			items : [ {
				fieldLabel : 'ID',
				name : 'id',
				allowBlank : false
			}, {
				fieldLabel : 'Name',
				name : 'name'
			}, {
				fieldLabel : 'Entity Type',
				name : 'entityType'
			}],

			buttons : [ {
				text : 'Load',
				handler : function() {
					fnLoadForm(entityForm, '${doEntityLoadURL}');
				}
			}]
		});

		entityForm.render(myDiv);

	});

	function fnLoadForm(theForm, handlerUrl) {

		theForm.getForm().load({
			url : handlerUrl,
			headers : {
				Accept : 'application/json, text/javascript, */*; q=0.01'
			},
			//waitMsg : 'loading...',
			params : {
				id : 1
			},
			failure : function(form, action) {
				Ext.Msg.alert('Warning', 'Error Unable to Load Form Data.'); //action.result.errorMessage
			}
		});
	}

	function fnUpdateForm(theForm) {

		var formData = Ext.encode(theForm.getForm().getValues());
		var data = Ext.JSON.encode(formData);
		
		Ext.Ajax.request({
			url : '${doAjaxURL}',
			method : 'POST',
			headers : {
				'Content-Type' : 'application/json;charset=UTF-8'
			},
			//params : {
			//	myClass : data
			//},
			//jsonData : {
			//	myClass : theForm.getForm().getValues()
			//},
			jsonData : theForm.getForm().getValues(),
			success : function(form, action) {
				Ext.Msg.alert('Success', 'Data is stored in session.');
				theForm.getForm().reset();
			},
			failure : function(form, action) {
				Ext.Msg.alert('Warning', action.result.errorMessage);
			}
		});

	}
</script>
