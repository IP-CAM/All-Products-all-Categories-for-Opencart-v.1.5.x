<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  
  <?php if ($success) { ?><div class="success"><?php echo $success; ?></div><?php } ?>
  <?php if ($error) { ?><div class="warning"><?php echo $error; ?></div><?php } ?>
  <?php if ($error_warning) { ?><div class="warning"><?php echo $error_warning; ?></div><?php } ?>

  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
        <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
        <!--<a onclick="location = '<?php echo $update; ?>';" class="button" style="background-color:#545454;"><?php echo $button_update; ?></a>--><!-- for future releases -->
      </div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-products"><?php echo $tab_products; ?></a><a href="#tab-categories"><?php echo $tab_categories; ?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<div id="tab-general">
          <h2><?php echo $heading_general; ?></h2>
          <table class="form">
            <tr>
                <td><?php echo $entry_status; ?></td>
                <td><select name="apac_status">
                    <?php if ($apac_status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select></td>
            </tr>
          </table> 
          <h2><?php echo $heading_instructions; ?></h2>
			<ol>
				<li>Configure settings for the "All Products" page on the next tab</li>
				<li>Configure settings for the "All Categories" page on the last tab</li>
				<li>Be sure to complete both sections on each page: <b>Options &amp; Data</b>!</li>
				<li>To support <b>Product Filters</b> don't forget to add route="product/allproducts" to your chosen <a href="<?php echo $layouts; ?>" target="_blank">Layout</a> (e.g. "Category")!</li>
			</ol>
          <h2><?php echo $heading_info; ?></h2>
	        <ul>
				<li>requires <a href="http://code.google.com/p/vqmod/" title="vQmod" target="_blank">vQmod</a> for changes and does not overwrite any files in the default OpenCart installation!</li>
				<li>creates new routes <i>"product/allproducts"</i> and <i>"product/allcategories"</i> for "All Products" and "All Categories" pages, respectively</li>
				<li>All Products features and option settings include:
					<ul>
						<li>Displays Name, Image, Description, Meta_Keyword, and Meta_Description</li>
						<li>Supports <a href="http://docs.opencart.com/display/opencart/Filters" target="_blank">Product Filters</a> (OpenCart v1.5.5+)</li>
						<li>Refine by Category option</li>
						<li>Refine by Brand/Manufacturer option</li>
						<li>Sorting options for "Default" (Sort Order), "Name", "Model", "Price", "Date" (Date Added), and "Reviews"</li>
						<li>"All Products" link to Header Nav Menu option</li>
						<li>Breadcrumb "All Products" to Product pages option</li>
					</ul>
				</li>
				<li>All Categories features and option settings include:
					<ul>
						<li>Displays Name, Image, Description, Meta_Keyword, and Meta_Description</li>
						<li>Group Categories by Index</li>
						<li>Hide/Show Category Images</li>
						<li>Sorting options for "Name", "Path Name", "Sort Order", and "Path Sort Order"</li>
						<li>"All Categories" link to Header Nav Menu option</li>
						<li>Breadcrumb "All Categories" to Category pages option</li>
						<li>View by Grid or List</li>
					</ul>
				<li>uses <b>database caching</b> for database queries to improve page load speed</li>
				<li>view <a href="http://opencart.garudacrafts.com/1561/" title="Front-End Demo" target="_blank">demo website</a> for an example</li>
			</ul>
         </div>
         
         <div id="tab-products">
			<h2><?php echo $heading_products; ?></h2>
				<table class="form">
					<tr>
					  <td><?php echo $entry_products_status; ?></td>
					  <td style="width:150px;"><select name="apac_products_status">
						  <?php if ($apac_products_status) { ?>
						  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						  <option value="0"><?php echo $text_disabled; ?></option>
						  <?php } else { ?>
						  <option value="1"><?php echo $text_enabled; ?></option>
						  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						  <?php } ?>
						</select></td>
						<td></td>
					</tr>
				</table>
			<div id="tabs-products" class="htabs"><a href="#tab-products-options"><?php echo $tab_options; ?></a><a href="#tab-products-data"><?php echo $tab_data; ?></a></div>
	        <div id="tab-products-options">
				<table class="form">
		            <tr>
		                <td><?php echo $entry_nav_menu; ?></td>
		                <td style="width:150px;">
		                    <?php if ($apac_products_nav_menu) { ?>
		                        <input type="radio" name="apac_products_nav_menu" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_nav_menu" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_products_nav_menu" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_nav_menu" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>		                    
		                </td>
						<td><p><span class="help"><?php echo $text_nav_menu_help; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_breadcrumb; ?></td>
		                <td>
		                    <?php if ($apac_products_breadcrumb) { ?>
		                        <input type="radio" name="apac_products_breadcrumb" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_breadcrumb" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_products_breadcrumb" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_breadcrumb" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>		                    
		                </td>
						<td><p><span class="help"><?php echo $text_breadcrumb; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_products_refine_category; ?></td>
		                <td><select name="apac_products_refine_category">
		                    <?php if ($apac_products_refine_category) { ?>
		                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
		                    <option value="0"><?php echo $text_disabled; ?></option>
		                    <?php } else { ?>
		                    <option value="1"><?php echo $text_enabled; ?></option>
		                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
		                    <?php } ?>
		                  </select>
		                  </td>
						<td><p><span class="help"><?php echo $text_products_refine_category_help; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_products_refine_brand; ?></td>
		                <td><select name="apac_products_refine_brand">
		                    <?php if ($apac_products_refine_brand) { ?>
		                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
		                    <option value="0"><?php echo $text_disabled; ?></option>
		                    <?php } else { ?>
		                    <option value="1"><?php echo $text_enabled; ?></option>
		                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
		                    <?php } ?>
		                  </select>
		                  </td>
						<td><p><span class="help"><?php echo $text_products_refine_brand_help; ?></span></p></td>
		            </tr>
					<tr>
					  <td><?php echo $entry_products_filters_all; ?></td>
					  <td style="width:150px;"><select name="apac_products_filters_all">
						  <?php if ($apac_products_filters_all) { ?>
						  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						  <option value="0"><?php echo $text_disabled; ?></option>
						  <?php } else { ?>
						  <option value="1"><?php echo $text_enabled; ?></option>
						  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						  <?php } ?>
						</select></td>
						<td><p><span class="help"><?php echo $text_products_filters_all_help; ?></span></p></td>
					</tr>
		        </table>
		        
		        <h3><?php echo $heading_sort; ?></h3>
				<p><?php echo $text_sort_help; ?></p>
		        
		        <table class="form">
		            <tr>
						<td><?php echo $entry_sort_default; ?></td>
						<td style="width:150px;">
							<select name="apac_products_sort_default">
							<?php foreach ($products_sorts as $key => $value) { ?>
							<?php if ($value == $apac_products_sort_default) { ?>
							<option value="<?php echo $value; ?>" selected="selected"><?php echo $key; ?></option>
							<?php } else { ?>
							<option value="<?php echo $value; ?>"><?php echo $key; ?></option>
							<?php } ?>
							<?php } ?>
							</select>
						</td>
						<td></td>
					</tr>
		            <tr>
		                <td><?php echo $entry_sort_sort_order; ?></td>
		                <td>
		                    <?php if ($apac_products_sort_sort_order) { ?>
		                        <input type="radio" name="apac_products_sort_sort_order" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_sort_order" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_products_sort_sort_order" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_sort_order" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>		                    
		                </td>
						<td><p><span class="help"><?php echo $text_sort_default; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_sort_name; ?></td>
		                <td>
		                    <?php if ($apac_products_sort_name) { ?>
		                        <input type="radio" name="apac_products_sort_name" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_name" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_products_sort_name" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_name" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>		                    
		                </td>
						<td><p><span class="help"><?php echo $text_sort_name; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_sort_model; ?></td>
		                <td>
		                    <?php if ($apac_products_sort_model) { ?>
		                        <input type="radio" name="apac_products_sort_model" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_model" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_products_sort_model" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_model" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>		                    
		                </td>
						<td><p><span class="help"><?php echo $text_sort_model; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_sort_price; ?></td>
		                <td>
		                    <?php if ($apac_products_sort_price) { ?>
		                        <input type="radio" name="apac_products_sort_price" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_price" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_products_sort_price" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_price" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>		                   
		                </td>
						<td><p><span class="help"><?php echo $text_sort_price; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_sort_date; ?></td>
		                <td>
		                    <?php if ($apac_products_sort_date) { ?>
		                        <input type="radio" name="apac_products_sort_date" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_date" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_products_sort_date" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_date" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>		                    
		                </td>
						<td><p><span class="help"><?php echo $text_sort_date; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_sort_review; ?></td>
		                <td>
		                    <?php if ($apac_products_sort_review) { ?>
		                        <input type="radio" name="apac_products_sort_review" value="1" checked="checked" <?php echo ($this->config->get('config_review_status') ? 'readonly="readonly"' : ''); ?> /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_review" value="0" <?php echo ($this->config->get('config_review_status') ? 'readonly="readonly"' : ''); ?>/><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_products_sort_review" value="1" <?php echo ($this->config->get('config_review_status') ? 'readonly="readonly"' : ''); ?>/><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_products_sort_review" value="0" checked="checked" <?php echo ($this->config->get('config_review_status') ? 'readonly="readonly"' : ''); ?> /><?php echo $text_no; ?>
		                    <?php } ?>		                    
		                </td>
						<td><p><span class="help"><?php echo $text_sort_review; ?> (<i><small style="color:#FF0000;">NOTE: Reviews must be enabled in <a href="<?php echo $settings; ?>" target="_blank">System Settings</a>!</small></i>)</span></p></td>
		            </tr>
				</table>
			</div>
			<div id="tab-products-data">		
	          <div id="tabs-products-languages" class="htabs">
	            <?php foreach ($languages as $language) { ?>
	            <a href="#tabs-products-language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
	            <?php } ?>
	          </div>
	          <?php foreach ($languages as $language) { ?>
	          <div id="tabs-products-language<?php echo $language['language_id']; ?>">
	            <table class="form">
	              <tr>
	                <td><span class="required">*</span> <?php echo $entry_name; ?></td>
	                <td><input type="text" name="apac_products_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($apac_products_description[$language['language_id']]) ? $apac_products_description[$language['language_id']]['name'] : ''; ?>" />
	                  <?php if (isset($error_products_name[$language['language_id']])) { ?>
	                  <span class="error"><?php echo $error_products_name[$language['language_id']]; ?></span>
	                  <?php } ?></td>
	              </tr>
	              <tr>
	                <td><?php echo $entry_meta_description; ?></td>
	                <td><textarea name="apac_products_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($apac_products_description[$language['language_id']]) ? $apac_products_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
	              </tr>
	              <tr>
	                <td><?php echo $entry_meta_keyword; ?></td>
	                <td><textarea name="apac_products_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($apac_products_description[$language['language_id']]) ? $apac_products_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
	              </tr>
	              <tr>
	                <td><?php echo $entry_description; ?></td>
	                <td><textarea name="apac_products_description[<?php echo $language['language_id']; ?>][description]" id="products-description<?php echo $language['language_id']; ?>"><?php echo isset($apac_products_description[$language['language_id']]) ? $apac_products_description[$language['language_id']]['description'] : ''; ?></textarea></td>
	              </tr>
	            </table>
	          </div>
	          <?php } ?>
	          <table class="form">
				<tr>
				  <td><?php echo $entry_keyword; ?></td>
				  <td><input type="text" name="apac_products_keyword" value="<?php echo $apac_products_keyword; ?>" /></td>
				</tr>
	            <tr>
	              <td><?php echo $entry_image; ?></td>
	              <td valign="top"><div class="image"><img src="<?php echo $apac_products_thumb; ?>" alt="" id="apac_products_thumb" />
	                  <input type="hidden" name="apac_products_image" value="<?php echo $apac_products_image; ?>" id="apac_products_image" />
	                  <br />
	                  <a onclick="image_upload('apac_products_image', 'apac_products_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#apac_products_thumb').attr('src', '<?php echo $no_image; ?>'); $('#apac_products_image').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
	            </tr>
	          </table>
			</div>
         </div>
         
         <div id="tab-categories">
			<h2><?php echo $heading_categories; ?></h2>
	          <table class="form">
				<tr>
				  <td><?php echo $entry_categories_status; ?></td>
				  <td><select name="apac_categories_status">
					  <?php if ($apac_categories_status) { ?>
					  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					  <option value="0"><?php echo $text_disabled; ?></option>
					  <?php } else { ?>
					  <option value="1"><?php echo $text_enabled; ?></option>
					  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					  <?php } ?>
					</select></td>
				</tr>
			  </table>
			<div id="tabs-categories" class="htabs"><a href="#tab-categories-options"><?php echo $tab_options; ?></a><a href="#tab-categories-data"><?php echo $tab_data; ?></a></div>
	        <div id="tab-categories-options">
				<table class="form">
		            <tr>
		                <td><?php echo $entry_nav_menu; ?></td>
		                <td style="width:150px;">
		                    <?php if ($apac_categories_nav_menu) { ?>
		                        <input type="radio" name="apac_categories_nav_menu" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_nav_menu" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_categories_nav_menu" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_nav_menu" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>		                    
		                </td>
						<td><p><span class="help"><?php echo $text_nav_menu_help; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_breadcrumb; ?></td>
		                <td>
		                    <?php if ($apac_categories_breadcrumb) { ?>
		                        <input type="radio" name="apac_categories_breadcrumb" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_breadcrumb" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_categories_breadcrumb" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_breadcrumb" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>		                    
		                </td>
						<td><p><span class="help"><?php echo $text_breadcrumb; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_categories_index; ?></td>
		                <td><select name="apac_categories_index">
		                    <?php if ($apac_categories_index) { ?>
		                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
		                    <option value="0"><?php echo $text_disabled; ?></option>
		                    <?php } else { ?>
		                    <option value="1"><?php echo $text_enabled; ?></option>
		                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
		                    <?php } ?>
		                  </select>
		                  </td>
						<td><p><span class="help"><?php echo $text_categories_index_help; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_categories_display_images; ?></td>
		                <td><select name="apac_categories_display_images">
		                    <?php if ($apac_categories_display_images) { ?>
		                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
		                    <option value="0"><?php echo $text_disabled; ?></option>
		                    <?php } else { ?>
		                    <option value="1"><?php echo $text_enabled; ?></option>
		                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
		                    <?php } ?>
		                  </select>
		                  </td>
						<td><p><span class="help"><?php echo $text_categories_display_images_help; ?></span></p></td>
		            </tr>
		        </table>

				<h3><?php echo $heading_sort; ?></h3>
				<p><?php echo $text_sort_help; ?></p>

		        <table class="form">
		            <tr>
						<td><?php echo $entry_sort_default; ?></td>
						<td style="width:150px;">
							<select name="apac_categories_sort_default">
							<?php foreach ($categories_sorts as $key => $value) { ?>
							<?php if ($value == $apac_categories_sort_default) { ?>
							<option value="<?php echo $value; ?>" selected="selected"><?php echo $key; ?></option>
							<?php } else { ?>
							<option value="<?php echo $value; ?>"><?php echo $key; ?></option>
							<?php } ?>
							<?php } ?>
							</select>
						</td>
						<td></td>
					</tr>
		            <tr>
		                <td><?php echo $entry_sort_name; ?></td>
		                <td>
		                    <?php if ($apac_categories_sort_name) { ?>
		                        <input type="radio" name="apac_categories_sort_name" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_sort_name" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_categories_sort_name" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_sort_name" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>
		                </td>
						<td><p><span class="help"><?php echo $text_sort_name; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_sort_path_name; ?></td>
		                <td>
		                    <?php if ($apac_categories_sort_path_name) { ?>
		                        <input type="radio" name="apac_categories_sort_path_name" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_sort_path_name" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_categories_sort_path_name" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_sort_path_name" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>
		                </td>
						<td><p><span class="help"><?php echo $text_sort_path_name; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_sort_sort_order; ?></td>
		                <td>
		                    <?php if ($apac_categories_sort_sort_order) { ?>
		                        <input type="radio" name="apac_categories_sort_sort_order" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_sort_sort_order" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_categories_sort_sort_order" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_sort_sort_order" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>
		                </td>
						<td><p><span class="help"><?php echo $text_sort_sort_order; ?></span></p></td>
		            </tr>
		            <tr>
		                <td><?php echo $entry_sort_path_sort_order; ?></td>
		                <td>
		                    <?php if ($apac_categories_sort_path_sort_order) { ?>
		                        <input type="radio" name="apac_categories_sort_path_sort_order" value="1" checked="checked" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_sort_path_sort_order" value="0" /><?php echo $text_no; ?>
		                    <?php } else { ?>
		                        <input type="radio" name="apac_categories_sort_path_sort_order" value="1" /><?php echo $text_yes; ?>
		                        <input type="radio" name="apac_categories_sort_path_sort_order" value="0" checked="checked" /><?php echo $text_no; ?>
		                    <?php } ?>
		                </td>
						<td><p><span class="help"><?php echo $text_sort_default; ?></span></p></td>
		            </tr>
				</table> 
	         </div>    
	        <div id="tab-categories-data">
	          <div id="tabs-categories-languages" class="htabs">
	            <?php foreach ($languages as $language) { ?>
	            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
	            <?php } ?>
	          </div>
	          <?php foreach ($languages as $language) { ?>
	          <div id="tabs-categories-language<?php echo $language['language_id']; ?>">
	            <table class="form">
	              <tr>
	                <td><span class="required">*</span> <?php echo $entry_name; ?></td>
	                <td><input type="text" name="apac_categories_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($apac_categories_description[$language['language_id']]) ? $apac_categories_description[$language['language_id']]['name'] : ''; ?>" />
	                  <?php if (isset($error_categories_name[$language['language_id']])) { ?>
	                  <span class="error"><?php echo $error_categories_name[$language['language_id']]; ?></span>
	                  <?php } ?></td>
	              </tr>
	              <tr>
	                <td><?php echo $entry_meta_description; ?></td>
	                <td><textarea name="apac_categories_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($apac_categories_description[$language['language_id']]) ? $apac_categories_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
	              </tr>
	              <tr>
	                <td><?php echo $entry_meta_keyword; ?></td>
	                <td><textarea name="apac_categories_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($apac_categories_description[$language['language_id']]) ? $apac_categories_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
	              </tr>
	              <tr>
	                <td><?php echo $entry_description; ?></td>
	                <td><textarea name="apac_categories_description[<?php echo $language['language_id']; ?>][description]" id="categories-description<?php echo $language['language_id']; ?>"><?php echo isset($apac_categories_description[$language['language_id']]) ? $apac_categories_description[$language['language_id']]['description'] : ''; ?></textarea></td>
	              </tr>
	            </table>
	          </div>
	          <?php } ?>
	          <table class="form">
				<tr>
				  <td><?php echo $entry_keyword; ?></td>
				  <td><input type="text" name="apac_categories_keyword" value="<?php echo $apac_categories_keyword; ?>" /></td>
				</tr>
	            <tr>
	              <td><?php echo $entry_image; ?></td>
	              <td valign="top"><div class="image"><img src="<?php echo $apac_categories_thumb; ?>" alt="" id="apac_categories_thumb" />
	                  <input type="hidden" name="apac_categories_image" value="<?php echo $apac_categories_image; ?>" id="apac_categories_image" />
	                  <br />
	                  <a onclick="image_upload('apac_categories_image', 'apac_categories_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#apac_categories_thumb').attr('src', '<?php echo $no_image; ?>'); $('#apac_categories_image').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
	            </tr>
	          </table>
	        </div>  
         </div>
       
      <input type="hidden" name="apac_release" value="1" /><?php // APAC version 1.0.0 ?>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('products-description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
CKEDITOR.replace('categories-description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#tabs-categories a').tabs(); 
$('#tabs-categories-languages a').tabs();
$('#tabs-products a').tabs(); 
$('#tabs-products-languages a').tabs();
//--></script>
<?php echo $footer; ?>