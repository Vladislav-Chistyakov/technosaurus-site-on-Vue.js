<template>
  <li class="catalog__item">
    <a class="catalog__pic" href="#" @click.prevent="gotoPage('product', {id: product.id})">
      <img :src="product.image" :alt="product.title">
    </a>
    <h3 class="catalog__title">
      <a href="#">
        {{ product.title }}
      </a>
    </h3>

    <span class="catalog__price">
      {{ product.price }} ₽
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
import eventBase from '@/eventBase';
export default {
  props: ['product'],
  data() {
    return {
      color: '#73B6EA',
    };
  },
  methods: {
    gotoPage(pageName, pageParams) {
      eventBase.$emit('gotoPage', pageName, pageParams);
    }
  },
};
</script>
