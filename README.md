# zsla

Zero-Shot Label Description Aggregation

This repository contains additional material for the *Unsupervised Ranking and Aggregation of Label Descriptions for Zero-Shot Models* paper.

The file *experiments.jsonnet* contains all the label descriptions and patterns used for the experiments. To completely populate file, install the [jsonnet](https://jsonnet.org/learning/getting_started.html) interpreter and execute it:

```bash
jsonnet experiments.jsonnet
```
# Label Descriptions and Patterns
Here we list the label descriptions, patterns and null hypothesis (NH) used for the experiments.
## ag_news 
### Label Descriptions
 |    | labels   | manual                                              |
|---:|:---------|:----------------------------------------------------|
|  0 | Business | ['business', 'markets', 'money']                    |
|  1 | Sci/Tech | ['science and technology', 'technology', 'science'] |
|  2 | Sports   | ['sports', 'fitness', 'races']                      |
|  3 | World    | ['world', 'global', 'international']                |

NH: ['business', 'science and technology', 'sports', 'world']
### Patterns
 |    | patterns       |
|---:|:---------------|
|  0 | It is {} news. |
|  1 | {}             |
|  2 | Category: {}.  |
|  3 | Section {}.    |
## cola 
### Label Descriptions
 |    | labels       | manual           |
|---:|:-------------|:-----------------|
|  0 | acceptable   | ['acceptable']   |
|  1 | unacceptable | ['unacceptable'] |

NH: ['acceptable', 'unacceptable']
### Patterns
 |    | patterns                                   |
|---:|:-------------------------------------------|
|  0 | {}                                         |
|  1 | It is {}.                                  |
|  2 | This sentence is {}.                       |
|  3 | This sentence is grammatically {}.         |
|  4 | The grammaticality of this sentence is {}. |
## imdb 
### Label Descriptions
 |    | labels   | manual                                     |
|---:|:---------|:-------------------------------------------|
|  0 | neg      | ['terrible', 'really terrible', 'awful']   |
|  1 | pos      | ['great', 'really great', 'a masterpiece'] |

NH: ['terrible', 'great']
### Patterns
 |    | patterns                     |
|---:|:-----------------------------|
|  0 | It was {}.                   |
|  1 | All in all, it was {}.       |
|  2 | Just {}!                     |
|  3 | In summary, the movie is {}. |
|  4 | {}                           |
## stancecat 
### Label Descriptions
 |    | labels   | manual                                 |
|---:|:---------|:---------------------------------------|
|  0 | against  | ['against', 'negative', 'deny']        |
|  1 | favor    | ['in favor', 'positive', 'support']    |
|  2 | neutral  | ['impartial', 'neutral', 'neutrality'] |

NH: ['against', 'in favor', 'impartial']
### Patterns
 |    | patterns                           |
|---:|:-----------------------------------|
|  0 | {}                                 |
|  1 | {} toward the Catalan independence |
|  2 | {} the independence                |
## subj 
### Label Descriptions
 |    | labels     | manual                               |
|---:|:-----------|:-------------------------------------|
|  0 | objective  | ['objective', 'neutral', 'detached'] |
|  1 | subjective | ['subjective', 'biased', 'personal'] |

NH: ['objective', 'subjective']
### Patterns
 |    | patterns       |
|---:|:---------------|
|  0 | {}             |
|  1 | It is {}       |
|  2 | The text is {} |
## yelp_polarity 
### Label Descriptions
 |    |   labels | manual                                |
|---:|---------:|:--------------------------------------|
|  0 |        1 | ['terrible', 'awful', 'really bad']   |
|  1 |        2 | ['great', 'really good', 'excellent'] |

NH: ['terrible', 'great']
### Patterns
 |    | patterns                          |
|---:|:----------------------------------|
|  0 | It was {}.                        |
|  1 | All in all, it was {}.            |
|  2 | Just {}!                          |
|  3 | In summary, the restaurant is {}. |
## yelp_review_full 
### Label Descriptions
 |    | labels   | manual                                |
|---:|:---------|:--------------------------------------|
|  0 | 1 star   | ['terrible', 'awful', 'really bad']   |
|  1 | 2 star   | ['bad', 'not ok', 'disgusting']       |
|  2 | 3 stars  | ['okay', 'fair', 'ok']                |
|  3 | 4 stars  | ['good', 'nice', 'quite good']        |
|  4 | 5 stars  | ['great', 'really good', 'excellent'] |

NH: ['terrible', 'bad', 'okay', 'good', 'great']
### Patterns
 |    | patterns                          |
|---:|:----------------------------------|
|  0 | It was {}.                        |
|  1 | All in all, it was {}.            |
|  2 | Just {}!                          |
|  3 | In summary, the restaurant is {}. |
