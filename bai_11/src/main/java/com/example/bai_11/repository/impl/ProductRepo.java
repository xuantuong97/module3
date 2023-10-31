package com.example.bai_11.repository.impl;

import com.example.bai_11.model.Product;
import com.example.bai_11.repository.IProductRepo;

import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo {
    private static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1,"Iphone 15", 20000000, "New", "Apple"));
        products.add(new Product(2,"Iphone 14", 15000000, "New", "Apple"));
        products.add(new Product(3,"Iphone X", 10000000, "New", "Apple"));
        products.add(new Product(4,"Iphone 13", 16000000, "New", "Apple"));
        products.add(new Product(5,"Iphone 11", 20000000, "New", "Apple"));
        products.add(new Product(6,"Iphone 12", 20000000, "New", "Apple"));
    }

    @Override
    public List<Product> getAll() {
        return products;
    }

    @Override
    public void addProduct(Product product) {
        products.add(product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public void edit(int id, Product product) {
        products.set(id,product);
    }

    @Override
    public Product detail(int index) {
        return products.get(index);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> searchList = new ArrayList<>();
        for(Product product: products){
            if(product.getName().contains(name)){
                searchList.add(product);
            }
        }
        return searchList;
    }
}
