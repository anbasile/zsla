local BaseDataset = {
	local dataset = self,
	name: '',
	col_names:{
		text:'text',
		label:'label'
	},
	name2labels: {},
	label_names: std.objectFields(self.name2labels),
	label2name: {[""+v]:k for k in std.objectFields(self.name2labels) for v in self.name2labels[k]},
	null_hypothesis: {[""+k]:[dataset.name2labels[k][0]] for k in std.objectFields(self.name2labels)},
	templates:[]
};

{
	datasets:{
		"yelp_polarity": BaseDataset + {
			name: "yelp_polarity",
			name2labels: {
				"1": ["terrible", "awful", "really bad"],
				"2": ["great", "really good", "excellent"],
				},
			templates:["It was {}.", "All in all, it was {}.", "Just {}!", "In summary, the restaurant is {}."],
		},
		"yelp_review_full": self.yelp_polarity + {
			name: "yelp_review_full",
			name2labels:{
				"1 star": ["terrible", "awful", "really bad"],
		 		"2 star": ["bad", "not ok", "disgusting"],
		 		"3 stars": ["okay", "fair", "ok"],
		 		"4 stars": ["good", "nice", "quite good"],
		 		"5 stars": ["great", 'really good', 'excellent'],
		 		},
		 	templates:["It was {}.", "All in all, it was {}.", "Just {}!", "In summary, the restaurant is {}."],
			},
		"imdb": BaseDataset + {
			name: "imdb",
			name2labels: {
				"neg": ["terrible", "really terrible", "awful"],
				"pos": ["great", "really great", "a masterpiece"],
				},
		 	templates:["It was {}.", "All in all, it was {}.", "Just {}!", "In summary, the movie is {}.", "{}"],
			},
		"ag_news":self.yelp_polarity + {
			name: "ag_news",
			name2labels:{
				"World": ["world", "global", "international"],
				"Sports": ["sports", "fitness", "races"],
				"Business": ["business", "markets", "money"],
				"Sci/Tech": ["science and technology", "technology", "science"],
			},
			templates:["It is {} news.", "{}", "Category: {}.", "Section {}."],
		},
		"yahoo_answers_topics"::self.yelp_polarity + {
			col_names:{
				'text': 'question_content',
				'label':'topic'},
			name2labels: {
				"Society & Culture":["Society & Culture"],
				"Science & Mathematics":["Science & Mathematics"],
				"Health":["Health"],
				"Education & Reference":["Education & Reference"],
				"Computer & Internet":["Computer & Internet"],
				"Sports":["Sports"],
				"Business & Finance":["Business & Finance"],
				"Entertainment & Music":["Entertainment & Music"],
				"Family & Relationships":["Family & Relationships"],
				"Politics & Government":["Politics & Government"],
			},
			templates:["{}", "Category: {}.", "Section: {}."],
			},
		"subj": BaseDataset +{
			name: "subj",
			hfname: "SetFit/subj",
			hfconfig: "default",
			hfsplit:"test",
			name2labels:{
				"objective":["objective", "neutral", "detached"],
				"subjective":["subjective", "biased", "personal"],
				},
			templates:["{}", "It is {}", "The text is {}"],
		},
		"cola": BaseDataset + {
			name: "cola",
			hfname: "glue",
			hfconfig: "cola",
			hfsplit: "validation",
			col_names+: {'text': 'sentence'},
			name2labels:{
				"unacceptable":["unacceptable"],
				"acceptable":["acceptable"]
				},
			templates:["{}", "It is {}.", "This sentence is {}.", "This sentence is grammatically {}.", "The grammaticality of this sentence is {}."],
		},
		"stancecat": BaseDataset + {
			name: "stancecat",
			hfname: "src/data/loaders/stancecat.py",
			hfsplit: "train",
			hfconfig: "default",
			name2labels: {
				"against":["against", "negative", "deny"],
				"neutral": ["impartial", "neutral", "neutrality"],
				"favor": ["in favor", "positive", "support"]},
			templates:["{}", "{} toward the Catalan independence", "{} the independence"],
		},
		"amazon_reviews_multi": self.yelp_polarity + {
			name: "amazon_reviews_multi",
			col_names:{
				'text': 'review_body',
				'label':'stars'},
			name2labels:{
				"1":["terrible", "really bad", "extremely bad"],
				"2":["bad", "not ok", "kind of bad"],
				"3":["okay", "not really good", "ok"],
				"4":["good", "more than ok", "great"],
				"5":["excellent", "really good", "awesome"],
				},
			templates:["This product is {}.", "{}", "I think this product is {}."],
			},
	}
}
