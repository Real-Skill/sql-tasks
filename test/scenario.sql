--statement="./schema.sql"
--statement="./data.sql"
--statement="../solution/view_breed.sql"
--statement select basic breed information
SELECT * FROM view_breed;
--expect breed listing with SI metrics
id,name,origin,height,weight
14,Newfoundland,Canada,69,57
16,Rottweiler,Germany,61,45
1,Akita,Japan,64,44
20,German Shepherd Dog,Germany,61,39
13,Labrador Retriever,Canada,58,30
12,Irish Setter,Ireland,66,29
11,Golden Retriever,England,58,29
4,Boxer,Germany,58,29
8,Collie,Scotland,61,28
7,Chow Chow,China,46,26
5,Bull Terrier,England,53,25
10,Dalmatian,Yugoslavia,53,23
9,Border Collie,Great Britain,51,17
2,American Cocker Spaniel,United States,38,12
3,Beagle,England,36,11
18,Shetland Sheepdog,Scotland,36,9
19,Poodle (Miniature),Germany,30,7
15,Papillon,France,23,4
17,Yorkshire Terrier,England,20,3
6,Chihuahua,Mexico,18,3


--statement="./data2.sql"
--statement="../solution/view_breed.sql"
--statement select basic breed information
SELECT * FROM view_breed;
--expect breed listing with SI metrics
id,name,origin,height,weight
21,Akita,Japan,64,44
25,German Shepherd Dog,Germany,61,39
22,American Cocker Spaniel,United States,38,12
23,Shetland Sheepdog,Scotland,36,9
24,Poodle (Miniature),Germany,30,7
