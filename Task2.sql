CREATE database testTable

Use testTable

CREATE TABLE [dbo].[Products]
(
  pr_id INT,
  productName NVARCHAR(60),

  PRIMARY KEY (pr_id)
)

INSERT INTO [dbo].[Products] (pr_id, productName)
VALUES (1,'apple')
INSERT INTO [dbo].[Products] (pr_id, productName)
VALUES (2,'pear')
INSERT INTO [dbo].[Products] (pr_id, productName)
VALUES (3,'plum')

CREATE TABLE [dbo].[Categories]
(
  c_id INT,
  categoryName NVARCHAR(60),

  PRIMARY KEY (c_id)
)

INSERT INTO [dbo].[Categories] (c_id, categoryName)
VALUES (1,'A')
INSERT INTO [dbo].[Categories] (c_id, categoryName)
VALUES (2,'B')
INSERT INTO [dbo].[Categories] (c_id, categoryName)
VALUES (3,'C')

CREATE TABLE [dbo].[ProuctsCategories]
(
  pc_id INT,
  pr_id INT,
  c_id INT,

  PRIMARY KEY (pc_id),
  FOREIGN KEY (pr_id) REFERENCES Products (pr_id),
  FOREIGN KEY (c_id) REFERENCES Categories (c_id),
)

INSERT INTO [dbo].[ProuctsCategories] (pc_id, pr_id, c_id)
VALUES (1, 1, 1)
INSERT INTO [dbo].[ProuctsCategories] (pc_id, pr_id, c_id)
VALUES (2, 1, 2)
INSERT INTO [dbo].[ProuctsCategories] (pc_id, pr_id, c_id)
VALUES (3, 2, 1)
INSERT INTO [dbo].[ProuctsCategories] (pc_id, pr_id, c_id)
VALUES (4, 2, 3)
INSERT INTO [dbo].[ProuctsCategories] (pc_id, pr_id, c_id)
VALUES (5, 3, 3)
INSERT INTO [dbo].[ProuctsCategories] (pc_id, pr_id, c_id)
VALUES (6, 3, null)

SELECT p.pr_id, c.categoryName FROM Products p
JOIN ProuctsCategories pc
ON p.pr_id = pc.pr_id
LEFT JOIN Categories c
ON c.c_id = pc.c_id