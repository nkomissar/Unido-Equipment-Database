
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>

<portlet:renderURL var="showPage2URL">
	<portlet:param name="action" value="showPage2" />
</portlet:renderURL>
<portlet:actionURL var="doSimpleFormURL">
	<portlet:param name="action" value="doSimpleForm" />
</portlet:actionURL>

<portlet:renderURL var="doAjaxLoadURL" windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>">
	<portlet:param name="action" value="doAjaxLoad" />
</portlet:renderURL>
<portlet:actionURL var="doAjaxURL">
	<portlet:param name="action" value="doAjax" />
</portlet:actionURL>

<a href="${showPage2URL}">Show me page 2</a>

<div id='pervonah-div'></div>

<script type="text/javascript">
	Ext.require([ 'Ext.form.*', 'Ext.layout.container.Column',
					'Ext.tab.Panel' ]);

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
				xtype : 'timefield',
				fieldLabel : 'Time',
				name : 'time',
				minValue : '8:00am',
				maxValue : '6:00pm'
			} ],

			buttons : [ {
				text : 'Load',
				handler : function() {
					fnLoadForm(simple);
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

	});

	function fnLoadForm(theForm) {
		//for the purpose of this tutorial, load 1 record.
		theForm.getForm().load({
			url : '${doAjaxLoadURL}',
			headers : {
				Accept : 'application/json, text/javascript, */*; q=0.01'
			},
			waitMsg : 'loading...',
			params : {
				id : 1
			},
			success : function(form, action) {
				//Ext.getCmp('mf.btn.add').setDisabled(false);		
				//Ext.getCmp('mf.btn.reset').setDisabled(false);		
				//Ext.getCmp('mf.btn.load').setDisabled(true);		
			},
			failure : function(form, action) {
				Ext.Msg.alert('Warning', 'Error Unable to Load Form Data.'); //action.result.errorMessage
			}
		});
	}

	function fnUpdateForm(theForm) {
		theForm.getForm().submit({
			success : function(form, action) {
				Ext.Msg.alert('Success', 'Data is stored in session.');
				form.reset();
			},
			failure : function(form, action) {
				Ext.Msg.alert('Warning', action.result.errorMessage);
			}
		});
	}
</script>
