
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet"%>

<portlet:renderURL var="showPage2URL">
	<portlet:param name="action" value="showPage2" />
</portlet:renderURL>
<portlet:actionURL var="doSimpleFormURL">
	<portlet:param name="action" value="doSimpleForm" />
</portlet:actionURL>

<a href="${showPage2URL}">Show me page 2</a>

<div id='pervonah-div'></div>

<script type="text/javascript">

	Ext.require([ 'Ext.form.*', 
	              'Ext.layout.container.Column',
				  'Ext.tab.Panel' ]);

	Ext.onReady(function() {

		var myDiv = Ext.get('pervonah-div');

		var simple = Ext.create('Ext.form.Panel', {
			url : '${doSimpleFormURL}',
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
</script>