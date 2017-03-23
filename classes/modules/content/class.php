<?php
class content_custom extends def_module
{

    public function customIncludeQuickEditJs()
    {
        $config      = mainConfiguration::getInstance();
        $build       = regedit::getInstance()->getVal("modules/autoupdate/system_build");
        $permissions = permissionsCollection::getInstance();
        $userId      = $permissions->getUserId();

        $currentDomain        = cmsController::getInstance()->getCurrentDomain();
        $isAllowedMethod      = $permissions->isAllowedMethod($userId, "content", "sitetree");
        $isAllowedDomain      = $permissions->isAllowedDomain($userId, $currentDomain->getId());
        $isAllowedEditInPlace = $isAllowedMethod && $isAllowedDomain;

        if ($isAllowedEditInPlace) {
            $cmsController   = cmsController::getInstance();
            $langsCollection = langsCollection::getInstance();
            $langPrefix      = '';

            if ($cmsController->getLang()->getId() != $langsCollection->getDefaultLang()->getId()) {
                $langPrefix = $cmsController->getLang()->getPrefix();
            }

            $session         = session::getInstance();
            $sessionLifetime = $session->getMaxActiveTime();
            $csrfToken       = $session->get('csrf_token');
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
            $pageId   = $cmsController->getCurrentElementId();
            $pageData = json_encode([
                'pageId'    => $pageId,
                'page'      => [
                    'alt-name' => ($pageId) ? umiHierarchy::getInstance()->getElement($pageId)->getAltName() : '',
                ],
                'title'     => def_module::parseTPLMacroses(macros_title()),
                'lang'      => $cmsController->getCurrentLang()->getPrefix(),
                'lang_id'   => $cmsController->getCurrentLang()->getId(),
                'domain'    => $cmsController->getCurrentDomain()->getHost(),
                'domain_id' => $cmsController->getCurrentDomain()->getId(),
                'meta'      => [
                    'keywords'    => macros_keywords(),
                    'description' => macros_describtion(),
                ],
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

    public function convertDate($_iTimeStamp, $_sFormat, $flag = false)
    {

        $aMonthLong = array(
            'января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря',
        );

        $aMonthShort = array(
            "Янв",
            "Фев",
            "Мар",
            "Апр",
            "Май",
            "Июнь",
            "Июль",
            "Авг",
            "Сен",
            "Окт",
            "Ноя",
            "Дек",
        );

        if ($_iTimeStamp == -1) {
            $_iTimeStamp = time();
        }

        $iFormatLength = strlen($_sFormat);
        $sDate         = "";
        $aaDate        = array();
        for ($i = 0; $i < $iFormatLength; $i++) {
            switch ($_sFormat[$i]) {
                case 'F':{
                        $sDate .= $aMonthLong[intval(date("n", $_iTimeStamp))];
                        $aaDate[$_sFormat[$i]] = $aMonthLong[intval(date("n", $_iTimeStamp))];
                        break;
                    }
                case 'M':{
                        $sDate .= $aMonthShort[intval(date("n", $_iTimeStamp)) - 1];
                        $aaDate[$_sFormat[$i]] = $aMonthShort[intval(date("n", $_iTimeStamp)) - 1];
                        break;
                    }
                default:{
                        $sDate .= date($_sFormat[$i], $_iTimeStamp);
                        if (date($_sFormat[$i], $_iTimeStamp) !== ' ') {
                            $aaDate[$_sFormat[$i]] = date($_sFormat[$i], $_iTimeStamp);
                        }
                    }
            }
        }
        if ($flag) {
            return $aaDate;
        }
        return $sDate;
    }

    public function setReq($name = false, $stat, $value)
    {
        if (!$name) {
            return false;
        }
        if (is_numeric($value)) {
            $_REQUEST['fields_filter'][$name][$stat] = $value;
            return true;
        }
    }

    public function unsetReq($name = false, $stat, $value)
    {
        if (!$name) {
            return false;
        }
        if (is_numeric($value)) {
            unset($_REQUEST['fields_filter'][$name]);
            return true;
        }
    }

    public function isAjaxRequest()
    {
        $res = 'no';
        if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $res = 'yes';
        }
        return $res;
    }

    public function getTags($id = 0, $template = 'default', $dept = 1)
    {
        $array_res = array();

        list($items_template, $item_template) = def_module::loadTemplates('/content/' . $template, 'items', 'item');


        $select = new selector('pages');
        $select->where('hierarchy')->page($id)->childs($dept);

        $tags = array();

        foreach ($select as $key => $value) {
            $hierarchy = umiHierarchy::getInstance();
            $page      = $hierarchy->getElement($value->id);
            $t         = $page->getValue('tags');

            if (count($t) != 0 && $t != null) {
                $tags = array_merge($tags, $t);
            }
        }
        $tags = array_unique($tags);

        $fields_filter = getRequest('fields_filter');
        // if (condition) {
        // 	# code...
        // }

        foreach ($tags as $tag) {
			$item['attribute:value'] = $tag;
            
            if (getRequest('fields_filter')) {
            	# code...
            }

            $item['node:text'] = $tag;

            $items[]                 = def_module::parseTemplate($item_template, $item);
        }
        $blockItems                   = array();
        $blockItems['subnodes:items'] = $items;

        return def_module::parseTemplate($items_template, $blockItems);
    }

}
