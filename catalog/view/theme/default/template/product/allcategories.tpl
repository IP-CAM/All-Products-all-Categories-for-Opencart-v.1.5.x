<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
	<h1><?php echo $heading_title; ?></h1>
	<?php if ($thumb || $description) { ?>
	<div class="category-info">
		<?php if ($thumb) { ?>
		<div class="category-image image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
		<?php } ?>
		<?php if ($description) { ?>
		<div class="category-description">
		<?php echo $description; ?>
		</div>
		<?php } ?>
	</div>
	<?php } ?>
	<?php if ($indexes || $categories) { ?>
	<?php if ($indexes) { ?>     
	<p><b><?php echo $text_index; ?></b>
	<?php foreach ($indexes as $index) { ?>
	&nbsp;&nbsp;&nbsp;<a href="<?php echo $index['href']; ?>#<?php echo $index['name']; ?>"><b><?php echo $index['name']; ?></b></a>
	<?php } ?>
	</p>
	<?php } ?>
	<div class="category-filter product-filter" style="border:none;margin-bottom:10px;">
		<div class="display"><b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $text_grid; ?></a></div>
		<div class="limit"><b><?php echo $text_limit; ?></b>
		  <select onchange="location = this.value;">
			<?php foreach ($limits as $limits) { ?>
			<?php if ($limits['value'] == $limit) { ?>
			<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
			<?php } ?>
			<?php } ?>
		  </select>
		</div>
		<?php if ($sorts) { ?>
		<div class="sort"><b><?php echo $text_sort; ?></b>
		<select onchange="location = this.value;">
			<?php foreach ($sorts as $sorts) { ?>
			<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
			<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
			<?php } ?>
			<?php } ?>
		</select>
		</div>
		<?php } ?>
    </div>
	<?php if ($indexes) { ?>     
		<?php foreach ($indexes as $index) { ?>
		<div class="manufacturer-list">
		<div class="manufacturer-heading category-heading"><?php echo $index['name']; ?><a id="<?php echo $index['name']; ?>"></a></div>
		<div class="manufacturer-content category-content">
		  <div class="product-grid category-grid">
		  <?php foreach ($index['category'] as $category) { ?>
			<div>
				<?php if($this->config->get('apac_categories_display_images') && $category['thumb']) { ?>
				<div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php  echo $category['thumb']; ?> " alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" /></a></div>
				<?php } ?>
				<div class="name"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
			</div>
		  <?php } ?>
		  </div>
		</div>
		</div>
		<?php } ?>
	<?php } else { ?>
		<div class="product-grid category-grid">
		<?php foreach ($categories as $category) { ?>
			<div>
				<?php if($this->config->get('apac_categories_display_images') && $category['thumb']) { ?>
				<div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php  echo $category['thumb']; ?> " alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" /></a></div>
				<?php } ?>
				<div class="name"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
			</div>		
		<?php } ?>
		</div>	
	<?php } ?>	
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?> 
    <div class="content"><?php echo $text_empty; ?></div>
    <div class="buttons">
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.category-grid').attr('class', 'category-list');
		
		$('.category-list > div').each(function(index, element) {
			html  = '<div>';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image" style="display:none;">' + image + '</div>';
			}
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
				
			html += '</div>';

						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.category-list').attr('class', 'product-grid category-grid');
		
		$('.category-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display'); // cookie

if (view) {
	display(view);
} else {
	display('list');
}
//--></script> 
<?php echo $footer; ?>