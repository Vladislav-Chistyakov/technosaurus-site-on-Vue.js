<template>
      <main class="content container">
    <div class="content__top content__top--catalog">
      <h1 class="content__title">
        Каталог
      </h1>
      <span class="content__info">
        152 товара
      </span>
    </div>

    <div class="content__catalog">
      <ProductFilter :price-from.sync="filterPriceFrom" :price-to.sync="filterPriceTo"
      :category-id.sync="filtrCatId" :color-id.sync="filtrColorId" />
      <section class="catalog">
      <ProductList :products="products"/>
      <BasePagination v-model="page" :count="countProducts" :per-page="productsPerPage" />
      </section>

    </div>
  </main>
</template>

<script>

import products from '@/data/products';
import ProductList from '@/components/ProductList.vue';
import BasePagination from '@/components/BasePagination.vue';
import ProductFilter from '@/components/ProductFilter.vue';
import axios from 'axios';


export default {
  components: { ProductList, BasePagination, ProductFilter },
  data() {
    return {
      filterPriceFrom: 0,
      filterPriceTo: 0,
      filtrCatId: 0,
      filtrColorId: 0,
      page: 1,
      productsPerPage: 3,
      productsData: null,
    };
  },
  computed: {
    filteredProducts() {
      let filterProducts = products;
      if (this.filterPriceFrom > 0) {
        filterProducts = filterProducts.filter((product) => product.price > this.filterPriceFrom);
      }
      if (this.filterPriceTo > 0) {
        filterProducts = filterProducts.filter((product) => product.price < this.filterPriceTo);
      }
      if (this.filtrCatId) {
        filterProducts = filterProducts.filter((product) => product.catigoryId === this.filtrCatId);
      }
      if (this.filtrColorId) {
        let array = [];
        let test = null;
        for (let product of filterProducts) {
          test = false
          for (let colorRes of product.color) {
            if (colorRes.colorId === this.filtrColorId) {
              test = true;
              break;
            }
          }
          if (test) array.push(product);
        }
        filterProducts = array;
      }
      return filterProducts;
    },
    products() {
      return this.productsData
      ? this.productsData.items.map(product => {
        return {
          ...product,
          image: product.image.file.url,
        }
      })
      : [];
    },
    countProducts() {
      return this.productsData
      ? this.productsData.pagination.total
      : 0;
    },
  },
  methods: {
    loadProducts() {
      axios.get(`https://vue-study.skillbox.cc/api/products?page=${this.page}&limit=${this.productsPerPage}`)
        .then(response => this.productsData = response.data);
    },
  },
  watch: {
    page() {
      this.loadProducts();
    },
  },
  created() {
    this.loadProducts();
  },
};
</script>

