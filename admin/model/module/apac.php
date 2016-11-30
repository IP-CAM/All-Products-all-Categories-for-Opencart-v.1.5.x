<?php
class ModelModuleAPAC extends Model {
	public function installAPAC() {
		$data = array();
		$msg = '';
		$success = false;
		
		// NO DB MODS in v1.0.0 //
		$success = true;
		
		$data['success'] = $success;
		$data['message'] = $msg;
		
		if ($success) {
			$data['message'] = "<b>APAC Module successfully installed!</b>";
			if ($msg) {
				$data['message'] = $data['message'] . "<br><br> " . $msg;
			}
			$this->log->write("APAC Module successfully installed: " . $msg);			
			return $data;
		} else {
			$data['message'] = "<b>NO CHANGES MADE</b>";
			if ($msg) {
				$data['message'] = $data['message'] . "<br><br> " . $msg;
			}
			$this->log->write("APAC Module unsuccessfully installed (NO CHANGES MADE): " . $msg);
			return $data;
		}
	}
	
	public function uninstallAPAC() {
		$data = array();
		$msg = '';
		$success = false;
		
		// UNINSTALL //
		$success = true;
		
		$data['success'] = $success;
		$data['message'] = $msg;
		
		if ($success) {
			$data['message'] = "<b>APAC Module successfully uninstalled!</b>";
			if ($msg) {
				$data['message'] = $data['message'] . "<br><br> " . $msg;
			}
			$data['message'] = $data['message'] . "<br><b>DON'T FORGET TO REMOVE the vqmod XML file!</b> ;)";
			$this->log->write("APAC Module successfully uninstalled (DON'T FORGET TO REMOVE the vqmod XML file): " . $msg);
			return $data;
		} else {
			$data['message'] = "<b>NO CHANGES MADE</b>";
			if ($msg) {
				$data['message'] = $data['message'] . "<br><br> " . $msg;
			}
			$this->log->write("APAC Module unsuccessfully uninstalled (NO CHANGES MADE): " . $msg);
			return $data;
		}
	}

	public function updateAPAC() {
		$data = array();
		$msg = '';
		$success = false;

		// UPDATES //
		
		$data['success'] = $success;
		$data['message'] = $msg;
		
		if ($success) {
			$data['message'] = "<b>APAC Module successfully updated!</b>";
			if ($msg) {
				$data['message'] = $data['message'] . "<br><br> " . $msg;
			}
			$this->log->write("APAC Module successfully updated: " . $msg);			
			return $data;
		} else {
			$data['message'] = "<b>NO CHANGES MADE</b>";
			if ($msg) {
				$data['message'] = $data['message'] . "<br><br> " . $msg;
			}
			$this->log->write("APAC Module unsuccessfully updated (NO CHANGES MADE): " . $msg);
			return $data;
		}
		
	}
	
}
?>