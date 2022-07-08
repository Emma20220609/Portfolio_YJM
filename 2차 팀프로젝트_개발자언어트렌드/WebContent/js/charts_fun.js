function set_chart(json, data){
	return {
		credits:
		{
			enabled: false
		},
		chart:
		{
			type: json.chart_type
		},
		plotOptions:
		{
			spline:
			{
				lineWidth: 4,
				states:
				{
					hover:
					{
						lineWidth: 5
					}
				},
				marker:
				{
					enabled: false
				}
			}
		},
		title:
		{
			text: json.title_text,
			x: -20,
			useHTML: true
		},
		subtitle:
		{
			text: json.subtitle_text,
			x: -20,
			useHTML: true
		},
		xAxis:
		{
			type: json.xAxis_type,
			categories: json.xAxis_categories, 
			dateTimeLabelFormats:
			{
				year: '%Y'
			}
		},
		yAxis:
		{
			title:
			{
				text: json.yAxis_title
			},
			plotLines: [
				{
					value: 0,
					width: 1,
					color: '#808080'
				}]
		},
		tooltip:
		{
			valueSuffix: json.tooltip_valueSuffix,
			dateTimeLabelFormats:
			{
				week: "%B %Y"
			}
		},
		legend:
		{
			align: 'center',
			borderWidth: 0
		},
		series: data
	}
}