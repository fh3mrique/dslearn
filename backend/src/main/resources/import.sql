INSERT INTO tb_user (name, email, password) VALUES ('Alex Brown', 'alex@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');
INSERT INTO tb_user (name, email, password) VALUES ('Maria Green', 'maria@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');
INSERT INTO tb_user (name, email, password) VALUES ('Bob Brown', 'bob@gmail.com', '$2a$10$eACCYoNOHEqXve8aIWT8Nu3PkMXWBaOxJ9aORUYzfMQCbVBIhZ8tG');

INSERT INTO tb_role (authority) VALUES ('ROLE_STUDENT');
INSERT INTO tb_role (authority) VALUES ('ROLE_INSTRUCTOR');
INSERT INTO tb_role (authority) VALUES ('ROLE_ADMIN');

INSERT INTO tb_user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (2, 2);
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 1);
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 2);
INSERT INTO tb_user_role (user_id, role_id) VALUES (3, 3);

INSERT INTO tb_course (name, img_Uri, img_Gray_Uri) VALUES ('Bootcamp HTML', 'https://d1jnx9ba8s6j9r.cloudfront.net/imgver.1551437392/img/co_img_1518_1631724053.png', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLVCxxU23q8IdXbL2u2WMIiTIVZyq7ma_kUJoznNdTr9KajHLFDkRcjFDftIV-f7VGWng&usqp=CAU')

INSERT INTO tb_offer (edition, start_Moment, end_Moment, course_id) VALUES (1.0, TIMESTAMP WITH TIME ZONE '2023-07-14T10:00:00Z', TIMESTAMP WITH TIME ZONE '2024-07-14T10:00:00Z', 1)
INSERT INTO tb_offer (edition, start_Moment, end_Moment, course_id) VALUES (2.0, TIMESTAMP WITH TIME ZONE '2023-09-14T10:00:00Z', TIMESTAMP WITH TIME ZONE '2024-09-14T10:00:00Z', 1)

INSERT INTO tb_resource(title, description, position, img_Uri, type, offer_id) VALUES ('Trilha HTML', 'Trilha princinpal do curso', 1,  'https://d1jnx9ba8s6j9r.cloudfront.net/imgver.1551437392/img/co_img_1518_1631724053.png', 1, 1)
INSERT INTO tb_resource(title, description, position, img_Uri, type, offer_id) VALUES ('Forum', 'Tire suas duvidas', 2,  'https://d1jnx9ba8s6j9r.cloudfront.net/imgver.1551437392/img/co_img_1518_1631724053.png', 2, 1)
INSERT INTO tb_resource(title, description, position, img_Uri, type, offer_id) VALUES ('Lives', 'Conteudo exclusivo', 3,  'https://d1jnx9ba8s6j9r.cloudfront.net/imgver.1551437392/img/co_img_1518_1631724053.png', 0, 1)