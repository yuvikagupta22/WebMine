--
-- PostgreSQL database dump
--

\restrict bosBgP23LqDlF8mwSO2evz9DEOvlit1Kf1NC1LWiLtodYYP8mdcnk6SBaCoaBFP

-- Dumped from database version 18.7
-- Dumped by pg_dump version 18.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: amazon; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA amazon;


ALTER SCHEMA amazon OWNER TO postgres;

--
-- Name: bsc; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bsc;


ALTER SCHEMA bsc OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categorysentiment; Type: TABLE; Schema: amazon; Owner: postgres
--

CREATE TABLE amazon.categorysentiment (
    valuationdate date NOT NULL,
    category character varying(255) NOT NULL,
    categorysummary text,
    positivekeywords text,
    negativekeywords text,
    mixedkeywords text,
    avgprice numeric(12,2),
    avgrating numeric(3,2)
);


ALTER TABLE amazon.categorysentiment OWNER TO postgres;

--
-- Name: competitors; Type: TABLE; Schema: amazon; Owner: postgres
--

CREATE TABLE amazon.competitors (
    valuationdate date NOT NULL,
    asin character varying(50) NOT NULL,
    compasin character varying(50) NOT NULL,
    compsku character varying(255),
    category character varying(255),
    comprating numeric(3,1),
    compbrand character varying(255),
    volume character varying(50),
    sku character varying(255)
);


ALTER TABLE amazon.competitors OWNER TO postgres;

--
-- Name: dsrdump; Type: TABLE; Schema: amazon; Owner: postgres
--

CREATE TABLE amazon.dsrdump (
    valuationdate date NOT NULL,
    platformproductid integer NOT NULL,
    totalquantitysold numeric
);


ALTER TABLE amazon.dsrdump OWNER TO postgres;

--
-- Name: productmaster; Type: TABLE; Schema: amazon; Owner: postgres
--

CREATE TABLE amazon.productmaster (
    id integer NOT NULL,
    platformcode character varying(50) NOT NULL,
    ipcode character varying(100)
);


ALTER TABLE amazon.productmaster OWNER TO postgres;

--
-- Name: productmaster_id_seq; Type: SEQUENCE; Schema: amazon; Owner: postgres
--

CREATE SEQUENCE amazon.productmaster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE amazon.productmaster_id_seq OWNER TO postgres;

--
-- Name: productmaster_id_seq; Type: SEQUENCE OWNED BY; Schema: amazon; Owner: postgres
--

ALTER SEQUENCE amazon.productmaster_id_seq OWNED BY amazon.productmaster.id;


--
-- Name: productoverview; Type: TABLE; Schema: amazon; Owner: postgres
--

CREATE TABLE amazon.productoverview (
    valuationdate date NOT NULL,
    platformcode character varying(50) NOT NULL,
    title character varying(255),
    price numeric(12,2),
    rating numeric(3,1),
    totalrating integer,
    totalreviews integer
);


ALTER TABLE amazon.productoverview OWNER TO postgres;

--
-- Name: reviewdump; Type: TABLE; Schema: amazon; Owner: postgres
--

CREATE TABLE amazon.reviewdump (
    reviewid character varying(100) NOT NULL,
    valuationdate date,
    platformcode character varying(50),
    reviewername character varying(255),
    rating numeric(3,1),
    review text,
    reviewdate date
);


ALTER TABLE amazon.reviewdump OWNER TO postgres;

--
-- Name: sentiment; Type: TABLE; Schema: amazon; Owner: postgres
--

CREATE TABLE amazon.sentiment (
    valuationdate date NOT NULL,
    platformproductcode character varying(50) NOT NULL,
    summary text,
    positivekeywords text,
    negativekeywords text,
    mixedkeywords text
);


ALTER TABLE amazon.sentiment OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: bsc; Owner: postgres
--

CREATE TABLE bsc.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE bsc.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: bsc; Owner: postgres
--

CREATE SEQUENCE bsc.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bsc.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: bsc; Owner: postgres
--

ALTER SEQUENCE bsc.categories_id_seq OWNED BY bsc.categories.id;


--
-- Name: productmaster; Type: TABLE; Schema: bsc; Owner: postgres
--

CREATE TABLE bsc.productmaster (
    ipcode character varying(100) NOT NULL,
    whsku character varying(255),
    categoryid integer
);


ALTER TABLE bsc.productmaster OWNER TO postgres;

--
-- Name: productmaster id; Type: DEFAULT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.productmaster ALTER COLUMN id SET DEFAULT nextval('amazon.productmaster_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: bsc; Owner: postgres
--

ALTER TABLE ONLY bsc.categories ALTER COLUMN id SET DEFAULT nextval('bsc.categories_id_seq'::regclass);


--
-- Data for Name: categorysentiment; Type: TABLE DATA; Schema: amazon; Owner: postgres
--

COPY amazon.categorysentiment (valuationdate, category, categorysummary, positivekeywords, negativekeywords, mixedkeywords, avgprice, avgrating) FROM stdin;
2026-11-16	Trimmers	Overall, customer sentiment across the reviewed trimmers and grooming devices is largely positive, driven by strong appreciation for ergonomic designs, value for money, versatile attachments, smooth cutting performance, and convenient battery life and charging features. However, users frequently encounter consistent drawbacks, particularly concerning blade heating during extended use, slippery grips, variable cutting precision on dense or harsh hair, and occasional concerns regarding long-term durability and battery performance.	value for money, ergonomic design, battery life, versatile attachments, smooth cutting performance	blade heating, slippery grip, cutting precision, durability concerns, hair pulling	charging time, blade sharpness, battery performance, skin sensitivity, attachment quality	1435.43	3.90
\.


--
-- Data for Name: competitors; Type: TABLE DATA; Schema: amazon; Owner: postgres
--

COPY amazon.competitors (valuationdate, asin, compasin, compsku, category, comprating, compbrand, volume, sku) FROM stdin;
\.


--
-- Data for Name: dsrdump; Type: TABLE DATA; Schema: amazon; Owner: postgres
--

COPY amazon.dsrdump (valuationdate, platformproductid, totalquantitysold) FROM stdin;
\.


--
-- Data for Name: productmaster; Type: TABLE DATA; Schema: amazon; Owner: postgres
--

COPY amazon.productmaster (id, platformcode, ipcode) FROM stdin;
1	B0D2HFN2N1	BSC-001
2	B098P8NRRW	BSC-002
3	B0D91S9NF1	BSC-003
4	B0D96CPM1B	BSC-004
5	B0CKLP826Z	BSC-005
6	B0CHSCR7B7	BSC-006
7	B0CGNHGXXH	BSC-007
\.


--
-- Data for Name: productoverview; Type: TABLE DATA; Schema: amazon; Owner: postgres
--

COPY amazon.productoverview (valuationdate, platformcode, title, price, rating, totalrating, totalreviews) FROM stdin;
2026-11-16	B0D2HFN2N1	Bombay Shaving Company Power Play NXT Trimmer for Men | Beard Trimmer for Man | Hair Trimmer for Man | Type C, 90 Min, 6 Combs, Self-Sharpening | Trimmer Men Beard | Trimmers for Man : Amazon.in: Beauty	649.00	4.1	6310	-1
2026-11-16	B098P8NRRW	Bombay Shaving Company Beard Trimmer For Men | Beard Trimmer for Man | Hair Trimmer for Man | Type C, 120 Min Runtime, 38 Settings, Cordless | Trimmer Men Beard | Trimmers for Man : Amazon.in: Health & Personal Care	627.00	4.0	12122	-1
2026-11-16	B0D91S9NF1	Bombay Shaving Company Balls Trimmer | Pubic Hair Trimmer and Body Groomer for Men | Private Part Trimmer Men | Waterproof (IPX6)| BALLER (New Model) : Amazon.in: Health & Personal Care	1398.00	4.0	805	-1
2026-11-16	B0D96CPM1B	Bombay Shaving Company 11 in 1 | Trimmer for Men All in One | Beard Trimmer for Man | Hair Trimmer for Man | Nose Trimmer for Man | Body Trimmer for Man | Type C | Trimmer Men Beard | Trimmers for Man : Amazon.in: Health & Personal Care	999.00	3.9	3483	-1
2026-11-16	B0CKLP826Z	Bombay Shaving Company Premium Multi Grooming Trimmer for Men | Body and Beard Trimmer for Man | Multi Styling Rotary Comb, IPX6 Waterproof, 90 Min Run Time, 2 Hrs Charge Time | 1 PC : Amazon.in: Health & Personal Care	1398.00	3.7	506	-1
2026-11-16	B0CHSCR7B7	Bombay Shaving Company 11-in-1 All-in-One Grooming Kit for Men	2498.00	4.0	407	-1
2026-11-16	B0CGNHGXXH	Bombay Shaving Company Head Shaver Pro	2479.00	3.6	431	-1
\.


--
-- Data for Name: reviewdump; Type: TABLE DATA; Schema: amazon; Owner: postgres
--

COPY amazon.reviewdump (reviewid, valuationdate, platformcode, reviewername, rating, review, reviewdate) FROM stdin;
R2JUSZ5Z2K2BX	2026-11-16	B098P8NRRW	Himanshu	5.0	Satisying product and battery life is good too.	2026-10-30
R2TR0M1TDEQ783	2026-11-16	B098P8NRRW	Salmanul Faris	4.0	Heat problem with trimmer blade while using within few minutes	2026-08-30
R5AU60GYHVZ7E	2026-11-16	B098P8NRRW	S. Gowsikpraveen S. Gowsikpraveen	5.0	Super product only a small thing the only damage but the product safely delivered	2026-10-30
RE2260GZIAZ6I	2026-11-16	B098P8NRRW	Ankit	3.0	Not actually a good product. If you want clean shave then this will not be helpful. Battery backup is good. Body is also plastic.	2026-10-15
RJR5QAMQQDQN2	2026-11-16	B098P8NRRW	Ansh Gala	5.0	2 years and still using.	2026-11-05
R2QZPYCG21B2UN	2026-11-16	B098P8NRRW	Biswojeet Rout	4.0	It works very well, just the issue is it don't properly works like a professional trimmer in which you can cut hairs in the length you want.It is good for beginners, it heats up when using more than 10 minutes around	2026-11-04
R23WR5SKUM26UK	2026-11-16	B0D91S9NF1	sachin pal	5.0	Comfortable and Best Product	2026-10-24
R2WP284DK0I5M4	2026-11-16	B0D91S9NF1	Sujal Pathak	4.0	It's a good product.The ceramic blade is quite good as it does not tug or pull hair and also does not nick or cut if you are careful with it.Under this price it's a nice product so I can say it's value for money.The trimmer gets slightly heated when used for a long session but it does not interfere with the trimming session.Overall it's a good product so I am giving it 4 star as of now.I'll think about giving it 5 star if it still function well even after 2 months.	2026-01-02
R18450H87BU02D	2026-11-16	B0D91S9NF1	Mahesh Kumar	1.0	Product stopped working in Aug 2026. Now I am not able to reach amazon or Bombay Shaving company.The parent site of Bombay Saving wants my mobile number and email id first before even giving me an e mail I can write to or a phone number I can use to reach out. The core approach and coulture seems catch new customers and don't care for existing ones.	2026-09-30
R2KAP0Y1ZXANO0	2026-11-16	B0D91S9NF1	Shubham Singh	5.0	Extremely good product. This trimmer is a gamechanger. The ceramic blades are super gentle, ensuring a smooth, irritation-free trim. It’s compact, easy to use, and the battery lasts long. Perfect for sensitive areas and get rid of  nicks or cuts. The design feels premium, and it's waterproof. It is a safe, efficient, and reliable grooming tool, this is definitely worth it.	2025-03-17
R2V7YAHBS8ULQQ	2026-11-16	B0D91S9NF1	Ravi Pushkarna	5.0	Good products	2026-08-24
R20JISNGDKHM8G	2026-11-16	B0D96CPM1B	Srinivas	5.0	Trimmer looks premium with quality and it is really good and lasts longer life. The blades are sharp, comfortable for the regular use, instead of wasting money for expensive saloons. Battery backup is also very good and impressive. Easy to use, lightweight. Overall, a good product at this price with multiple grooming attachments, including nose and ear trimmer. The trimmer is easy to use, works smoothly. Safe to use.	2026-09-28
RVO87KD8OJWY2	2026-11-16	B0D96CPM1B	Sandesh	4.0	Haven't used it much as of now but it is good as of current use. Charging is quick. However trimming could be better. Doesn't seem that sharp sometimes when the beard is dense or while need to trim very short beard as well.	2026-09-09
RTFCI4NU9VNNA	2026-11-16	B0D96CPM1B	Sandy M	5.0	It's a very good trimmer with multiple usages such as nose trimming, body hair trimming, and beard trimming of course. The overall operation is smooth enough and is comfortable to work with. The body is made out of plastic which doesn't feel very premium. It charges slowly but the battery backup is really good. The blade heats up kind of faster than other trimmers, which makes it slightly uncomfortable to use for more than 2 minutes. Overall a good produc	2026-10-19
R1BYQLELVVQ24M	2026-11-16	B0CKLP826Z	pronoy upadhyai	5.0	excellent product, excellent finish, excellent operatibilty	2026-09-24
R2TANM5HXBM5ZS	2026-11-16	B0CKLP826Z	Ashraf kamal	4.0	The trimmer feels well-made and sturdy, with a comfortable design that makes it easy to use. The attachments are useful for different grooming needs, and the overall performance has been reliable. For the price, the quality feels quite good and suitable for regular use.	2026-08-19
R2M07216B531XU	2026-11-16	B0CKLP826Z	Ashwajeet Sonwane	5.0	The trimmer feels premium, cuts smoothly, and offers multiple attachments that actually work well. The battery backup is impressive, and the digital display makes it easy to track usage. Lightweight, low noise, and perfect for beard detailing and full grooming. Great value for money.	2025-12-08
R1SW74LUN6EJXT	2026-11-16	B0CKLP826Z	Anjan Deb	5.0	Ekdam mast he.  Kitna mahina ho gaya charge hi nahi kiya. Long lasting	2026-10-11
R23M6HZ48O2YIA	2026-11-16	B0CHSCR7B7	Ajay kumar Garg	5.0	thanks to Amazon for delivering this product in just 2.5 hours really impressed with the super-fast delivery.The BSC 11-in-1 Trimmer is a great product for everyday grooming.It comes with multiple attachments, making it easy to use for different grooming needs.The build quality feels premium, and the trimmer works really well. The battery life is also quite good and lasts a long time and consist a bag for store all times easy to carry.Overall I am very happy with this purchase. Great quality, useful attachments, and excellent value for money. Definitely recommended.	2026-10-21
RVAK8XYN9BIT9	2026-11-16	B0CHSCR7B7	RS	4.0	Good quality trimmer with a nice design and comfortable grip. Works smoothly and is easy to use. Trimming is quick and convenient, and the battery backup is also decent. Easy to clean and maintain. Overall, a useful product for regular grooming and good value for money.	2026-11-02
R3A2ZIHUE4MLCB	2026-11-16	B0CGNHGXXH	Sanjay	5.0	This is a great product for bald guys to clean shave their head. I have also used skull head shaver which is quite famous but I find even this one very good. Also it's very easy to clean by just detaching the cover which is attached by a magnet. I don't know how long the blades will last but it's great to know it's an Indian product and it's performance is as good as any imported head shaver. Happy shaving!!	2026-08-18
R81DFFMTERJ1S	2026-11-16	B0CGNHGXXH	Amazon Customer	1.0	The Company says that Head Shaver Pro runs for 90 Min after a 120 Min Charge time, but my product not run for even 10 minutes. I can't login to company's website for warranty registration. What is the solution for complaint registration in company's website?	2026-10-25
R30LHGOUAEHBIH	2026-11-16	B0D2HFN2N1	Irshad Alam	5.0	Everything is good, price, smoothness, practically, battery etc. Material is also fine but not that good 👍Grip is perfect, safe, attachments are usefulLight weight	2026-09-19
R13ZDZLA56PFJ1	2026-11-16	B0D2HFN2N1	shailesh	4.0	Good product but, not zero hair cleaning need improvement	2026-10-03
R6TBWGY214D1U	2026-11-16	B0D2HFN2N1	VK The Great	5.0	I recently bought the Power Play Next Trimmer from Bombay Shaving Company and have been using it for a few weeks now. This is my experience so far.Design and Build Quality: ★★★★☆The  Play Next Trimmer from Bombay Shaving Company has a sleek, modern design with an ergonomic handle that fits well in your hand. The build quality feels solid, built from high-quality materials that will last. It’s lightweight making it easy to manoeuvre but doesn’t feel like it might fall apart at any minute.Performance: ★★★★★This trimmer performs impressively. It features multiple length settings, which means you can precisely trim or shape your beard. Motor is powerful yet quiet ensuring a smooth even shave without pulling or tugging on the skin. Blades are sharp enough to stay effective offering precise cutting each time.Battery Life: ★★★★★Another excellent feature of this trimmer is its battery life. A single charge gives you about 90 minutes of continuous usage, perfect for many shaves at once. The charger also operates fast giving full charge within one hour. This has a C-Type charging port which gives me flexibility to charge from any available charger in my house. No worry / stress of carrying charging lead.Ease of Use: ★★★★★The Play Next Trimmer from Bombay Shaving Company is as easy to use as can be. Its adjustable combs are simple to remove and attach while it’s also easy to clean the trimmer. This means that if you’re in a hurry, you can just rinse it under running tap water without any problems occurring. Also, the directions provided are very helpful even though someone who is starting out will have no issues with them.Value for Money: ★★★★★Play Next Trimmer from Bombay Shaving Company has incredible value for money based on its performance, features, and construction quality. It can be bought at competitive prices but still offers better grooming results than some other expensive models.It has a colour full comb which is easily identical basis size and color code is printed on the back of the trimmer.Conclusion:First time i moved to any other brand trimmer ( other than Philips ) and i am just loving it. In general there isn’t much that I would change about this Play Next Trimmer from Bombay Shaving Company. My requirements for my beard trimmer are all met by it because it is dependable, effective while being versatile in nature. Regardless of whether someone needs to keep their stubble or shave off everything, they will find this tool useful enough. If you need an excellent beard trimmer at affordable price then look no further; I would strongly recommend this piece of equipment for you!	2024-06-07
RONOBVSZA903G	2026-11-16	B0D2HFN2N1	Pawan	5.0	I am happy with this trimmer. It looks good, is easy to use, and gives a smooth trimming experience. The grip is comfortable and the trimmer works well for regular grooming. Battery backup is also good. Overall, a useful product for daily use and worth the price.	2026-09-10
RZKV5CRJCHD7Y	2026-11-16	B0D2HFN2N1	Aashu	4.0	The product is good for the collge student who is currently passed out from class 12 because our hair are gentle and skin too so it's ulta smooth to use and it clears the beard so gently and also in budget bro !!But one disadvantage of it is don't cut harsh hair	2026-10-30
RWFNBP5CPRHCW	2026-11-16	B0D2HFN2N1	Chirag Vadhwani	3.0	It does not have a grip and can damage by slipping through hands although it has full plastic body and I expected a metal blade case which is detachable ,although it has good attachment and a battery back up but it does not met my expectations.	2026-08-27
R3N68LBN1YZE6D	2026-11-16	B0D2HFN2N1	KING	5.0	Preety good no complaints build quality is solid also very easy to clean and maintain best for younger people it also 2 year warranty that you can activate it comes inside the box .	2026-10-18
RCGORRY9Z3CF8	2026-11-16	B0D2HFN2N1	Paulami Paul	4.0	I used it to times, battery is good. I don't like the tips it lefts small hair even after using 3 or 4 Times in one spot. I think the blade is not that sharp.	2026-09-30
R3R143H7HAUOUX	2026-11-16	B098P8NRRW	Nandhakumar	5.0	Very good product worth for money	2026-11-10
R16RFOC43273ZX	2026-11-16	B098P8NRRW	Jerry Mathew	4.0	It's a good product, do feel like value for money, no irritations, type c charging is really easy to use and of great versatile. But I don't think it cuts great. With the attachments, previous I had used philips trimmer that's around same budget, that's cute neatly everybit , it cuts but felt ists different in different areas of leaving behind a bunch here and there. It feels like a matter with the design but not with the sharpness of the trimmer blade itself	2026-11-02
R2WF76YPM5N4VT	2026-11-16	B098P8NRRW	Bora Özkut	5.0	Good for the money,Type c change, multiple size shaving options,Bought for 79 UAE , good for the price	2026-11-16
RFD70A07C1Z7P	2026-11-16	B098P8NRRW	Eli Fields	5.0	Best beard trimmer I have ever owned, and I have owned plenty	2026-11-16
R1TN4HVRMXHZFV	2026-11-16	B098P8NRRW	VR	4.0	One of the best trimers I have tried in a long time! Very pleased.	2026-11-16
R2LDSDZTEVYZ2V	2026-11-16	B098P8NRRW	Arshad	2.0	Gd	2026-11-16
R1UP7GKQ2U2UQC	2026-11-16	B098P8NRRW	AD	5.0	My husband spent quite a few hours evaluating different razors, and he finally settled on this one due to the price. He is so impressed with it and he loves that it’s a family company!	2026-11-16
R9EPSCIFQBTWH	2026-11-16	B0D91S9NF1	I recently purchased the Bombay Shaving Company Baller Pubic Hair Trimmer, and I must say, it's an absolute game-changer! From the moment I opened the box, I was impressed by the sleek design and high-quality build. The trimmer fits comfortably in my hand	5.0	I recently purchased the Bombay Shaving Company Baller Pubic Hair Trimmer, and I must say, it's an absolute game-changer! From the moment I opened the box, I was impressed by the sleek design and high-quality build. The trimmer fits comfortably in my hand, and the ergonomic grip makes it easy to maneuver, even in delicate areas.What really stands out is the precision and power of the blades. It glides smoothly, providing a close trim without any irritation or discomfort. The ceramic blades ensure a safe, nick-free experience, and the trimmer is waterproof, making it incredibly convenient for use in the shower.Another highlight is the long-lasting battery life. I’ve used it multiple times without needing to recharge, which is fantastic for travel or regular use. The included grooming attachments also add versatility, allowing for customizable trimming lengths.Overall, the Baller Trimmer has exceeded my expectations. It’s effective, comfortable, and easy to maintain. I highly recommend it to anyone looking for a top-quality trimmer that delivers on both performance and comfort!	2024-11-21
R91SQSLBR7XU0	2026-11-16	B0D91S9NF1	Hadi	3.0	one of the blades is plastic so it does what it says, protect. you still got to be careful or you will get some minor scratches. not good if you plan to use to for multi purpose, does not come with size or speed adjustment. there is only one size adjustment and that slips into zero setting as there is no proper locking. buy it exclusively for your special areas.	2025-05-05
RC8N586NLGDMW	2026-11-16	B0D91S9NF1	M R.	4.0	Good product and reasonably priced. But it's problem is that it's on/off switch is highly sensitive. On simple touch, it gets on. This is really a drawback. Theswitch should be at the rear end.Since its body is very smooth, it slips from hand. If an holder (like torch holder) could be attached with it, that will help from falling.	2025-12-10
R12VYQJY8L3X0W	2026-11-16	B0D96CPM1B	Satyam Tyagi	3.0	It's fine, not really the best out there but gets the job done. Don't try to use it in intimate areas.	2026-10-05
R11Y2WCU00AZPS	2026-11-16	B0D96CPM1B	S K Jhanwar	5.0	The trimmer comes with multiple attachments catered to different purposes. The trimmer charges fast and has a good run time. It has a great build quality and the price is also justified with fine and precision hair trimming.	2026-10-25
R2A23L6I3A55AD	2026-11-16	B0D96CPM1B	Sandeep	5.0	Very good trimmer. Premium built quality. It trims very well and smootly. It comes with multi purpose attachments. It also has attachment for intimate area. Very good grip ad it charges fast. Totally worth the money.	2026-10-11
R1VC2CFWXC0O1L	2026-11-16	B0D96CPM1B	Gaurang Yadav	4.0	Good, easy to use, easily grip, very comfortable and good vibrations	2026-10-25
R3FQGRTUM6WU34	2026-11-16	B0D96CPM1B	Ss	3.0	received trimmer is good but charging problem	2026-10-18
R3VA1QQW6JGD8H	2026-11-16	B0CKLP826Z	Overheating alot	1.0	I am writing to address a few issues with the product I purchased on August 22 of last year.Firstly, the timer is really slow and it does not cut off as expected.Additionally, the product overheats after just 15 minutes of use. It becomes so hot that I cannot touch it, which is quite concerning. I have tried changing the charger.Moreover, during a conversation at a store with a representative from the Bombay Shaving Company, I was informed that I received the wrong product. I had ordered a charger with a Type-C connection, but I received a charger with a Phillips connection instead.I kindly request that you rectify these issues as soon as possible.Thank you for your assistance.	2025-02-04
R1K5Z3BSBQNOOM	2026-11-16	B0CKLP826Z	Amal Hussain h	3.0	The main product is good but.The attachment is poor quality and does not work as intended to do . And the attachment are off poor quality it easily break in the fixing area (cheap plastic).But the device works grate and battery life is good and the display is useful.and it have c type change it's like heaven 👍	2025-10-14
R2B0W74NKQKOOR	2026-11-16	B0CKLP826Z	jaison mathew john	2.0	I bought this item around a month or two ago. I'd like to complement the product's appearance and finish. However, in terms of utilisation, I question the hoopla. I've had several instances where the blade of my trimmer got trapped in my beard and hurt, which is not ideal. It is not worth the price in terms of performance.	2025-10-10
R2WWDT9KFEF5SW	2026-11-16	B0CKLP826Z	Tushar	4.0	Nice and easy	2026-11-01
R3SLRLXWLLYV5F	2026-11-16	B0CHSCR7B7	Amazon Customer	5.0	The Bombay Shaving Company 11-in-1 trimmer is a good option for everyday grooming. I like that it comes with multiple attachments for beard trimming, hair trimming, and body grooming, so there is no need to buy separate devices. The cordless design makes it easy to use, and Type-C charging is a convenient feature. The 90-minute battery backup is also useful for regular grooming. Overall, it offers good versatility and convenience for the price. A practical grooming kit for men to use at home.	2026-10-26
R11TWQYEAX92DF	2026-11-16	B0CHSCR7B7	Arunkumar A	1.0	It looks premium but doesn’t work as expected and there is 2 type of trimming blade and I couldn’t make the shape in my beard and nose hair trimming doesn’t work and none of the hair removed, very worst product. I don’t recommend to buy it.	2026-11-04
R22CCKM4W3GVPP	2026-11-16	B0CHSCR7B7	yash	5.0	I’m really happy with this purchase. The Bombay Shaving Company grooming kit has a premium look and feels comfortable to hold and use. The build quality is impressive, and the multiple attachments make it useful for different grooming needs. The trimmer works smoothly and gives a neat, precise finish. I also like the overall design, stylish appearance, and the variety of attachments provided. Overall, a great grooming kit with good looks, useful features, and a premium feel.	2026-10-30
R2IK90SLI0LYZN	2026-11-16	B0CHSCR7B7	Monu Kumar	5.0	The Bombay Shaving Company 11-in-1 Full Body Trimmer is an exceptional grooming tool that delivers impressive versatility and convenience.* Versatile Performance: The 11-in-1 design with easy-switch magnetic heads makes transitioning between attachments effortless for all-around grooming.* Convenient Features: Features like the clear LED battery display and modern Type-C charging keep maintenance simple and user-friendly.* Great Battery Life: Offering up to 90 minutes of non-stop runtime, it provides plenty of power for multiple grooming sessions on a single charge.	2026-10-29
R1V6HW7K43GEP	2026-11-16	B0CHSCR7B7	Parth	3.0	The big black adjustable blade is useless. It just doesn't cut hair properly.The only adjustable length accessory that works is the small black one that doesn't have dials on it.The nose and ear accessory kind of works.The long comb-like blade is very good and gentle.The machine itself is giving battery problems already. So soon, all these accessories will become useless without a battery that holds power.	2026-10-08
R3MZ0Q2U9Y82N7	2026-11-16	B0CHSCR7B7	paresh vyas	5.0	This trimmer is super versatile and handles beard, body, and hair styling with ease.The blades are sharp for a smooth cut, while the slick appearance and quality feel solid in hand.With excellent battery life, fast Type C charging, and quick shaving time, it easily handles full grooming.	2026-10-30
R1U1M9OW4KSG9I	2026-11-16	B0CHSCR7B7	El Amazono	3.0	No me gustóTiene muchos recovecos y de material y hechura no se siente sólida.	2026-11-16
R27DOKSH0F7YTU	2026-11-16	B0CHSCR7B7	Stephan M.	5.0	This is the best beer shaver I’ve ever bought. I’ve used it for a few days and it works great. Does it leave any strangler behind?	2026-11-16
REZTU49BIGM34	2026-11-16	B0CGNHGXXH	I recently purchased the Bombay Shaving Company Baller Pubic Hair Trimmer, and I must say, it's an absolute game-changer! From the moment I opened the box, I was impressed by the sleek design and high-quality build. The trimmer fits comfortably in my hand	5.0	I recently purchased the Bombay Shaving Company Headshaver Pro Trimmer, and I’m honestly blown away by how great it is. First off, the design is incredibly comfortable to hold and easy to maneuver around the scalp. It’s lightweight, yet powerful, and makes shaving my head a smooth and hassle-free process.The trimmer delivers a super close shave with no tugging or discomfort, and the blades are sharp enough to cut through thick hair with ease. What I really appreciate is how gentle it is on the skin, leaving no irritation behind. Plus, the waterproof feature makes it perfect for shaving in the shower, and cleaning it afterward is a breeze.The battery life is impressive, too—I can get several uses out of a single charge, which is always a plus. Overall, the Headshaver Pro is a top-quality product that makes head shaving simple, quick, and effective. If you’re looking for a reliable head trimmer, I highly recommend this one!	2024-11-21
R2RNEXLHUVLNQP	2026-11-16	B0CGNHGXXH	Manish	4.0	Update after 9 months of use - usage frequency is 2-3 times a week and is working fine so far. But the blades are not as effective now as I have to run over an area multiple times for a closer shave. But overall doing what is expected.First time use review...Really impressed with the shave quality..close head shave, no rashes and that too within minutes. Motor is powerful and build quality is good. Only negative thing that I found is that the plastic panel in which blades are embedded doesn’t seems to be of durable quality, one have to be careful handling the blades. But the final shave result is way above my expectation almost same as a razor shave. Rest depends upon the blade quality and how long they are gonna last. Will update back after a few months of use.	2023-12-25
RJTYTQFTLMIS2	2026-11-16	B0CGNHGXXH	Vineeta Singh	5.0	Bought this Head Shaver Pro recently and it’s turning out to be quite handy. The 5-blade system gives a smooth and quick shave, and the run time is good for regular use. The charging indicator and waterproof feature make it easy to use and maintain. Grip is comfortable and the shave is even across the head. Overall, a useful product if you prefer clean head shaves at home.	2025-12-05
R17HYJGFGFH83R	2026-11-16	B0CGNHGXXH	Amazon Customer	3.0	Used this product today for the first time. It's good, easy to handle and smooth.On the con side is the battery. It takes time to shave and the battery drained completely on my first shave itself. I don't know if this is issue with this specific product or it is with all.Had the battery been strong it would have been a good travel companion.	2024-06-19
RN7YKT82Q2IOI	2026-11-16	B0CGNHGXXH	shyamanta s.	2.0	Product worked well for 3 week and I was really happy with the ease, comfort and precision. After 3-4 weeks since I purchased, it stopped working. I had seen one of the video where CEO of Bombay Shaving Co. says that the warranty claim process would be simple and hassle free. It was exactly opposite.When I reached out, first, they asked me to upload a video of the product that i had bought. After i had done that, it needed a few follow-ups after which they told me that they will initiate the pick-up. They would not replace the product till their QA team verifies that their is indeed a problem in the one that i purchased. After the pick-up and after follow-ups, I got a call from them that left such a bad taste. First the customer care representative told me that since product looks fine and motor is also working, so they feel I'm using the product way too early before the hair grows. I told her that I trim every 3 days, and I have been using other such products for more than a decade. Thanks to my hairstyle. Then she insisted that as their QA team feels product is perfect, it will be returned back as it is. Then I asked her if she or anyone actually tried the product in their own scalp to see if it's working or not. She said no one tried. I was so shocked that they not only kept questioning time after time if my claim was real (first video recording and then product testing by QA) but also were trying to convince me that im wrong.Warranty claim process will make you so frustrated that you will question such a nice brand they had build in last few years. It's been almost month since I initiated the warranty claim. I had to buy another shaver in the mean while.	2024-04-18
R2ONIM1HFB7VE5	2026-11-16	B0CGNHGXXH	Kailash Jakhar	5.0	Superb one. Good grip and clean shaveThis shaver is a serious upgrade. It delivers a smooth, close shave in minutes and works great both wet and dry. The design fits comfortably in hand, and the USB charging makes it super convenient for travel. Battery life is solid, and the blades are sharp and durable. Highly recommend if you’re looking for performance and quality in one sleek package	2025-07-24
\.


--
-- Data for Name: sentiment; Type: TABLE DATA; Schema: amazon; Owner: postgres
--

COPY amazon.sentiment (valuationdate, platformproductcode, summary, positivekeywords, negativekeywords, mixedkeywords) FROM stdin;
2026-11-16	B098P8NRRW	Overall, customers have mixed feelings about the trimmer. While the majority praise its affordability, excellent battery life, Type-C charging convenience, and value for money, several users express dissatisfaction regarding its cutting precision, inconsistent shave quality, and a tendency for the blade to heat up during extended use.	battery, price, value, charging, durability	heating, cutting, shave, design, plastic	attachments, size, performance, brand, versatility
2026-11-16	B0CGNHGXXH	The Bombay Shaving Company Headshaver Pro receives mixed reviews, with many users praising its ergonomic design, close and comfortable shave, and convenient wet/dry usage, while others report significant issues regarding battery performance, blade durability over time, and a frustrating warranty claim process.	Smooth shave, Ergonomic design, Easy cleaning, Waterproof feature, Powerful motor	Battery draining, Warranty issues, Customer service, Blade durability, Charging failure	Battery life, Shaving time, Build quality, Blade sharpness, Brand reputation
2026-11-16	B0CHSCR7B7	Customer reviews for the Bombay Shaving Company 11-in-1 Trimmer are generally favorable, highlighting its fast delivery, premium design, versatile attachments, and good battery life. However, some users reported issues with specific blades, shaping precision, nose hair trimming, and early battery durability.	delivery, attachments, battery, design, value	shaping, nose-hair, durability, materials, stragglers	blades, performance, build-quality, versatility, charging
2026-11-16	B0CKLP826Z	The product receives a mix of highly enthusiastic praise for its build quality, battery life, and smooth cutting performance, alongside serious complaints regarding overheating, fragile attachments, painful hair pulling, and incorrect charging accessories.	battery life, finish, design, lightweight, display	overheating, slow timer, wrong charger, painful pulling, broken attachments	attachments, performance, price, quality, blades
2026-11-16	B0D2HFN2N1	The Bombay Shaving Company Power Play Next Trimmer is generally well-received by users for its lightweight design, ergonomic handling, smooth trimming performance, fast charging, and excellent value for money. While most customers appreciate its usefulness for daily grooming and gentle skin care, some users have reported drawbacks regarding hair cleaning efficiency, blade sharpness on harsh hair, and slippery plastic grip issues.	Battery, Price, Smoothness, Attachments, Lightweight	Hair-cleaning, Blade-sharpness, Slipping, Harsh-hair, Expectations	Grip, Build-quality, Materials, Cleaning, Design
2026-11-16	B0D91S9NF1	Overall, customer reception of the product is largely positive, with users praising its gentle ceramic blades, ergonomic design, and value for money, though some note drawbacks regarding durability concerns, sensitive switches, and slippery grips.	Ceramic blades, Comfortable, Waterproof, Battery life, Value for money	Poor durability, Slippery body, Sensitive switch, Poor customer support, Lack of speed adjustment	Trimming precision, Guard locking, Size adjustment, Heat generation, Versatility
2026-11-16	B0D96CPM1B	The trimmer receives generally positive feedback for its versatility, multiple attachments, ease of use, and battery life, though some users note minor drawbacks regarding charging time, blade heating, and performance on dense beards.	versatile, lightweight, affordable, smooth, comfortable	unsharp, flimsy, slow-charging, hot-blades, non-intimate	battery-backup, multiple-attachments, build-quality, cutting-performance, charging-speed
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: bsc; Owner: postgres
--

COPY bsc.categories (id, name) FROM stdin;
1	Trimmers
\.


--
-- Data for Name: productmaster; Type: TABLE DATA; Schema: bsc; Owner: postgres
--

COPY bsc.productmaster (ipcode, whsku, categoryid) FROM stdin;
BSC-001	Power Play NXT Trimmer	1
BSC-002	Beard Trimmer 120 Min	1
BSC-003	Baller Body Groomer	1
BSC-004	11-in-1 Trimmer	1
BSC-005	Premium Multi Grooming Trimmer	1
BSC-006	11-in-1 Grooming Kit	1
BSC-007	Head Shaver Pro	1
\.


--
-- Name: productmaster_id_seq; Type: SEQUENCE SET; Schema: amazon; Owner: postgres
--

SELECT pg_catalog.setval('amazon.productmaster_id_seq', 7, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: bsc; Owner: postgres
--

SELECT pg_catalog.setval('bsc.categories_id_seq', 1, true);


--
-- Name: categorysentiment categorysentiment_pkey; Type: CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.categorysentiment
    ADD CONSTRAINT categorysentiment_pkey PRIMARY KEY (valuationdate, category);


--
-- Name: competitors competitors_pkey; Type: CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.competitors
    ADD CONSTRAINT competitors_pkey PRIMARY KEY (valuationdate, asin, compasin);


--
-- Name: dsrdump dsrdump_pkey; Type: CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.dsrdump
    ADD CONSTRAINT dsrdump_pkey PRIMARY KEY (valuationdate, platformproductid);


--
-- Name: productmaster productmaster_pkey; Type: CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.productmaster
    ADD CONSTRAINT productmaster_pkey PRIMARY KEY (id);


--
-- Name: productmaster productmaster_platformcode_key; Type: CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.productmaster
    ADD CONSTRAINT productmaster_platformcode_key UNIQUE (platformcode);


--
-- Name: productoverview productoverview_pkey; Type: CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.productoverview
    ADD CONSTRAINT productoverview_pkey PRIMARY KEY (valuationdate, platformcode);


--
-- Name: reviewdump reviewdump_pkey; Type: CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.reviewdump
    ADD CONSTRAINT reviewdump_pkey PRIMARY KEY (reviewid);


--
-- Name: sentiment sentiment_pkey; Type: CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.sentiment
    ADD CONSTRAINT sentiment_pkey PRIMARY KEY (valuationdate, platformproductcode);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: bsc; Owner: postgres
--

ALTER TABLE ONLY bsc.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: bsc; Owner: postgres
--

ALTER TABLE ONLY bsc.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: productmaster productmaster_pkey; Type: CONSTRAINT; Schema: bsc; Owner: postgres
--

ALTER TABLE ONLY bsc.productmaster
    ADD CONSTRAINT productmaster_pkey PRIMARY KEY (ipcode);


--
-- Name: dsrdump dsrdump_platformproductid_fkey; Type: FK CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.dsrdump
    ADD CONSTRAINT dsrdump_platformproductid_fkey FOREIGN KEY (platformproductid) REFERENCES amazon.productmaster(id);


--
-- Name: productmaster productmaster_ipcode_fkey; Type: FK CONSTRAINT; Schema: amazon; Owner: postgres
--

ALTER TABLE ONLY amazon.productmaster
    ADD CONSTRAINT productmaster_ipcode_fkey FOREIGN KEY (ipcode) REFERENCES bsc.productmaster(ipcode);


--
-- Name: productmaster productmaster_categoryid_fkey; Type: FK CONSTRAINT; Schema: bsc; Owner: postgres
--

ALTER TABLE ONLY bsc.productmaster
    ADD CONSTRAINT productmaster_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES bsc.categories(id);


--
-- PostgreSQL database dump complete
--

\unrestrict bosBgP23LqDlF8mwSO2evz9DEOvlit1Kf1NC1LWiLtodYYP8mdcnk6SBaCoaBFP

