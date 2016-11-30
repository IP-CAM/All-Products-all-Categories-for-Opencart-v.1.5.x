<?php
class ControllerModuleAPAC extends Controller {
	private $error = array();

	public function index() {		
        $language = $this->load->language('module/apac');
        $this->data = array_merge($this->data, $language);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('apac', $this->request->post);
			
			if (!empty($this->request->post['apac_products_keyword'])) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product/allproducts', keyword = '" . $this->db->escape($this->request->post['apac_products_keyword']) . "'");
			}
			
			if (!empty($this->request->post['apac_categories_keyword'])) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product/allcategories', keyword = '" . $this->db->escape($this->request->post['apac_categories_keyword']) . "'");
			}
						
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->session->data['error'])) {
			$this->data['error'] = $this->session->data['error'];
		
			unset($this->session->data['error']);
		} else {
			$this->data['error'] = '';
		}
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['products_name'])) {
			$this->data['error_products_name'] = $this->error['products_name'];
		} else {
			$this->data['error_products_name'] = array();
		}

		if (isset($this->error['categories_name'])) {
			$this->data['error_categories_name'] = $this->error['categories_name'];
		} else {
			$this->data['error_categories_name'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/apac', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = $this->url->link('module/apac', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['update'] = $this->url->link('module/apac/update', 'token=' . $this->session->data['token'], 'SSL'); // for future releases
		$this->data['layouts'] = $this->url->link('design/layout', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['settings'] = $this->url->link('setting/setting', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$config_data_fields_auto_enable = array(
			'apac_status',
			'apac_products_status',
			'apac_categories_status',
			'apac_products_nav_menu',
			'apac_products_breadcrumb',
			'apac_products_refine_category',
			'apac_products_refine_brand',
			'apac_products_filters_all',
			'apac_products_sort_default',
			'apac_products_sort_sort_order',
			'apac_products_sort_name',
			'apac_products_sort_model',
			'apac_products_sort_price',
			'apac_products_sort_date',
			'apac_categories_nav_menu',
			'apac_categories_breadcrumb',
			'apac_categories_index',
			'apac_categories_display_images',
			'apac_categories_sort_default',
			'apac_categories_sort_name',
			'apac_categories_sort_path_name',
			'apac_categories_sort_sort_order',
			'apac_categories_sort_path_sort_order'
		);

        foreach ($config_data_fields_auto_enable as $config_data_field_auto_enable) {
            if (isset($this->request->post[$config_data_field_auto_enable])) {
                $this->data[$config_data_field_auto_enable] = $this->request->post[$config_data_field_auto_enable];
            } elseif ($this->config->get($config_data_field_auto_enable)) {
                $this->data[$config_data_field_auto_enable] = $this->config->get($config_data_field_auto_enable);
            } else {
				$this->data[$config_data_field_auto_enable] = 1;
			}
        }
		
		$config_data_fields = array(
			'apac_products_image',
			'apac_products_keyword',
			'apac_products_sort_default',
			'apac_categories_image',
			'apac_categories_keyword',
			'apac_categories_sort_default'
		);

        foreach ($config_data_fields as $config_data_field) {
            if (isset($this->request->post[$config_data_field])) {
                $this->data[$config_data_field] = $this->request->post[$config_data_field];
            } else {
                $this->data[$config_data_field] = $this->config->get($config_data_field);
            }
        }
		
		$this->data['products_sorts'] = array(
			'Default'	=>	'p.sort_order',
			'Name'		=>	'pd.name',
			'Model'		=>	'p.model',
			'Price'		=>	'p.price',
			'Date'		=>	'p.date_added',
			'Reviews'	=>	'rating'
		);

		$this->data['categories_sorts'] = array(
			'Name'				=>	'name',
			'Path Name'			=>	'path_name',
			'Sort Order'		=>	'sort_order',
			'Path Sort Order'	=>	'sort_order_path'
		);

		if (isset($this->request->post['apac_products_sort_review'])) {
			$this->data['apac_products_sort_review'] = $this->request->post['apac_products_sort_review'];
		} elseif ($this->config->get('apac_products_sort_review')) {
			$this->data['apac_products_sort_review'] = $this->config->get('apac_products_sort_review');
		} else {
			$this->data['apac_products_sort_review'] = 0;
		}
					
		if (isset($this->request->post['apac_products_description'])) {
			$this->data['apac_products_description'] = $this->request->post['apac_products_description'];
		} elseif ($this->config->get('apac_products_description')) {
			$this->data['apac_products_description'] = $this->config->get('apac_products_description');
		} else {
			$this->data['apac_products_description'] = array();
			$this->data['apac_products_description'][1]['name'] = 'All Products';
			$this->data['apac_products_description'][1]['meta_description'] = '';
			$this->data['apac_products_description'][1]['meta_keyword'] = '';
			$this->data['apac_products_description'][1]['description'] = '';
		}
					
		if (isset($this->request->post['apac_categories_description'])) {
			$this->data['apac_categories_description'] = $this->request->post['apac_categories_description'];
		} elseif ($this->config->get('apac_categories_description')) {
			$this->data['apac_categories_description'] = $this->config->get('apac_categories_description');
		} else {
			$this->data['apac_categories_description'] = array();
			$this->data['apac_categories_description'][1]['name'] = 'All Categories';
			$this->data['apac_categories_description'][1]['meta_description'] = '';
			$this->data['apac_categories_description'][1]['meta_keyword'] = '';
			$this->data['apac_categories_description'][1]['description'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['apac_products_image']) && file_exists(DIR_IMAGE . $this->request->post['apac_products_image'])) {
			$this->data['apac_products_thumb'] = $this->model_tool_image->resize($this->request->post['apac_products_image'], 100, 100);
		} elseif ($this->config->get('apac_products_image') && file_exists(DIR_IMAGE . $this->config->get('apac_products_image'))) {
			$this->data['apac_products_thumb'] = $this->model_tool_image->resize($this->config->get('apac_products_image'), 100, 100);
		} else {
			$this->data['apac_products_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['apac_categories_image']) && file_exists(DIR_IMAGE . $this->request->post['apac_categories_image'])) {
			$this->data['apac_categories_thumb'] = $this->model_tool_image->resize($this->request->post['apac_categories_image'], 100, 100);
		} elseif ($this->config->get('apac_categories_image') && file_exists(DIR_IMAGE . $this->config->get('apac_categories_image'))) {
			$this->data['apac_categories_thumb'] = $this->model_tool_image->resize($this->config->get('apac_categories_image'), 100, 100);
		} else {
			$this->data['apac_categories_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		$this->template = 'module/apac.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/apac')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['apac_products_description'] as $language_id => $value) {
			if ((mb_strlen($value['name']) < 2) || (mb_strlen($value['name']) > 255)) {
				$this->error['products_name'][$language_id] = $this->language->get('error_name');
			}
		}

		foreach ($this->request->post['apac_categories_description'] as $language_id => $value) {
			if ((mb_strlen($value['name']) < 2) || (mb_strlen($value['name']) > 255)) {
				$this->error['categories_name'][$language_id] = $this->language->get('error_name');
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	public function install() {
		$data = array();
		
		$this->load->model('module/apac');
		$data = $this->model_module_apac->installapac();
		
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('apac', array('apac_status'=>1));
		
		if ($data['success']) {
			$this->session->data['success'] = $data['message'];
		} else {
			$this->session->data['error'] = $data['message'];
		}
	}   
   
	public function uninstall() {
		$data = array();
		
        $this->load->model('module/apac');
        $data = $this->model_module_apac->uninstallapac();
         
        $this->load->model('setting/setting');
        $this->model_setting_setting->editSetting('apac', array('apac_status'=>0));

		if ($data['success']) {
			$this->session->data['success'] = $data['message'];
		} else {
			$this->session->data['error'] = $data['message'];
		}
    }
	
	public function update() {
		if (!$this->user->hasPermission('modify', 'module/apac')) {
			$this->session->data['error'] = $this->language->get('error_permission'); 
			
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		} else {
			$data = array();
		
			$this->load->model('module/apac');
			$data = $this->model_module_apac->updateapac();
			
			if ($data['success']) {
				$this->session->data['success'] = $data['message'];
			} else {
				$this->session->data['error'] = $data['message'];
			}
			
			$this->redirect($this->url->link('module/apac', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}   

}
?>