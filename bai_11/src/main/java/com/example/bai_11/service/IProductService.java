package com.example.bai_11.service;

import com.example.bai_11.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();

    void addProduct(Product product);

    void remove(int id);

    void edit(int id, Product product);

    Product detail(int id);

    List<Product> findByName(String name);
}
