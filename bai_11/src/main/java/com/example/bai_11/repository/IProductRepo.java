package com.example.bai_11.repository;

import com.example.bai_11.model.Product;

import java.util.List;

public interface IProductRepo {
    List<Product> getAll();

    void addProduct(Product product);

    void remove(int id);

    void edit(int id, Product product);

    Product detail(int id);

    List<Product> findByName(String name);
}
