---
title: "CodeBook"
author: "Matthew Layton"
---

#Overview
The run_analysis script uses data from the following files to generate an aggregated set of data showing the mean and standard deviation for each Subject and Activity grouping against each variable. The source data represents movement of subjects performing daily activities such as walking, sitting and laying.

Source Files used:

- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Movement of subjects in each activity, broken down by time intervals
- 'y_train.txt': Labels for the activities performed, these will match to the activity_labels.txt
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'features.txt': List of all features. Each entry represents a column in the x file.

The script merges the test and training set data together, extract the mean and standard deviation columns on each row then aggregates the data as described above. The aggregated data is then ordered by subject and activity for ease of use.

#Output Columns

* SubjectID - The ID's for each subject that performed in the experiment. Possible Values: 
    + 1 to 30
* Acitivity (ActivityID) - The Activities performed. Possible Values:
    + WALKING (1)
    + WALKING_UPSTAIRS (2)
    + WALKING_DOWNSTAIRS (3)
    + SITTING (4)
    + STANDING (5)
    + LAYING (6)
* ActivityID - See bracketed values above for ID mapping to Activity.
* \*mean()\* - The average of each measurement relating to mean
* \*std()\* - The average of each measurement relating to standard deviation (std)

#Example
The is the output of the script:
```
run_analysis()
    SubjectID           Activity ActivityID       Mean StandardDeviation
1           1            WALKING          1 -0.3191058         0.4527227
31          1   WALKING_UPSTAIRS          2 -0.4069966         0.4848629
61          1 WALKING_DOWNSTAIRS          3 -0.2972263         0.4555146
91          1            SITTING          4 -0.6334052         0.5464779
121         1           STANDING          5 -0.6474248         0.5421813
151         1             LAYING          6 -0.6075224         0.5422944
2           2            WALKING          1 -0.3857081         0.4717514
32          2   WALKING_UPSTAIRS          2 -0.3639833         0.4667040
62          2 WALKING_DOWNSTAIRS          3 -0.2596773         0.4657295
92          2            SITTING          4 -0.6405979         0.5369141
122         2           STANDING          5 -0.6364550         0.5360594
152         2             LAYING          6 -0.6399738         0.5433183
3           3            WALKING          1 -0.3868659         0.4704295
33          3   WALKING_UPSTAIRS          2 -0.4242747         0.4832802
63          3 WALKING_DOWNSTAIRS          3 -0.3505361         0.4715654
93          3            SITTING          4 -0.6227808         0.5354814
123         3           STANDING          5 -0.6268247         0.5239812
153         3             LAYING          6 -0.6414458         0.5312469
4           4            WALKING          1 -0.4305566         0.4855364
34          4   WALKING_UPSTAIRS          2 -0.4152604         0.4823427
64          4 WALKING_DOWNSTAIRS          3 -0.3637904         0.4855038
94          4            SITTING          4 -0.6270750         0.5306369
124         4           STANDING          5 -0.6185838         0.5303511
154         4             LAYING          6 -0.6308751         0.5389189
5           5            WALKING          1 -0.3785351         0.4713490
35          5   WALKING_UPSTAIRS          2 -0.3563535         0.4710165
65          5 WALKING_DOWNSTAIRS          3 -0.2969016         0.4796059
95          5            SITTING          4 -0.6270148         0.5317346
125         5           STANDING          5 -0.6188215         0.5264826
155         5             LAYING          6 -0.6317935         0.5443919
6           6            WALKING          1 -0.3375134         0.4629954
36          6   WALKING_UPSTAIRS          2 -0.3306423         0.4649161
66          6 WALKING_DOWNSTAIRS          3 -0.1989224         0.4780075
96          6            SITTING          4 -0.6254130         0.5285603
126         6           STANDING          5 -0.6292532         0.5249189
156         6             LAYING          6 -0.6194214         0.5330512
7           7            WALKING          1 -0.3067645         0.4586582
37          7   WALKING_UPSTAIRS          2 -0.4274083         0.4789671
67          7 WALKING_DOWNSTAIRS          3 -0.3171295         0.4735304
97          7            SITTING          4 -0.6288331         0.5364193
127         7           STANDING          5 -0.6336901         0.5289532
157         7             LAYING          6 -0.6283033         0.5422838
8           8            WALKING          1 -0.2997555         0.4604279
38          8   WALKING_UPSTAIRS          2 -0.2933778         0.4645828
68          8 WALKING_DOWNSTAIRS          3 -0.1935199         0.4587247
98          8            SITTING          4 -0.6377265         0.5378759
128         8           STANDING          5 -0.6394637         0.5377257
158         8             LAYING          6 -0.6270895         0.5455211
9           9            WALKING          1 -0.3716466         0.4672677
39          9   WALKING_UPSTAIRS          2 -0.4270754         0.4808562
69          9 WALKING_DOWNSTAIRS          3 -0.3131407         0.4758283
99          9            SITTING          4 -0.6275308         0.5244758
129         9           STANDING          5 -0.6337136         0.5260307
159         9             LAYING          6 -0.6284140         0.5300630
10         10            WALKING          1 -0.3270868         0.4592269
40         10   WALKING_UPSTAIRS          2 -0.3456526         0.4630531
70         10 WALKING_DOWNSTAIRS          3 -0.2631621         0.4633374
100        10            SITTING          4 -0.6400786         0.5422512
130        10           STANDING          5 -0.6308865         0.5267555
160        10             LAYING          6 -0.6336063         0.5381438
11         11            WALKING          1 -0.4313665         0.4778994
41         11   WALKING_UPSTAIRS          2 -0.4352751         0.4946813
71         11 WALKING_DOWNSTAIRS          3 -0.3487174         0.4771732
101        11            SITTING          4 -0.6360816         0.5360995
131        11           STANDING          5 -0.6483745         0.5362027
161        11             LAYING          6 -0.6435530         0.5395622
12         12            WALKING          1 -0.3555602         0.4659347
42         12   WALKING_UPSTAIRS          2 -0.4217916         0.4801842
72         12 WALKING_DOWNSTAIRS          3 -0.3114904         0.4791021
102        12            SITTING          4 -0.6363018         0.5262287
132        12           STANDING          5 -0.6276840         0.5302192
162        12             LAYING          6 -0.6301292         0.5287183
13         13            WALKING          1 -0.3169888         0.4608544
43         13   WALKING_UPSTAIRS          2 -0.4115821         0.4814000
73         13 WALKING_DOWNSTAIRS          3 -0.3172347         0.4631917
103        13            SITTING          4 -0.6381791         0.5430666
133        13           STANDING          5 -0.6392977         0.5351873
163        13             LAYING          6 -0.6243379         0.5537555
14         14            WALKING          1 -0.3855018         0.4600957
44         14   WALKING_UPSTAIRS          2 -0.2854864         0.5119974
74         14 WALKING_DOWNSTAIRS          3 -0.2033784         0.4747846
104        14            SITTING          4 -0.6399308         0.5280380
134        14           STANDING          5 -0.6337711         0.5303789
164        14             LAYING          6 -0.6283556         0.5299594
15         15            WALKING          1 -0.3905263         0.4709301
45         15   WALKING_UPSTAIRS          2 -0.3937209         0.4813603
75         15 WALKING_DOWNSTAIRS          3 -0.2802273         0.4789135
105        15            SITTING          4 -0.6414962         0.5371099
135        15           STANDING          5 -0.6400371         0.5319418
165        15             LAYING          6 -0.6398831         0.5312659
16         16            WALKING          1 -0.4313628         0.4771812
46         16   WALKING_UPSTAIRS          2 -0.4401465         0.4852160
76         16 WALKING_DOWNSTAIRS          3 -0.3390803         0.4803171
106        16            SITTING          4 -0.6422540         0.5406609
136        16           STANDING          5 -0.6465384         0.5360280
166        16             LAYING          6 -0.6359061         0.5408056
17         17            WALKING          1 -0.3870395         0.4713403
47         17   WALKING_UPSTAIRS          2 -0.4014314         0.4794258
77         17 WALKING_DOWNSTAIRS          3 -0.3651945         0.4828801
107        17            SITTING          4 -0.6437074         0.5470980
137        17           STANDING          5 -0.6446751         0.5413861
167        17             LAYING          6 -0.6298764         0.5441119
18         18            WALKING          1 -0.4363061         0.4740079
48         18   WALKING_UPSTAIRS          2 -0.4706815         0.4900717
78         18 WALKING_DOWNSTAIRS          3 -0.4386638         0.4846481
108        18            SITTING          4 -0.6502402         0.5343959
138        18           STANDING          5 -0.6455185         0.5309998
168        18             LAYING          6 -0.6450399         0.5399090
19         19            WALKING          1 -0.2382528         0.4412227
49         19   WALKING_UPSTAIRS          2 -0.3168211         0.4579598
79         19 WALKING_DOWNSTAIRS          3 -0.0783064         0.4932673
109        19            SITTING          4 -0.6389867         0.5320941
139        19           STANDING          5 -0.6401367         0.5311598
169        19             LAYING          6 -0.6329992         0.5464617
20         20            WALKING          1 -0.2595181         0.4584752
50         20   WALKING_UPSTAIRS          2 -0.3382919         0.4670247
80         20 WALKING_DOWNSTAIRS          3 -0.2471697         0.4716203
110        20            SITTING          4 -0.6398727         0.5277671
140        20           STANDING          5 -0.6200277         0.5236017
170        20             LAYING          6 -0.6443974         0.5323113
21         21            WALKING          1 -0.3306487         0.4622613
51         21   WALKING_UPSTAIRS          2 -0.3819670         0.4735547
81         21 WALKING_DOWNSTAIRS          3 -0.2913020         0.4756221
111        21            SITTING          4 -0.6447245         0.5341933
141        21           STANDING          5 -0.6384502         0.5280225
171        21             LAYING          6 -0.6311088         0.5433985
22         22            WALKING          1 -0.2742010         0.4600108
52         22   WALKING_UPSTAIRS          2 -0.3051855         0.4689280
82         22 WALKING_DOWNSTAIRS          3 -0.2876648         0.4776727
112        22            SITTING          4 -0.6340156         0.5320220
142        22           STANDING          5 -0.6359921         0.5299998
172        22             LAYING          6 -0.6321091         0.5340824
23         23            WALKING          1 -0.2652967         0.4640981
53         23   WALKING_UPSTAIRS          2 -0.3695813         0.4671649
83         23 WALKING_DOWNSTAIRS          3 -0.2024655         0.4574307
113        23            SITTING          4 -0.6328435         0.5430592
143        23           STANDING          5 -0.6370242         0.5310884
173        23             LAYING          6 -0.6280895         0.5515766
24         24            WALKING          1 -0.4169752         0.4739460
54         24   WALKING_UPSTAIRS          2 -0.4358383         0.4742516
84         24 WALKING_DOWNSTAIRS          3 -0.3590860         0.4729904
114        24            SITTING          4 -0.6466195         0.5269258
144        24           STANDING          5 -0.6341949         0.5334466
174        24             LAYING          6 -0.6342034         0.5417379
25         25            WALKING          1 -0.4608421         0.4827575
55         25   WALKING_UPSTAIRS          2 -0.4855122         0.4930893
85         25 WALKING_DOWNSTAIRS          3 -0.4299244         0.4804874
115        25            SITTING          4 -0.6453075         0.5342049
145        25           STANDING          5 -0.6452980         0.5285007
175        25             LAYING          6 -0.5895067         0.5454504
26         26            WALKING          1 -0.3920088         0.4650801
56         26   WALKING_UPSTAIRS          2 -0.4116728         0.4801368
86         26 WALKING_DOWNSTAIRS          3 -0.3224731         0.4671515
116        26            SITTING          4 -0.6427185         0.5381638
146        26           STANDING          5 -0.6440045         0.5336945
176        26             LAYING          6 -0.6406799         0.5455362
27         27            WALKING          1 -0.3777713         0.4684903
57         27   WALKING_UPSTAIRS          2 -0.4262671         0.4867128
87         27 WALKING_DOWNSTAIRS          3 -0.3124461         0.4743538
117        27            SITTING          4 -0.6473298         0.5339850
147        27           STANDING          5 -0.6443562         0.5350525
177        27             LAYING          6 -0.6459936         0.5399912
28         28            WALKING          1 -0.3937873         0.4680824
58         28   WALKING_UPSTAIRS          2 -0.4010930         0.4735844
88         28 WALKING_DOWNSTAIRS          3 -0.2916509         0.4625632
118        28            SITTING          4 -0.6373225         0.5235502
148        28           STANDING          5 -0.6278835         0.5199902
178        28             LAYING          6 -0.6405187         0.5309764
29         29            WALKING          1 -0.3528949         0.4597504
59         29   WALKING_UPSTAIRS          2 -0.3644297         0.4850091
89         29 WALKING_DOWNSTAIRS          3 -0.3172628         0.4667981
119        29            SITTING          4 -0.6441007         0.5403079
149        29           STANDING          5 -0.6502453         0.5362099
179        29             LAYING          6 -0.6463247         0.5473846
30         30            WALKING          1 -0.3736075         0.4587416
60         30   WALKING_UPSTAIRS          2 -0.4393707         0.4895201
90         30 WALKING_DOWNSTAIRS          3 -0.3587906         0.4645257
120        30            SITTING          4 -0.6460179         0.5328357
150        30           STANDING          5 -0.6306355         0.5276991
180        30             LAYING          6 -0.6426253         0.5290101
```
