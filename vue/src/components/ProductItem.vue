<template>
  <li class="catalog__item">
    <router-link class="catalog__pic" :to="{ name: 'product', params: { id: product.id } }" >
      <img :src="product.image" :alt="product.title">
    </router-link>
    <h3 class="catalog__title">
      <a href="#">
        {{ product.title }}
      </a>
    </h3>

    <span class="catalog__price">
      {{ product.price | numberFormat }} ₽
    </span>
    <ul class="colors colors--black">
      <li class="colors__item" v-for="colorTheme in product.color" :key="colorTheme.colorId">
        <label class="colors__label">
          <input class="colors__radio sr-only" type="radio"
           :value="colorTheme.colorHesh" v-model="color" >
          <span class="colors__value" :style="{ backgroundColor: colorTheme.colorHesh, }">
          </span>
        </label>
      </li>
    </ul>
  </li>
</template>

<script>

import gotoPage from '@/helpers/gotoPage';
import numberFormat from '@/helpers/numberFormat'

export default {
  props: ['product'],
  data() {
    return {
      color: '#73B6EA',
    };
  },
  methods: {
    gotoPage,
  },
  filters: {
    numberFormat,
  },
};
</script>
