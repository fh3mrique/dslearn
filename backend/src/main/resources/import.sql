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

INSERT INTO tb_section(title, description, position, img_Uri, resource_id, prerequisite_id) VALUES ('Capitulo 1', 'Primeiros passos no HTML', 1, 'https://d1jnx9ba8s6j9r.cloudfront.net/imgver.1551437392/img/co_img_1518_1631724053.png', 1, null)
INSERT INTO tb_section(title, description, position, img_Uri, resource_id, prerequisite_id) VALUES ('Capitulo 2', 'Nesse capitlo vamos continuar', 2, 'https://d1jnx9ba8s6j9r.cloudfront.net/imgver.1551437392/img/co_img_1518_1631724053.png', 1, 1)
INSERT INTO tb_section(title, description, position, img_Uri, resource_id, prerequisite_id) VALUES ('Capitulo 2', 'Nesse capitlo vamos finalizar', 3, 'https://d1jnx9ba8s6j9r.cloudfront.net/imgver.1551437392/img/co_img_1518_1631724053.png', 1, 2)

/*matriculando o usuario com id na oferta 1*/
INSERT INTO tb_enrollment(user_id, offer_id, enroll_Moment, refund_Moment, available, only_Update) VALUES(1, 1, TIMESTAMP WITH TIME ZONE '2023-07-14T10:00:00Z', null, true, false)
INSERT INTO tb_enrollment(user_id, offer_id, enroll_Moment, refund_Moment, available, only_Update) VALUES(2, 1, TIMESTAMP WITH TIME ZONE '2023-07-14T10:00:00Z', null, true, false)

                                      /*CADASTARNDO 3 AULAS DE CONTEUDO NA setion1 'capitulo 1*/
INSERT INTO tb_lesson(title, position, section_id) VALUES ('Aula 1 do capitulo 1', 1, 1);
INSERT INTO tb_content(id, text_Content, video_Uri) VALUES (1, 'Descrição da aula', 'Link da aula');

INSERT INTO tb_lesson(title, position, section_id) VALUES ('Aula 2 do capitulo 1', 2, 1);
INSERT INTO tb_content(id, text_Content, video_Uri) VALUES (2,  'Descrição da aula', 'Link da aula');

INSERT INTO tb_lesson(title, position, section_id) VALUES ('Aula 3 do capitulo 1', 3, 1);
INSERT INTO tb_content(id, text_Content, video_Uri) VALUES (3, 'Descrição da aula', 'Link da aula');

INSERT INTO tb_lesson(title, position, section_id) VALUES ('Tarefa capitulo 1', 4, 1);
INSERT INTO tb_task(id, description, question_Count, approval_Count, weight, due_Date) VALUES (4, 'descrição tarefa', 5, 3, 1.0, TIMESTAMP WITH TIME ZONE '2023-07-25T10:00:00Z');

/*O USÚARIO DESSA MATRICULA TERMINOU ESSA AULA tb_lesson_done*/
/*A aula 1e 2 foi terminada pelo usuario com name 'Alex Brown' na oferta 1 edition 1.0*/
INSERT INTO tb_lesson_done(lesson_id, user_id, offer_id) VALUES (1, 1, 1)
INSERT INTO tb_lesson_done(lesson_id, user_id, offer_id) VALUES (2, 1, 1)

INSERT INTO tb_notification (text, moment, read, route, user_id) VALUES ('Primeiro feedback de tarefa: favor revisar', TIMESTAMP WITH TIME ZONE '2020-12-10T13:00:00Z', true, '/offers/1/resource/1/sections/1', 1);
INSERT INTO tb_notification (text, moment, read, route, user_id) VALUES ('Segundo feedback: favor revisar', TIMESTAMP WITH TIME ZONE '2020-12-12T13:00:00Z', true, '/offers/1/resource/1/sections/1', 1);
INSERT INTO tb_notification (text, moment, read, route, user_id) VALUES ('Terceiro feedback: favor revisar', TIMESTAMP WITH TIME ZONE '2020-12-14T13:00:00Z', true, '/offers/1/resource/1/sections/1', 1);

INSERT INTO tb_deliver (uri, moment, status, feedback, correct_Cout, lesson_id,offer_id, user_id) VALUES ('https://github.com/devsuperior/bds-dslearn', TIMESTAMP WITH TIME ZONE '2020-12-10T10:00:00Z', 0, null, null, 4, 1, 1);


INSERT INTO tb_topic (title, body, moment, author_id, offer_id, lesson_id) VALUES ('Título do tópico 1', 'Corpo do tópico 1', TIMESTAMP WITH TIME ZONE '2020-12-12T13:00:00Z', 1, 1, 1);
INSERT INTO tb_topic (title, body, moment, author_id, offer_id, lesson_id) VALUES ('Título do tópico 2', 'Corpo do tópico 2', TIMESTAMP WITH TIME ZONE '2020-12-13T13:00:00Z', 2, 1, 1);
INSERT INTO tb_topic (title, body, moment, author_id, offer_id, lesson_id) VALUES ('Título do tópico 3', 'Corpo do tópico 3', TIMESTAMP WITH TIME ZONE '2020-12-14T13:00:00Z', 2, 1, 1);
INSERT INTO tb_topic (title, body, moment, author_id, offer_id, lesson_id) VALUES ('Título do tópico 4', 'Corpo do tópico 4', TIMESTAMP WITH TIME ZONE '2020-12-15T13:00:00Z', 1, 1, 2);
INSERT INTO tb_topic (title, body, moment, author_id, offer_id, lesson_id) VALUES ('Título do tópico 5', 'Corpo do tópico 5', TIMESTAMP WITH TIME ZONE '2020-12-16T13:00:00Z', 1, 1, 2);
INSERT INTO tb_topic (title, body, moment, author_id, offer_id, lesson_id) VALUES ('Título do tópico 6', 'Corpo do tópico 6', TIMESTAMP WITH TIME ZONE '2020-12-17T13:00:00Z', 2, 1, 3);

INSERT INTO tb_topic_likes (topic_id, user_id) VALUES (1, 2);
INSERT INTO tb_topic_likes (topic_id, user_id) VALUES (2, 1);
