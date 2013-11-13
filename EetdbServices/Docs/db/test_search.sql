call eetdb.search('Тест');

call eetdb.search('engine');

call eetdb.search_topic('насос');

call eetdb.search_entities('BOILER',
'<properties>
	<property>
		<code>VOLTAGE</code>
		<value>380</value>
		<min/>
		<max/>
	</property>
	<property>
		<code>ENGINE_IE_CLASS</code>
		<value>49</value>
		<min/>
		<max/>
	</property>
</properties>');

