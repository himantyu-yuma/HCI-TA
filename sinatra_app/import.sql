CREATE TABLE lab_members(
    id integer PRIMARY KEY,
    lab_id integer,
    member_name text,
    position text
);
CREATE TABLE labs(
    id integer PRIMARY KEY,
    lab_name text
);
.separator ,
.import lab_members.csv lab_members
.import labs.csv labs