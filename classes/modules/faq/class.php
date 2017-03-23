<?php
	class faq_custom extends def_module {

/**
		 * Возвращает список вопросов, дочерних заданной странице
		 * @param string $template имя шаблона (для tpl)
		 * @param bool|int|string $element_path идентификатор или адрес родитеской страницы
		 * @param bool|int $limit ограничение на количество выводимых вопросов
		 * @param bool $ignore_paging игнорировать пагинацию
		 * @param bool $order режим сортировки: true -> ASC, false -> DESC
		 * @param bool $showSpam выводить вопросы, отмеченные как спам
		 * @return mixed
		 * @throws selectorException
		 */
		public function categoryAll($template = "default", $element_path = false, $limit = false, $ignore_paging = false, $order = true, $showSpam = false) {
			if (!$template) {
				$template = "default";
			}

			list($template_block, $template_block_empty, $template_line) = faq::loadTemplates(
				"faq/" . $template,
				"questions_block",
				"questions_block_empty",
				"questions_block_line"
			);

			$category_id = $this->module->analyzeRequiredPath($element_path);
			$per_page = ($limit) ? $limit : $this->module->per_page;
			$curr_page = (int) getRequest('p');

			if ($ignore_paging) {
				$curr_page = 0;
			}

			$questions = new selector('pages');
			$questions->types('object-type')->name('faq', 'question');
			if ($element_path) {
				$questions->where('hierarchy')->page($category_id);
			}

			if (!$showSpam) {
				$questions->where('is_spam')->notequals(1);
			}

			$questions->option('load-all-props')->value(true);

			if ($order) {
				$questions->order('ord')->asc();
			} else {
				$questions->order('ord')->desc();
			}

			$questions->limit($curr_page * $per_page, $per_page);
			$result = $questions->result();
			$total = $questions->length();

			if ($total == 0) {
				return $template_block_empty;
			}

			$block_arr = Array();
			$block_arr['total'] = $total;
			$block_arr['per_page'] = $per_page;
			$lines = Array();
			$umiLinksHelper = umiLinksHelper::getInstance();

			foreach ($result as $question) {
				if (!$question instanceof umiHierarchyElement) {
					continue;
				}

				$element_id = $question->getId();
				$line_arr = Array();
				$line_arr['attribute:id'] = $element_id;
				$line_arr['attribute:name'] = $line_arr['void:text'] = $question->getName();
				$line_arr['void:alt_name'] = $question->getAltName();
				$line_arr['attribute:link'] = $umiLinksHelper->getLinkByParts($question);
				$line_arr['xlink:href'] = "upage://" . $element_id;
				$line_arr['question'] = nl2br($question->getValue("question"));
				$line_arr['answer'] = ($answer = $question->getValue("answer")) ? nl2br($answer) : nl2br($question->getValue("content"));

				faq::pushEditable("faq", "question", $element_id);
				$lines [] = faq::parseTemplate($template_line, $line_arr, $element_id);
			}

			$block_arr['subnodes:items'] = $block_arr['void:lines'] = $lines;
			return faq::parseTemplate($template_block, $block_arr, $category_id);
		}
	}