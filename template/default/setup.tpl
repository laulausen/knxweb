<html xmlns:v="urn:schemas-microsoft-com:vml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache, must-revalidate" />
		
		<title>{$_config.title}</title>
		{foreach from=$cssList item=css}
		<link rel="stylesheet" type="text/css" href="{$css}" />
		{/foreach}
		<script type="text/javascript" >
		var tab_config = {$json_config};
		var _widgets = {$widgets|json_encode};
		</script>
		{foreach from=$jsList item=js}
		<script type="text/javascript" src="{$js}"></script>
		{/foreach}
</head>
<body>

<div id="loaderModal">
	<div id="loaderContent">
		<img src="images/loading.gif" /><br /><br />
		Chargement en cours, veuillez patienter
	</div>
</div>

<div id="widgetsTemplate" style="display: none;">

	{foreach from=$widgets key=id item=i}
		{include file="widgets/$id/widget.html"}
	{/foreach}

</div>

<div id="images-manager-dialog">
	<div class="upload">
		Send a new file : <input name="file" id="images-manager-dialog-file" type="file">
	</div>
	<div class="info"></div>
	<div class="images">
	</div>
</div>

<div id="colorpicker-dialog">
	<div id="colorpicker-dialog-picker"></div> 
	<div>
		<label for="colorpicker-dialog-input">Color: </label>
		<input type="text" id="colorpicker-dialog-input" name="colorpicker-dialog-input" size="12" />
		<input type="button" id="colorpicker-dialog-none" value="None" />
	</div>
</div>

{include file='action_editor.tpl'}

<div id="wrap">
	<div id="leftContent">
		<div id="appTitle">KnxWeb {$_config.version}</div>
		<div class="title">Menu</div>
		<div id="leftMenu" class="ui-helper-reset">
			<h3 tab_id="setup" tab_label="Configuration"><a href="#"><img src="images/setup.png"> Configuration</a></h3>
			<div>
				<div class="subItem" tab_id="general" tab_label="Général" tab_url="setup_general.php"><img src="images/home.png" /> General</div>
				<div class="subItem" tab_id="smsgateway" tab_label="Gateway SMS" tab_url="setup_smsgateway.php"><img src="images/phone.png" /> SMS gateway</div>
				<div class="subItem" tab_id="emailserver" tab_label="Serveur SMTP" tab_url="setup_emailserver.php"><img src="images/mail.png" /> SMTP</div>
				<div class="subItem" tab_id="logging" tab_label="Logging" tab_url="setup_logging.php"><img src="images/logging.png" /> Logging</div>
			</div>

			<h3 tab_id="objects" tab_label="Objets" tab_url="setup_objects.php"><a href="#"><img src="images/object.png"> Objets</a></h3>
			<div>
				<div class="subItem" id="button-add-object"><img src="images/add.png" />Add objet</div>
				<div class="subItem" id="button-remove-object"><img src="images/remove.png" />Delete objet</div>
				<div class="subItem" id="button-edit-object"><img src="images/edit.png" />Edit objet</div>
				<div class="subItem" id="button-read-object"><img src="images/fetch.png" />Read/write objet value</div>
			</div>

			<h3 tab_id="ioports" tab_label="IO Ports" tab_url="setup_ioports.php"><a href="#"><img src="images/ioport.png"> IO Ports</a></h3>
			<div>
				<div class="subItem" id="button-add-ioport"><img src="images/add.png" />Add IO Port</div>
				<div class="subItem" id="button-remove-ioport"><img src="images/remove.png" />Delete IO Port</div>
				<div class="subItem" id="button-edit-ioport"><img src="images/edit.png" />Edit IO Port</div>
			</div>

			<h3 tab_id="rules" tab_label="Rules" tab_url="setup_rules.php"><a href="#"><img src="images/rules.png"> Rules</a></h3>
			<div>
				<div class="subItem" id="button-add-rule"><img src="images/add.png" />Add rule</div>
				<div class="subItem" id="button-remove-rule"><img src="images/remove.png" />Remove rule</div>
				<div class="subItem" id="button-edit-rule"><img src="images/edit.png" />Edit rule</div>
			</div>
						
			<h3 tab_id="designedit" tab_label="Edition Design" tab_url="setup_design.php"><a href="#"><img src="images/setup.png"> Edition Design</a></h3>
			<div>
        <div class="subItem" id="button-add-new-zone"><img src="images/add.png" />New zone</div>
        <div class="subItem" id="button-remove-zone"><img src="images/remove.png" />Remove zone</div>
        <div class="subItem" id="button-add-design"><img src="images/add.png" />New design</div>

        <div class="subItem"><img src="images/add.png" />
        
        	<select onchange="design.newWidget($(this).val()); $(this).val('')">
						<option value="">Insert widget</option>
						{foreach from=$widgetsCategorized key=cat item=widgetsArray}
							<optgroup label="{$cat}">
								{foreach from=$widgetsArray item=w}
								<option value="{$w.name}">{$w.label}</option>
								{/foreach}
							</optgroup>
						{/foreach}
					</select>
				</div>

        <div class="subItem" id="button-try-design"><img src="images/display.png" />Try design</div>
        <div class="subItem" id="button-save-design"><img src="images/fetch.png" />Save</div>
      </div>

			<h3 tab_id="subpageedit" tab_label="Sub-pages" tab_url="setup_subpages.php"><a href="#"><img src="images/setup.png"> Sub-pages</a></h3>
			<div>
        <div class="subItem" id="button-add-subpage"><img src="images/add.png" />New sub-page</div>
        <div class="subItem" id="button-remove-subpage"><img src="images/remove.png" />Remove sub-page</div>
        <div class="subItem" id="button-subpage-parameters"><img src="images/edit.png" />Sub-page parameters</div>

        <div class="subItem"><img src="images/add.png" />
        
        	<select onchange="subpages.newWidget($(this).val()); $(this).val('')">
						<option value="">Insert widget</option>
						{foreach from=$widgetsCategorized key=cat item=widgetsArray}
							<optgroup label="{$cat}">
								{foreach from=$widgetsArray item=w}
								<option value="{$w.name}">{$w.label}</option>
								{/foreach}
							</optgroup>
						{/foreach}
					</select>
				</div>

        <div class="subItem" id="button-save-subpage"><img src="images/fetch.png" />Save</div>

      </div>
			
			<h3 tab_id="admin" tab_label="Administration" tab_url="setup_admin.php"><a href="#"><img src="images/construct.png"> Admin</a></h3>
			<div>
			  <div class="subItem" id="button-admin-conf-knxweb">Config KnxWeb</div>
        <div class="subItem" id="button-admin-log-object">Log Object</div>
			  <div class="subItem" id="button-admin-log-linknx">Log Linknx</div>
      </div>
			
		</div>
		<div id="propertiesContainer">
			<div class="title">Propriétés</div>
		</div>
	</div>
	
	<div id="mainContent">

		<div id="tabs">
			<ul>
				<li><a href="#tab-setup">Configuration</a></li>
			</ul>
			<div id="tab-setup">
				<h3 style="color: #F00; font-weight: bold;">Please select a section to configure in the left menu.</h3>
			</div>
		</div>
	</div>
</div>

</body>
</html>