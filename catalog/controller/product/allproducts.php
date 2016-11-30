<?php 
class ControllerProductAllProducts extends Controller {  
	public function index() {
		if(!$this->config->get('apac_status') || !$this->config->get('apac_products_status')) {
      		$this->session->data['redirect'] = $this->url->link('product/allproducts', '', 'SSL');
	  		$this->redirect($this->url->link('common/home', '', 'SSL'));
		}
		
		$this->language->load('product/category');
						
		$this->load->model('catalog/product');

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['filter_category_id'])) {
			$filter_category_id = $this->request->get['filter_category_id'];
		} else {
			$filter_category_id = '';
		}

		if (isset($this->request->get['filter_manufacturer_id'])) {
			$filter_manufacturer_id = $this->request->get['filter_manufacturer_id'];
		} else {
			$filter_manufacturer_id = '';
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = $this->config->get('apac_products_sort_default');
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = (($sort == 'p.date_added') ? 'DESC' : 'ASC'); // if sorted by date, then show newest first, otherwise sort ascending
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
		
		// get All Products info from APAC Module config settings
		$language_id = (int)$this->config->get('config_language_id');
		$all_products_description = $this->config->get('apac_products_description');
		
		$all_products_info = array(
			'name'					=> $all_products_description[$language_id]['name'],
			'description'			=> $all_products_description[$language_id]['description'],
			'meta_description'		=> $all_products_description[$language_id]['meta_description'],
			'meta_keyword'			=> $all_products_description[$language_id]['meta_keyword'],
			'image'					=> $this->config->get('apac_products_image'),
			'keyword'				=> $this->config->get('apac_products_keyword')
		);

		$text_all_products = (!empty($all_products_info['name']) ? $all_products_info['name'] : $this->language->get('text_all_products'));
		
		$this->document->setTitle($text_all_products);
		
		if (!empty($all_products_info['meta_description'])) {
			$this->document->setDescription($all_products_info['meta_description']);
		}
		
		if (!empty($all_products_info['meta_keyword'])) {
			$this->document->setKeywords($all_products_info['meta_keyword']);
		}
		
		$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
							
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
			'text'      => $text_all_products,
			'href'      => $this->url->link('product/allproducts'),
			'separator' => $this->language->get('text_separator')
   		);		
		
		$this->data['heading_title'] = $text_all_products;
		$this->data['text_refine'] = $this->language->get('text_refine');
		$this->data['text_empty'] = $this->language->get('text_empty');			
		$this->data['text_quantity'] = $this->language->get('text_quantity');
		$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$this->data['text_model'] = $this->language->get('text_model');
		$this->data['text_price'] = $this->language->get('text_price');
		$this->data['text_tax'] = $this->language->get('text_tax');
		$this->data['text_points'] = $this->language->get('text_points');
		$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$this->data['text_display'] = $this->language->get('text_display');
		$this->data['text_list'] = $this->language->get('text_list');
		$this->data['text_grid'] = $this->language->get('text_grid');
		$this->data['text_sort'] = $this->language->get('text_sort');
		$this->data['text_limit'] = $this->language->get('text_limit');
		$this->data['text_filter'] = $this->language->get('text_filter');
		$this->data['text_filter_category'] = $this->language->get('text_filter_category');
		$this->data['text_filter_manufacturer'] = $this->language->get('text_filter_manufacturer');
		$this->data['text_category_all'] = $this->language->get('text_category_all');
		$this->data['text_manufacturer_all'] = $this->language->get('text_manufacturer_all');
		$this->data['text_all_products'] = $text_all_products;
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		$this->data['button_continue'] = $this->language->get('button_continue');
		
		$this->load->model('tool/image'); 

		if (!empty($all_products_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($all_products_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
		} else {
			$this->data['thumb'] = false;
		}

		if (!empty($all_products_info['description'])) {
			$this->data['description'] = html_entity_decode($all_products_info['description'], ENT_QUOTES, 'UTF-8');
		} else {
			$this->data['description'] = false;
		}
		
		$this->data['compare'] = $this->url->link('product/compare');

		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}	

		if (isset($this->request->get['filter_manufacturer_id'])) {
			$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
		}	
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}	
		
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
				
		$this->data['categories'] = array();
		
		if ($this->config->get('apac_products_refine_category')) {	
			$this->load->model('catalog/category');
			
			$this->data['categories'][] = array(
				'id'	=> 0,
				'name'	=> $this->language->get('text_category_all'),
				'href'	=> $this->url->link('product/allproducts', 'filter_category_id=0' . $url)
			);

			$categories = $this->model_catalog_category->getCategories(0);

			foreach ($categories as $category) {
				if ($this->config->get('config_product_count')) {
					$data = array(
						'filter_category_id'  => $category['category_id'],
						'filter_sub_category' => true
					);

					$product_total = $this->model_catalog_product->getTotalProducts($data);
				}		

				$this->data['categories'][] = array(
					'id'	=> $category['category_id'],
					'name'  => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'href'  => $this->url->link('product/allproducts', 'filter_category_id=' . $category['category_id'] . $url)
				);
			}
		}

		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['filter_category_id'])) {
			$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}	
		
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		$this->load->model('catalog/manufacturer');

		$this->data['manufacturers'] = array();
		
		if ($this->config->get('apac_products_refine_brand')) {	
			$this->data['manufacturers'][] = array(
				'id'	=> 0,
				'name'	=> $this->language->get('text_manufacturer_all'),
				'href'	=> $this->url->link('product/allproducts', 'filter_manufacturer_id=0' . $url)
			);
			
			$manufacturers = $this->model_catalog_manufacturer->getManufacturers();

			foreach ($manufacturers as $manufacturer) {
				if ($this->config->get('config_product_count')) {
					$data = array(
						'filter_manufacturer_id'  => $manufacturer['manufacturer_id']
					);

					$product_total = $this->model_catalog_product->getTotalProducts($data);
				}		

				$this->data['manufacturers'][] = array(
					'id'	=> $manufacturer['manufacturer_id'],
					'name'  => $manufacturer['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'href'  => $this->url->link('product/allproducts', 'filter_manufacturer_id=' . $manufacturer['manufacturer_id'] . $url)
				);
			}
		}

		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['filter_category_id'])) {
			$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
		}	

		if (isset($this->request->get['filter_manufacturer_id'])) {
			$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
		}	
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}	
		
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		$this->data['products'] = array();

		$data = array(
			'filter_filter'      		=> $filter, 
			'filter_category_id'    	=> $filter_category_id, 
			'filter_manufacturer_id'	=> $filter_manufacturer_id, 
			'sort'               		=> $sort,
			'order'              		=> $order,
			'start'              		=> ($page - 1) * $limit,
			'limit'              		=> $limit
		);
						
		$product_total = $this->model_catalog_product->getTotalProducts($data); 
		
		$products = $this->model_catalog_product->getProductsAll($data);
		
		foreach ($products as $product) {
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}
			
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
			
			if ((float)$product['special']) {
				$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}	
			
			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$product['special'] ? $product['special'] : $product['price']);
			} else {
				$tax = false;
			}				
			
			if ($this->config->get('config_review_status')) {
				$rating = (int)$product['rating'];
			} else {
				$rating = false;
			}
							
			$this->data['products'][] = array(
				'product_id'  => $product['product_id'],
				'thumb'       => $image,
				'name'        => $product['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'rating'      => $product['rating'],
				'reviews'     => sprintf($this->language->get('text_reviews'), (int)$product['reviews']),
				'href'        => $this->url->link('product/product','&product_id=' . $product['product_id'])
			);
		}
	
		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['filter_category_id'])) {
			$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
		}	

		if (isset($this->request->get['filter_manufacturer_id'])) {
			$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
		}		

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
						
		$this->data['sorts'] = array();
		
		if ($this->config->get('apac_products_sort_sort_order')) {	
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/allproducts','&sort=p.sort_order&order=ASC' . $url)
			);
		}
		
		if ($this->config->get('apac_products_sort_name')) {		
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/allproducts','&sort=pd.name&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/allproducts','&sort=pd.name&order=DESC' . $url)
			);
		}
		
		if ($this->config->get('apac_products_sort_price')) {	
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/allproducts','&sort=p.price&order=ASC' . $url)
			); 

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/allproducts','&sort=p.price&order=DESC' . $url)
			);
		}
		
		if ($this->config->get('config_review_status') && $this->config->get('apac_products_sort_review')) {
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_desc'),
				'value' => 'rating-DESC',
				'href'  => $this->url->link('product/allproducts','&sort=rating&order=DESC' . $url)
			); 
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'rating-ASC',
				'href'  => $this->url->link('product/allproducts','&sort=rating&order=ASC' . $url)
			);
		}

		
		if ($this->config->get('apac_products_sort_model')) {			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/allproducts','&sort=p.model&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/allproducts','&sort=p.model&order=DESC' . $url)
			);
		}
		
		if ($this->config->get('apac_products_sort_date')) {			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_date_asc'),
				'value' => 'p.date_added-ASC',
				'href'  => $this->url->link('product/allproducts','&sort=p.date_added&order=ASC' . $url)
			); 

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_date_desc'),
				'value' => 'p.date_added-DESC',
				'href'  => $this->url->link('product/allproducts','&sort=p.date_added&order=DESC' . $url)
			);
		}
		
		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['filter_category_id'])) {
			$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
		}	

		if (isset($this->request->get['filter_manufacturer_id'])) {
			$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
		}	

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		$this->data['limits'] = array();
		
		$limits = array_unique(array($this->config->get('config_catalog_limit'), 25, 50, 75, 100));

		sort($limits);

		foreach($limits as $value){
			$this->data['limits'][] = array(
				'text'  => $value,
				'value' => $value,
				'href'  => $this->url->link('product/allproducts', $url . '&limit=' . $value)
			);
		}
					
		$url = '';

		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['filter_category_id'])) {
			$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
		}	

		if (isset($this->request->get['filter_manufacturer_id'])) {
			$url .= '&filter_manufacturer_id=' . $this->request->get['filter_manufacturer_id'];
		}	

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
				
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('product/allproducts',$url . '&page={page}');
	
		$this->data['pagination'] = $pagination->render();
	
		$this->data['filter'] = $filter;
		$this->data['filter_category_id'] = $filter_category_id;
		$this->data['filter_manufacturer_id'] = $filter_manufacturer_id;
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		$this->data['limit'] = $limit;
	
		$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/allproducts.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/allproducts.tpl';
		} else {
			$this->template = 'default/template/product/allproducts.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
			
		$this->response->setOutput($this->render());										
    } 
}
?>
