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

import ProductList from '@/components/ProductList.vue';
import BasePagination from '@/components/BasePagination.vue';
import ProductFilter from '@/components/ProductFilter.vue';
import axios from 'axios';
import {API_BASE_URL} from '@/config';


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
      clearTimeout(this.loadProductsTimer);
      this.loadProductsTimer = setTimeout(() => {
        axios.get(`${API_BASE_URL}/api/products`, {
        params: {
          page: this.page,
          limit: this.productsPerPage,
          categoryId: this.filtrCatId,
          minPrice: this.filterPriceFrom,
          maxPrace: this.filterPriceTo,
          colorId: this.filtrColorId,
        },
      })
        .then(response => this.productsData = response.data);
      }, 0);
    },
  },
  watch: {
    page() {
      this.loadProducts();
    },
    filterPriceFrom() {
      this.loadProducts();
    },
    filterPriceTo() {
      this.loadProducts();
    },
    filtrCatId() {
      this.loadProducts();
    },
    filtrColorId() {
      this.loadProducts();
    },
  },
  created() {
    this.loadProducts();
  },
};
</script>

