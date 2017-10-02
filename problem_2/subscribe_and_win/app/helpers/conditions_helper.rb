module ConditionsHelper

	BASIC_RULES = {
		"Equal": "=",
		"Grater Than": ">",
		"Less Than": "<",
		"Multipile of": "%"
	}


	def rule_select_box
		select_tag("condition[decision_params][rule]" ,options_for_select(BASIC_RULES),class: "form-control")
	end

end
