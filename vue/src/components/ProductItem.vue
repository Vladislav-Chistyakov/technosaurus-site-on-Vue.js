<template>
  <!-- Если я уберу div, то у меня возникнет ошибка,
  что в корневом элементе (li) нельзя будет использовать фикл фор,
  как убрать див и избавиться об ошибки? -->
<div class="product-item__dusplay">
  <!-- Я про этот v-for -->
  <li class="catalog__item" v-for="(product, index) in products" :key="index">
    <a class="catalog__pic" href="#">
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
      <li class="colors__item">
        <label class="colors__label" for="input">
          <input id="input" class="colors__radio sr-only" type="radio"
            name="color-1" value="#73B6EA" checked="">
          <span class="colors__value" style="background-color: #73B6EA;">
          </span>
        </label>
      </li>
      <li class="colors__item">
        <label class="colors__label" for="input">
          <input class="colors__radio sr-only" type="radio"
            name="color-1" value="#8BE000">
          <span class="colors__value" style="background-color: #8BE000;">
          </span>
        </label>
      </li>
      <li class="colors__item">
        <label class="colors__label" for="input">
          <input class="colors__radio sr-only" type="radio"
            name="color-1" value="#222">
          <span class="colors__value" style="background-color: #222;">
          </span>
        </label>
      </li>
    </ul>
  </li>
</div>
</template>

<script>
export default {
// берём массив продуктов
  props: ['products'],
};
</script>
