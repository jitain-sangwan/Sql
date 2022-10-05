CREATE TABLE date_date
(
    Date    date NOT NULL,
    Year    int,
    Quarter varchar(20),
    Month   varchar(20),
    primary key (Date)
);
CREATE TABLE city_region
(
    city_id uuid        NOT NULL,
    city    varchar(20) NOT NULL,
    state   varchar(20) NOT NULL,
    PRIMARY KEY (city_id)
);

CREATE TABLE topic_topic
(
    grade      varchar(20) NOT NULL,
    Topic_id   uuid        NOT NULL,
    topic_name varchar(20) NOT NULL,
    PRIMARY KEY (Topic_id)
);

CREATE TABLE student_student
(
    student_id   uuid        NOT NULL,
    teacher_id   uuid        NOT NULL,
    student_name varchar(20) NOT NULL,
    grade        varchar(20) NOT NULL,
    city_id      uuid        NOT NULL,
    PRIMARY KEY (student_id),
    CONSTRAINT fk_city_region
        FOREIGN KEY (city_id) REFERENCES city_region (city_id)
);

CREATE TABLE student_topic
(
    student_id      uuid   NOT NULL,
    topic_id        uuid   NOT NULL,
    test_cleared    bool   NOT NULL,
    percentage_mark bigint NOT NULL,
    test_date       date   NOT NULL,
    PRIMARY KEY (student_id),
    CONSTRAINT fk_student_student
        FOREIGN KEY (student_id)
            REFERENCES student_student (student_id)
            ON DELETE CASCADE,
    CONSTRAINT fk_topic_topic
        FOREIGN KEY (topic_id)
            REFERENCES topic_topic (topic_id)
            ON DELETE SET NULL
);
-- drop table  student_topic,date_date,city_region,topic_topic,student_student;

