module ConditionsHelper

	BASIC_RULES = {
		"Equal": "=",
		"Grater Than": ">",
		"Multipile of": "%"
	}


	def rule_select_box
		select_tag("condition[decision_params][rule]" ,options_for_select(BASIC_RULES))
	end

end
