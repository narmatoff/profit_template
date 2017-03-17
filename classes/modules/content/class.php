<?php
	class content_custom extends def_module {

		public function customIncludeQuickEditJs()
		{
			$config = mainConfiguration::getInstance();
			$build = regedit::getInstance()->getVal("modules/autoupdate/system_build");
			$permissions = permissionsCollection::getInstance();
			$userId = $permissions->getUserId();

			
			$currentDomain = cmsController::getInstance()->getCurrentDomain();
			$isAllowedMethod = $permissions->isAllowedMethod($userId, "content", "sitetree");
			$isAllowedDomain = $permissions->isAllowedDomain($userId, $currentDomain->getId());
			$isAllowedEditInPlace = $isAllowedMethod && $isAllowedDomain;

			if ($isAllowedEditInPlace) {
				$cmsController = cmsController::getInstance();
				$langsCollection = langsCollection::getInstance();
				$langPrefix = '';

				if ($cmsController->getLang()->getId() != $langsCollection->getDefaultLang()->getId()) {
					$langPrefix = $cmsController->getLang()->getPrefix();
				}

				$session = session::getInstance();
				$sessionLifetime = $session->getMaxActiveTime();
				$csrfToken = $session->get('csrf_token');
				$session->commit();

				$sessionAccess = $permissions->isAllowedModule($userId, 'config') ? 'true' : 'false';

				$eipTheme = $config->get("edit-in-place", "theme");

				if (strlen($eipTheme)) {
					$eipTheme = "<link type=\"text/css\" rel=\"stylesheet\" href=\"" . substr($eipTheme, 1) . "?{$build}\" />";
				}

				$eipWYSIWYG = $config->get("edit-in-place", "wysiwyg");

				if (!strlen($eipWYSIWYG)) {
					$eipWYSIWYG = 'tinymce4';
				}

				// инициализация служебной информации о странице для frontend
				$pageId = $cmsController->getCurrentElementId();
				$pageData = json_encode([
						'pageId' => $pageId,
						'page' => [
								'alt-name' => ($pageId) ? umiHierarchy::getInstance()->getElement($pageId)->getAltName() : ''
						],
						'title' => def_module::parseTPLMacroses(macros_title()),
						'lang' => $cmsController->getCurrentLang()->getPrefix(),
						'lang_id' => $cmsController->getCurrentLang()->getId(),
						'domain' => $cmsController->getCurrentDomain()->getHost(),
						'domain_id' => $cmsController->getCurrentDomain()->getId(),
						'meta' => [
								'keywords' => macros_keywords(),
								'description' => macros_describtion()
						]
				]);
				$HTML = <<<HTML

				<link type="text/css" rel="stylesheet" href="/js/cms/compiled.css?{$build}" />
				{$eipTheme}

				<script type="text/javascript" charset="utf-8" src="/ulang/common.js?{$build}"></script>
				<script type="text/javascript" src="/js/cms/jquery.compiled.js?{$build}" charset="utf-8"></script>
				<script type="text/javascript" src="/js/cms/compiled.js?{$build}" charset="utf-8"></script>

				<script type="text/javascript">
					// вывод служебной информации о странице для frontend
					window.pageData = {$pageData};

					uAdmin({
						'lang_prefix': '{$langPrefix}',
						'csrf': '{$csrfToken}'
					});
					uAdmin({
						'lifetime' : {$sessionLifetime},
						'access'   : {$sessionAccess}
					}, 'session');
					uAdmin('type', '{$eipWYSIWYG}', 'wysiwyg');
				</script>

HTML;
			return $HTML;
			} 

		}

		public function convertDate($timestamp)
		{

			$day = date('d', $timestamp);
		    $month = date('n', $timestamp);
		    $year = date('Y', $timestamp);
		 
		    // Проверка существования месяца
		    if (!checkdate($month, 1, $year)){
		        throw new publicException("Проверьте порядок ввода даты.");
		    }
		 
		    $months_ru = array(1 => 'января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря');
		    $date_ru = $day . '&nbsp;' . $months_ru[$month] . '&nbsp;' . $year;
		    return $date_ru;  

		}

		
	}