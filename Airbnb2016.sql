CREATE TABLE Calendar(
	listing_id int NOT NULL,
	date date NOT NULL,
	available bit NOT NULL,
	price float,
	CONSTRAINT pk_Calendar PRIMARY KEY (listing_id, date)
);

CREATE TABLE Listings(
	id int NOT NULL PRIMARY KEY,
	listing_url varchar(MAX) NOT NULL,
	name varchar(MAX),
	number_of_bedrooms int,
	description varchar(MAX),
	cancellation_policy varchar(MAX),
	review_scores_value float,
	reviews_per_month float,
	host_id int NOT NULL,
	host_name varchar(MAX)
);

CREATE TABLE Reviews(
	id int NOT NULL PRIMARY KEY,
	listing_id int NOT NULL,
	comments varchar(MAX)
);

CREATE TABLE Bookings(
	id int NOT NULL PRIMARY KEY,
	listing_id int NOT NULL,
	guest_name varchar(MAX) NOT NULL,
	stay_from date NOT NULL,
	stay_to date NOT NULL,
	number_of_guests int NOT NULL
);

ALTER TABLE Calendar
	ADD CONSTRAINT FK_Calendar_Listings
	FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE Reviews
	ADD CONSTRAINT FK_Reviews_Listings
	FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE Bookings
	ADD CONSTRAINT FK_Bookings_Listings
	FOREIGN KEY (listing_id) REFERENCES Listings(id);


bulk insert Listings
from 'U:\CMPT-354\listings.csv'
with
(
	rowterminator='\n',
	fieldterminator=','
);

bulk insert Reviews
from 'U:\CMPT-354\reviews.csv'
with
(
	rowterminator='\n',
	fieldterminator=','
);

bulk insert Calendar
from 'U:\CMPT-354\calendar.csv'
with
(
	rowterminator='\n',
	fieldterminator=','
);