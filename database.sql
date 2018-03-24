CREATE TABLE buyer
(
  name INT NOT NULL,
  contact INT NOT NULL,
  address INT NOT NULL,
  email INT NOT NULL,
  login_id INT NOT NULL,
  login_password INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE package
(
  package_id INT NOT NULL,
  package_name INT NOT NULL,
  PRIMARY KEY (package_id)
);

CREATE TABLE category
(
  category_id INT NOT NULL,
  category_name INT NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE product
(
  name INT NOT NULL,
  price INT NOT NULL,
  description INT NOT NULL,
  create_time INT NOT NULL,
  expiry_time INT NOT NULL,
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id),
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE wishlists
(
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  PRIMARY KEY (user_id, product_id),
  FOREIGN KEY (user_id) REFERENCES buyer(user_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE product_image
(
  image INT NOT NULL,
  product_id INT NOT NULL,
  PRIMARY KEY (image, product_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE seller
(
  name INT NOT NULL,
  login_password INT NOT NULL,
  address INT NOT NULL,
  email INT NOT NULL,
  delivery_status INT NOT NULL,
  seller_id INT NOT NULL,
  login_id INT NOT NULL,
  product_id INT NOT NULL,
  package_id INT NOT NULL,
  PRIMARY KEY (seller_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (package_id) REFERENCES package(package_id)
);

CREATE TABLE seller_contact
(
  contact INT NOT NULL,
  seller_id INT NOT NULL,
  PRIMARY KEY (contact, seller_id),
  FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
);
