-- Tạo database
CREATE DATABASE QuanLyBanHang;
GO

USE QuanLyBanHang;
GO

-- Bảng Customer
CREATE TABLE Customer (
    cID   INT PRIMARY KEY,
    cName NVARCHAR(50) NOT NULL,
    cAge  INT
);

-- Bảng Product
CREATE TABLE Product (
    pID    INT PRIMARY KEY,
    pName  NVARCHAR(100) NOT NULL,
    pPrice DECIMAL(18,2) NOT NULL
);

-- Bảng Order (Order là từ khóa của SQL nên phải đặt trong [ ])
CREATE TABLE [Order] (
    oID         INT PRIMARY KEY,
    cID         INT NOT NULL,
    oDate       DATETIME NOT NULL DEFAULT GETDATE(),
    oTotalPrice DECIMAL(18,2),
    CONSTRAINT FK_Order_Customer
        FOREIGN KEY (cID) REFERENCES Customer(cID)
);

-- Bảng OrderDetail
CREATE TABLE OrderDetail (
    oID   INT NOT NULL,
    pID   INT NOT NULL,
    odQTY INT NOT NULL,
    CONSTRAINT PK_OrderDetail PRIMARY KEY (oID, pID),
    CONSTRAINT FK_OrderDetail_Order
        FOREIGN KEY (oID) REFERENCES [Order](oID),
    CONSTRAINT FK_OrderDetail_Product
        FOREIGN KEY (pID) REFERENCES Product(pID)
);
GO
